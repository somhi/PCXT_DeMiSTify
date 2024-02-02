library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.demistify_config_pkg.all;

-- -----------------------------------------------------------------------

entity atlas_top is
	generic (
		ATLAS_CYC_EAR : natural := 0; -- 0 = JOY SEL pin,	1 = EAR pin,  2 = MIDI_WSBD
		ATLAS_CYC_VGA : natural := 1; -- 0 = HDMI,  		1 = VGA
		ATLAS_CYC_KEYB: natural := 0  -- 0=PS2 NO AT1, 1=PS2 AT1, 2=USB NO AT1, 3=USB AT1, 
	);
	port (
		CLK12M : in std_logic;
		CLK_X  : in std_logic;
		KEY0   : in std_logic;
		LED    : out std_logic_vector(7 downto 0);
		-- PS2
		PS2_KEYBOARD_1 	 : inout std_logic;
		PS2_KEYBOARD_2 	 : inout std_logic;
		PDP_4k7			 : out   std_logic;		--USB2PS2
    	PDM_4k7			 : out   std_logic;
		PS2_MOUSE_CLK    : inout std_logic;
		PS2_MOUSE_DAT    : inout std_logic;
		-- SDRAM
		DRAM_CLK   : out std_logic;
		DRAM_CKE   : out std_logic;
		DRAM_ADDR  : out std_logic_vector(12 downto 0);
		DRAM_BA    : out std_logic_vector(1 downto 0);
		DRAM_DQ    : inout std_logic_vector(15 downto 0);
		DRAM_LDQM  : out std_logic;
		DRAM_UDQM  : out std_logic;
		DRAM_CS_N  : out std_logic;
		DRAM_WE_N  : out std_logic;
		DRAM_CAS_N : out std_logic;
		DRAM_RAS_N : out std_logic;
		-- HDMI TDMS [or VGA if ATLAS_CYC_VGA = 1]
		TMDS : out std_logic_vector(7 downto 0) := (others => '0');
		-- AUDIO
		SIGMA_R : out std_logic;
		SIGMA_L : out std_logic;
		-- -- I2S audio		

		-- UART / MIDI
		UART_TXD_MIDI_OUT 		: 	out std_logic;
		UART_RXD_MIDI_WSBD 		: 	in std_logic;
		--PI_CS_MIDI_CLKBD		: 	in std_logic;		

		PI_CLK_I2S_DATA			: 	 out std_logic;	  	-- Composite output 0
		PI_CS_MIDI_CLKBD		: 	 out std_logic;	  	-- Composite output 1

		PI_MISO_I2S_BCLK		: 	 in  std_logic;   			-- UART_CTS
		PI_MOSI_I2S_LRCLK		: 	 out std_logic	:= '0';	  	-- UART_RTS

		-- SHARED PIN_P11: JOY SELECT Output / EAR Input / MIDI
		JOYX_SEL_EAR_MIDI_DABD  : 	inout std_logic := '0';
		-- JOYSTICK 
		JOY1_B2_P9 : in std_logic;
		JOY1_B1_P6 : in std_logic;
		JOY1_UP    : in std_logic;
		JOY1_DOWN  : in std_logic;
		JOY1_LEFT  : in std_logic;
		JOY1_RIGHT : in std_logic;
		-- SD Card
		SD_CS_N_O : out std_logic := '1';
		SD_SCLK_O : out std_logic := '0';
		SD_MOSI_O : out std_logic := '0';
		SD_MISO_I : in std_logic
	);
end entity;

architecture RTL of atlas_top is

	-- System clocks
	signal locked  : std_logic;
	signal reset_n : std_logic;

	-- SPI signals
	signal sd_clk  : std_logic;
	signal sd_cs   : std_logic;
	signal sd_mosi : std_logic;
	signal sd_miso : std_logic;

	-- internal SPI signals
	signal spi_do 	     : std_logic;	
	signal spi_toguest   : std_logic;
	signal spi_fromguest : std_logic;
	signal spi_ss2       : std_logic;
	signal spi_ss3       : std_logic;
	signal spi_ss4       : std_logic;
	signal conf_data0    : std_logic;
	signal spi_clk_int   : std_logic;

	-- PS/2 Keyboard socket - used for second mouse
	signal ps2_keyboard_clk_in  : std_logic;
	signal ps2_keyboard_dat_in  : std_logic;
	signal ps2_keyboard_clk_out : std_logic;
	signal ps2_keyboard_dat_out : std_logic;

	-- PS/2 Mouse
	signal ps2_mouse_clk_in  : std_logic;
	signal ps2_mouse_dat_in  : std_logic;
	signal ps2_mouse_clk_out : std_logic;
	signal ps2_mouse_dat_out : std_logic;

	signal intercept : std_logic;

	-- Video
	signal vga_red   : std_logic_vector(7 downto 0);
	signal vga_green : std_logic_vector(7 downto 0);
	signal vga_blue  : std_logic_vector(7 downto 0);
	signal vga_hsync : std_logic;
	signal vga_vsync : std_logic;

	-- RS232 serial
	signal rs232_rxd : std_logic;
	signal rs232_txd : std_logic;

	-- IO
	signal joya : std_logic_vector(7 downto 0);
	signal joyb : std_logic_vector(7 downto 0);
	signal joyc : std_logic_vector(7 downto 0);
	signal joyd : std_logic_vector(7 downto 0);


	-- -- I2S audio
	-- component audio_top is
	-- Port ( 	
	-- 		clk_50MHz : in STD_LOGIC; -- system clock
	-- 		dac_MCLK : out STD_LOGIC; -- outputs to PMODI2L DAC
	-- 		dac_LRCK : out STD_LOGIC;
	-- 		dac_SCLK : out STD_LOGIC;
	-- 		dac_SDIN : out STD_LOGIC;
	-- 		L_data : 	in std_logic_vector(15 downto 0);  	-- LEFT data (16-bit signed)
	-- 		R_data : 	in std_logic_vector(15 downto 0)  	-- RIGHT data (16-bit signed) 
	-- );
	-- end component;	

	-- DAC AUDIO     
	signal dac_l : signed(15 downto 0);
	signal dac_r : signed(15 downto 0);

	-- I2S 
	signal i2s_mclk : std_logic;

	-- HDMI TDMS signals
	signal clock_vga_s    : std_logic;
	signal clock_dvi_s    : std_logic;
	signal sound_hdmi_l_s : std_logic_vector(15 downto 0);
	signal sound_hdmi_r_s : std_logic_vector(15 downto 0);
	signal tdms_r_s       : std_logic_vector(9 downto 0);
	signal tdms_g_s       : std_logic_vector(9 downto 0);
	signal tdms_b_s       : std_logic_vector(9 downto 0);
	signal tdms_p_s       : std_logic_vector(3 downto 0);
	signal tdms_n_s       : std_logic_vector(3 downto 0);

	-- VGA signals  [ ATLAS_CYC_VGA = 1]
	signal VGA_HS : std_logic;
	signal VGA_VS : std_logic;
	signal VGA_R  : std_logic_vector(1 downto 0);
	signal VGA_G  : std_logic_vector(1 downto 0);
	signal VGA_B  : std_logic_vector(1 downto 0);

	-- VIDEO signals
	signal vga_clk   : std_logic;
	signal hdmi_clk  : std_logic;
	signal vga_blank : std_logic;
	signal vga_x_r   : std_logic_vector(5 downto 0);
	signal vga_x_g   : std_logic_vector(5 downto 0);
	signal vga_x_b   : std_logic_vector(5 downto 0);
	signal vga_x_hs  : std_logic;
	signal vga_x_vs  : std_logic;

	signal composite_output : std_logic_vector(1 downto 0);

	signal CLK50M : std_logic;
	signal CLK48M : std_logic;

	component pll2 is			-- for hdmi output & 50 MHz clock
	    port (
	--  areset : in std_logic;
	    inclk0 : in std_logic;
	    c0 : out std_logic;		--   50 MHz
	    c1 : out std_logic;		--   48 MHz
--		c2 : out std_logic;		--   x5
--		c3 : out std_logic;		--	 x
	    locked : out std_logic
	  );
	end component;

	-- SHARE PIN P11 EAR IN / JOY SEL OUT  
	signal EAR        : std_logic;
	signal JOYX_SEL_O : std_logic;
	signal MIDI_DABD  : std_logic;

	-- USB2PS2
	component USB_PS2
		port (
		clk : in std_logic;
		LedNum : in std_logic;
		LedCaps : in std_logic;
		LedScroll : in std_logic;
		dp : inout std_logic;
		dm : inout std_logic;
		PS2data : out std_logic;
		PS2clock : out std_logic
	);
	end component;

	signal PS2data 		:  std_logic; 
	signal PS2clock 	:  std_logic; 
	signal clk48	    :  std_logic; 

	signal clk_chipset  : std_logic;

begin


	-- SPI
	SD_CS_N_O <= sd_cs;
	SD_MOSI_O <= sd_mosi;
	sd_miso   <= SD_MISO_I;
	SD_SCLK_O <= sd_clk;

	-- External devices tied to GPIOs
	ps2_mouse_dat_in <= PS2_MOUSE_DAT;
	PS2_MOUSE_DAT    <= '0' when ps2_mouse_dat_out = '0' else 'Z';
	ps2_mouse_clk_in <= PS2_MOUSE_CLK;
	PS2_MOUSE_CLK    <= '0' when ps2_mouse_clk_out = '0' else 'Z';

-- ATLAS_CYC_KEYB -- 0 = PS2 NON AT1, 1 = PS2 AT1,  2 = USB NON AT1, 3 = USB AT1, 

	KEYBOARD_0 : if ATLAS_CYC_KEYB = 0 generate -- Keyboard PS2 previous AT1
		ps2_keyboard_dat_in <= PS2_KEYBOARD_1;
		PS2_KEYBOARD_1    <= '0' when ((ps2_keyboard_dat_out = '0') and (intercept = '0') ) else 'Z';
		ps2_keyboard_clk_in <= PS2_KEYBOARD_2;
		PS2_KEYBOARD_2    <= '0' when ((ps2_keyboard_clk_out = '0') and (intercept = '0') ) else 'Z';
	end generate KEYBOARD_0;

	KEYBOARD_1 : if ATLAS_CYC_KEYB = 1 generate -- Keyboard PS2 AT1 
		ps2_keyboard_dat_in <= PS2_KEYBOARD_2;
		PS2_KEYBOARD_2    <= '0' when ((ps2_keyboard_dat_out = '0') and (intercept = '0') ) else 'Z';
		ps2_keyboard_clk_in <= PS2_KEYBOARD_1;
		PS2_KEYBOARD_1    <= '0' when ((ps2_keyboard_clk_out = '0') and (intercept = '0') ) else 'Z';
	end generate KEYBOARD_1;

	KEYBOARD_2 : if ATLAS_CYC_KEYB = 2 generate -- Keyboard USB previous AT1
		-- USB2PS2
		PDP_4k7	<= '0';
		PDM_4k7	<= '0';

		USB_PS2_inst : USB_PS2
		port map (
			clk => CLK48M,
			LedNum =>  '0',
			LedCaps =>  '0',
			LedScroll =>  '0',
			dp => PS2_KEYBOARD_2,
			dm => PS2_KEYBOARD_1,
			PS2data => PS2data,
			PS2clock => PS2clock
		);

		ps2_keyboard_dat_in <= PS2data;
		ps2_keyboard_clk_in <= PS2clock;
	end generate KEYBOARD_2;

	KEYBOARD_3 : if ATLAS_CYC_KEYB = 3 generate -- Keyboard USB AT1 
		-- USB2PS2
		PDP_4k7	<= '0';
		PDM_4k7	<= '0';

		USB_PS2_inst : USB_PS2
		port map (
			clk => CLK48M,
			LedNum =>  '0',
			LedCaps =>  '0',
			LedScroll =>  '0',
			dp => PS2_KEYBOARD_1,
			dm => PS2_KEYBOARD_2,
			PS2data => PS2data,
			PS2clock => PS2clock
		);

		ps2_keyboard_dat_in <= PS2data;
		ps2_keyboard_clk_in <= PS2clock;
	end generate KEYBOARD_3;


	PIN_P11_JOYSEL_0 : if ATLAS_CYC_EAR = 0 generate -- JOY Select Output
		JOYX_SEL_O   <= '1';
		JOYX_SEL_EAR_MIDI_DABD <= JOYX_SEL_O;
		EAR          <= '0';
	end generate PIN_P11_JOYSEL_0;

	PIN_P11_JOYSEL_1 : if ATLAS_CYC_EAR = 1 generate -- EAR Input
		EAR 		<= JOYX_SEL_EAR_MIDI_DABD;
	end generate PIN_P11_JOYSEL_1;

	PIN_P11_JOYSEL_2 : if ATLAS_CYC_EAR = 2 generate -- MIDI WSBD input
		MIDI_DABD 	<= JOYX_SEL_EAR_MIDI_DABD;
		EAR         <= '0';
	end generate PIN_P11_JOYSEL_2;


	joya <= "11" & JOY1_B2_P9 & JOY1_B1_P6 & JOY1_RIGHT & JOY1_LEFT & JOY1_DOWN & JOY1_UP;
	joyb <= (others => '1');
	joyc <= (others => '1');
	joyd <= (others => '1');

	-- -- I2S audio
	-- audio_i2s: audio_top
	-- port map(
	-- 	clk_50MHz => clk_chipset,
	-- 	dac_MCLK  => I2S_MCLK,
	-- 	dac_LRCK  => PI_MOSI_I2S_LRCLK,
	-- 	dac_SCLK  => PI_MISO_I2S_BCLK,
	-- 	dac_SDIN  => PI_CLK_I2S_DATA,
	-- 	L_data    => std_logic_vector(dac_l),
	-- 	R_data    => std_logic_vector(dac_r)
	-- );		


	-- BEGIN VGA ATLAS -------------------  
	VGA_R  <= vga_red(7 downto 6);
	VGA_G  <= vga_green(7 downto 6);
	VGA_B  <= vga_blue(7 downto 6);
	VGA_HS <= vga_hsync;
	VGA_VS <= vga_vsync;

	PINS_HDMI_VGA_1 : if ATLAS_CYC_VGA = 1 generate -- VGA
		TMDS(7) <= VGA_R(1);
		TMDS(6) <= VGA_R(0);
		TMDS(5) <= VGA_G(1);
		TMDS(4) <= VGA_G(0);
		TMDS(3) <= VGA_B(1);
		TMDS(2) <= VGA_B(0);
		TMDS(1) <= VGA_VS;
		TMDS(0) <= VGA_HS;
	end generate PINS_HDMI_VGA_1;
	-- END VGA ATLAS -------------------  

	-- Composite video output
	 PI_CLK_I2S_DATA  <= composite_output(0);
	 PI_CS_MIDI_CLKBD <= composite_output(1);


	-- PLL VIDEO / 50 MHz / 48 USB
	pllvideo : pll2
	port map (
		inclk0		=> CLK12M,				--      
		c0			=> CLK50M,				-- 50 MHz
		c1			=> CLK48M,				-- 48 MHz
--		c2			=> clock_dvi_s,			-- x5	    
--		c3			=> clock_vga_s,			-- x 	   
		locked		=> locked
	);


	guest : component PCXT
		port map(
			CLOCK_27 => CLK12M,
	        RESET_N => reset_n,
			LED => LED(0),
			--SDRAM
			SDRAM_DQ   => DRAM_DQ,
			SDRAM_A    => DRAM_ADDR,
			SDRAM_DQML => DRAM_LDQM,
			SDRAM_DQMH => DRAM_UDQM,
			SDRAM_nWE  => DRAM_WE_N,
			SDRAM_nCAS => DRAM_CAS_N,
			SDRAM_nRAS => DRAM_RAS_N,
			SDRAM_nCS  => DRAM_CS_N,
			SDRAM_BA   => DRAM_BA,
			SDRAM_CLK  => DRAM_CLK,
			SDRAM_CKE  => DRAM_CKE,
			--UART
			UART_TX  => UART_TXD_MIDI_OUT,
			UART_RX  => UART_RXD_MIDI_WSBD,

			UART_CTS  => PI_MISO_I2S_BCLK,
			UART_RTS  => PI_MOSI_I2S_LRCLK,

			--SPI
			SPI_DO     => spi_do,
			SPI_DI     => spi_toguest,
			SPI_SCK    => spi_clk_int,
			SPI_SS2    => spi_ss2,
			SPI_SS3    => spi_ss3,
			SPI_SS4    => spi_ss4,
			CONF_DATA0 => conf_data0,
			--VGA
			VGA_HS    => vga_hsync,
			VGA_VS    => vga_vsync,
			VGA_R     => vga_red,
			VGA_G     => vga_green,
			VGA_B     => vga_blue,

			COMPOSITE_OUT => composite_output,

			--AUDIO
			DAC_L   => dac_l,
			DAC_R   => dac_r,
			CLK_CHIPSET => clk_chipset,

			AUDIO_L => SIGMA_L,
			AUDIO_R => SIGMA_R,

			PS2K_CLK_IN => ps2_keyboard_clk_in or intercept, -- Block keyboard when OSD is active
			PS2K_DAT_IN => ps2_keyboard_dat_in,
			PS2K_CLK_OUT => ps2_keyboard_clk_out,
			PS2K_DAT_OUT => ps2_keyboard_dat_out,
	
			PS2K_MOUSE_CLK_IN => ps2_mouse_clk_in,
			PS2K_MOUSE_DAT_IN => ps2_mouse_dat_in,
			PS2K_MOUSE_CLK_OUT => ps2_mouse_clk_out,
			PS2K_MOUSE_DAT_OUT => ps2_mouse_dat_out

		);


		-- Pass internal signals to external SPI interface
		sd_clk <= spi_clk_int;
		spi_do <= sd_miso when spi_ss4='0' else 'Z'; -- to guest
		spi_fromguest <= spi_do;  -- to control CPU

		controller : entity work.substitute_mcu
			generic map(
				sysclk_frequency => 500,
		--		SPI_FASTBIT=>3,			
		--		SPI_INTERNALBIT=>2,		--needed to avoid hungs on the OSD
				debug     => false,
				jtag_uart => false
			)
			port map(
				clk       => CLK50M,	
				reset_in  => KEY0,			--reset_in when 0
				reset_out => reset_n,		--reset_out when 0

				-- SPI signals
				spi_miso      => sd_miso,
				spi_mosi      => sd_mosi,
				spi_clk       => spi_clk_int,
				spi_cs        => sd_cs,
				spi_fromguest => spi_fromguest,
				spi_toguest   => spi_toguest,
				spi_ss2       => spi_ss2,
				spi_ss3       => spi_ss3,
				spi_ss4       => spi_ss4,
				conf_data0    => conf_data0,

				-- PS/2 signals
				ps2k_clk_in  => ps2_keyboard_clk_in,
				ps2k_dat_in  => ps2_keyboard_dat_in,
				-- ps2k_clk_out => ps2_keyboard_clk_out,
				-- ps2k_dat_out => ps2_keyboard_dat_out,

				-- ps2m_clk_in  => ps2_mouse_clk_in,
				-- ps2m_dat_in  => ps2_mouse_dat_in,
				-- ps2m_clk_out => ps2_mouse_clk_out,
				-- ps2m_dat_out => ps2_mouse_dat_out,

				-- Buttons
				buttons => (0 => '1', others => '1'),	-- 0 = opens OSD

				-- JOYSTICKS
				joy1 => joya,

				-- UART
				rxd       => rs232_rxd,
				txd       => rs232_txd,
				--
				intercept => intercept
			);

	end rtl;
