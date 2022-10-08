//============================================================================
//
//  This program is free software; you can redistribute it and/or modify it
//  under the terms of the GNU General Public License as published by the Free
//  Software Foundation; either version 2 of the License, or (at your option)
//  any later version.
//
//  This program is distributed in the hope that it will be useful, but WITHOUT
//  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
//  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
//  more details.
//
//  You should have received a copy of the GNU General Public License along
//  with this program; if not, write to the Free Software Foundation, Inc.,
//  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
//
//============================================================================

module PCXT
(
	input         CLOCK_27,
	input 		  RESET_N,
	output        LED,

	inout  [15:0] SDRAM_DQ,
	output [12:0] SDRAM_A,
	output        SDRAM_DQML,
	output        SDRAM_DQMH,
	output        SDRAM_nWE,
	output        SDRAM_nCAS,
	output        SDRAM_nRAS,
	output        SDRAM_nCS,
	output  [1:0] SDRAM_BA,
	output        SDRAM_CLK,
	output        SDRAM_CKE,

	output        SPI_DO,
	input         SPI_DI,
	input         SPI_SCK,
	input         SPI_SS2,
	input         SPI_SS3,
	input         SPI_SS4,
	input         CONF_DATA0,

	output  [7:0] VGA_R,
	output  [7:0] VGA_G,
	output  [7:0] VGA_B,
	output        VGA_HS,
	output        VGA_VS,

	output        CLK_VIDEO,	//Base video clock. Usually equals to CLK_SYS.
	output        VGA_DE,    	// = ~(VBlank | HBlank)


	output        AUDIO_L,
	output        AUDIO_R, 

	`ifdef DEMISTIFY
	output [15:0]  DAC_L, 
	output [15:0]  DAC_R, 
	`endif

	//SD-SPI
	// output        SD_SCK,
	// output        SD_MOSI,
	// input         SD_MISO,
	// output        SD_CS,
	// input         SD_CD,

	input         UART_RX,
	output        UART_TX,
	input		  UART_CTS,
	output 		  UART_RTS,

	// input         UART2_RX,
	// output        UART2_TX,

//	input         PS2K_CLK_IN,
//	input         PS2K_DAT_IN,
//	output        PS2K_CLK_OUT,
//	output        PS2K_DAT_OUT

//  input         PS2K_MOUSE_CLK_IN,
//  input         PS2K_MOUSE_DAT_IN,
//  output        PS2K_MOUSE_CLK_OUT,
//  output        PS2K_MOUSE_DAT_OUT

	inout		  PS2_MOUSE_CLK,
	inout		  PS2_MOUSE_DAT
);

wire CLK_50M;
assign CLK_50M = CLOCK_27;
assign LED  =  ~ioctl_download;   //1'b1;

///////// Default values for ports not used in this core /////////
//assign {SRAM_Q, SRAM_A, SRAM_WE} = 'Z;
//assign SRAM_Q[15:8] = 8'bZZZZZZZZ;
//assign {SDRAM_DQ, SDRAM_A, SDRAM_BA, SDRAM_CLK, SDRAM_CKE, SDRAM_DQML, SDRAM_DQMH, SDRAM_nWE, SDRAM_nCAS, SDRAM_nRAS, SDRAM_nCS} = 'Z;

//////////////////////////////////////////////////////////////////

// Status Bit Map:
//              Upper                          Lower
// 0         1         2         3          4         5         6
// 01234567890123456789012345678901 23456789012345678901234567890123
// 0123456789ABCDEFGHIJKLMNOPQRSTUV 0123456789ABCDEFGHIJKLMNOPQRSTUV
// XDDXX XDDDXXXXXXXXXXXXXXXXXXXXXX      


`include "build_id.v" 
parameter CONF_STR = {		// options order: 0,1,2,...
	"PCXT;;",
	"O3,Model,IBM PCXT,Tandy 1000;",
	"OHI,CPU Speed,4.77MHz,7.16MHz,14.318MHz;",
	"OLM,UART Speed,1200..115200bps,115200..921600bps;",
	// 
	"P1,BIOS;",
	"P1F,ROM,PCXT BIOS:;",
	"P1F,ROM,Tandy BIOS:;",
	"P1F,ROM,EC00 BIOS:;",
	"P1OUV,BIOS Writable,None,EC00,PCXT/Tandy,All;",
	//"P1,FDD & HDD;",
	//"P1S1,IMGIMA,FDD Image:;",
	//"P1S0,IMG,HDD Image:;",
	//"P1OJK,Write Protect,None,FDD,HDD,FDD & HDD;",
	//"P1OLM,Speed,115200,230400,460800,921600;",
	//
	"P2,Audio & Video;",
	"P2OA,Adlib,On,Invisible;",
	//REUSED//"P2O12,Scandoubler Fx,None,HQ2x,CRT 25%,CRT 50%;",
	//REUSED//"P2O89,Aspect ratio,Original,Full Screen,[ARC1],[ARC2];",
	//"P2OT,Border,No,Yes;",
	"P2O4,Video Output,CGA/Tandy,MDA;",
	"P2OEG,Display,Full Color,Green,Amber,B&W,Red,Blue,Fuchsia,Purple;",
	"P2O1,YPbPr,No,Yes;",
	"P2O2,Composite Blending,No,Yes;",
	"P2O7,Composite,No,Yes;",
	"P2O8,Display mode disable,No,Yes;",
	"P2O9,OSD disable,No,Yes;",
	//REUSED//"P2O7,Splash Screen,Yes,No;",
	//
	"P3,Hardware;",
	"P3OB,Lo-tech 2MB EMS,Enabled,Disabled;",
	"P3OCD,EMS Frame,A000,C000,D000;",
	"P3ONO,Joystick 1, Analog, Digital, Disabled;",
	"P3OPQ,Joystick 2, Analog, Digital, Disabled;",
	"P3OR,Sync Joy to CPU Speed,No,Yes;",
	"P3OS,Swap Joysticks,No,Yes;",
	//
	"T0,Reset;",
	"V,v",`BUILD_DATE 
};

wire forced_scandoubler;
wire  [1:0] buttons;
wire [63:0] status;

//Keyboard Ps2
wire        ps2_kbd_clk_out;
wire        ps2_kbd_data_out;
wire        ps2_kbd_clk_in;
wire        ps2_kbd_data_in;

//Mouse PS2
// wire        ps2_mouse_clk_out;
// wire        ps2_mouse_data_out;
// wire        ps2_mouse_clk_in;
// wire        ps2_mouse_data_in;

wire        ioctl_download;
wire  [7:0] ioctl_index;
wire        ioctl_wr;
wire [24:0] ioctl_addr;
wire  [7:0] ioctl_data;

wire        adlibhide = status[10];

wire [31:0] joy0, joy1;
wire [31:0] joya0, joya1;
wire [4:0]  joy_opts = status[27:23];

// .PS2DIV(2000) value is adequate		// without .PS2BIDIR(1) do not boot 

user_io #(.STRLEN($size(CONF_STR)>>3), .PS2DIV(2000), .PS2BIDIR(1)) user_io (
	.conf_str      ( CONF_STR       ),
	.clk_sys       ( clk_chipset    ),

	// the spi interface
	.SPI_CLK        ( SPI_SCK       ),
	.SPI_SS_IO      ( CONF_DATA0    ),
	.SPI_MISO       ( SPI_DO        ),   // tristate handling inside user_io
	.SPI_MOSI       ( SPI_DI        ),
	
	.status         ( status        ),
	.buttons        ( buttons       ),
	.scandoubler_disable ( forced_scandoubler ),

	.ps2_kbd_clk_i		(ps2_kbd_clk_out),
	.ps2_kbd_data_i		(ps2_kbd_data_out),
	.ps2_kbd_clk		(ps2_kbd_clk_in),
	.ps2_kbd_data		(ps2_kbd_data_in),
//  .ps2_mouse_clk_i	(ps2_mouse_clk_out),
//	.ps2_mouse_data_i	(ps2_mouse_data_out),
//	.ps2_mouse_clk		(ps2_mouse_clk_in),
//	.ps2_mouse_data		(ps2_mouse_data_in),

	.joystick_0(joy0),
	.joystick_1(joy1),
	.joystick_analog_0(joya0),
	.joystick_analog_1(joya1)
);


data_io data_io (
	.clk_sys    ( clk_chipset ),
	.SPI_SCK    ( SPI_SCK ),
	.SPI_SS2    ( SPI_SS2 ),
	.SPI_DI     ( SPI_DI  ),
	.SPI_DO     ( SPI_DO  ),

	.ioctl_download ( ioctl_download ),
//  .ioctl_upload   ( upload_active  ),
	.ioctl_index    ( ioctl_index    ),

    // ram interface
	.ioctl_wr   ( ioctl_wr     ),
	.ioctl_addr ( ioctl_addr   ),
	.ioctl_dout ( ioctl_data   )
//  .ioctl_din  ( ioctl_din    )
);

///////////////////////   CLOCKS   ///////////////////////////////

wire clk_sys;
wire pll_locked;

wire clk_100;
wire clk_28_636;
wire clk_56_875;
//wire clk_113_750;
reg clk_14_318 = 1'b0;
reg clk_7_16 = 1'b0;
wire clk_4_77;
wire clk_cpu;
wire pclk;
wire clk_opl2;
wire clk_chipset;
wire peripheral_clock;
wire clk_uart;
wire clk_uart2;


`ifdef DEMISTIFY_SOCKIT

assign SDRAM_CLK = clk_chipset;

pll pll
(
	.refclk(CLK_50M),
	.rst(0),
	.outclk_0(clk_100),			//100
	.outclk_1(clk_56_875),		//56.875
	.outclk_2(clk_28_636),		//28.636
	.outclk_3(clk_uart),		//14.7456
	.outclk_4(clk_opl2),		//3.58
	.outclk_5(clk_chipset),		//50
//	.outclk_6(clk_113_750),		//113.75
	.locked(pll_locked)
);

`else  

pll pll
(
	.inclk0(CLK_50M),
	.areset(1'b0),
	.c0(clk_100),			//100
	.c1(clk_chipset),		//50
	.c2(SDRAM_CLK),			//50 -2ns
	.c3(clk_uart),			//14.7456 MHz
	.c4(clk_opl2),			//3.575
	.locked(pll_locked)
);

pllvideo pllvideo
(
	.inclk0(CLK_50M),
	.areset(1'b0),
	.c0(clk_28_636),		//28.4375
	.c1(clk_56_875),		//56.875
	.c2(clk_uart2),			//1.8432 MHz
//	.c3(),			
//	.c4(),
	.locked()
);

`endif

wire reset_wire = !RESET_N | status[0] | buttons[1] | !pll_locked | splashscreen;
wire reset_sdram_wire = !RESET_N | !pll_locked;

//////////////////////////////////////////////////////////////////

wire HBlank;
wire HSync;
wire VBlank;
wire VSync;
wire ce_pixel;

assign CLK_VIDEO = clk_56_875;

always @(posedge clk_28_636) 
	clk_14_318 <= ~clk_14_318; // 14.318Mhz

assign ce_pixel = 1'b1;

always @(posedge clk_14_318)
	clk_7_16 <= ~clk_7_16; // 7.16Mhz

clk_div3 clk_normal // 4.77MHz
(
	.clk(clk_14_318),
	.clk_out(clk_4_77)
);

always @(posedge clk_4_77)
	peripheral_clock <= ~peripheral_clock; // 2.385Mhz

logic  biu_done;
logic  turbo_mode;
logic  [1:0] clk_select;

always @(posedge clk_chipset, posedge reset) begin
    if (reset) begin
        turbo_mode  <= 1'b0;
        clk_select  <= 2'b00;
    end
    else if (biu_done) begin
        turbo_mode  <= (status[18:17] == 2'b01 || status[18:17] == 2'b10);
        clk_select  <= status[18:17];
    end
    else begin
        turbo_mode  <= turbo_mode;
        clk_select  <= clk_select;
    end
end

logic  clk_cpu_ff_1;
logic  clk_cpu_ff_2;

logic  pclk_ff_1;
logic  pclk_ff_2;

always @(posedge clk_chipset, posedge reset) begin
    if (reset) begin
        clk_cpu_ff_1 <= 1'b0;
        clk_cpu_ff_2 <= 1'b0;
        clk_cpu      <= 1'b0;
        pclk_ff_1    <= 1'b0;
        pclk_ff_2    <= 1'b0;
        pclk         <= 1'b0;
    end
    else begin
        clk_cpu_ff_1 <= (clk_select == 2'b10) ? clk_14_318 : (clk_select == 2'b01) ? clk_7_16 : clk_4_77;
        clk_cpu_ff_2 <= clk_cpu_ff_1;
        clk_cpu      <= clk_cpu_ff_2;
        pclk_ff_1    <= peripheral_clock;
        pclk_ff_2    <= pclk_ff_1;
        pclk         <= pclk_ff_2;
    end
end

logic   clk_opl2_ff_1;
logic   clk_opl2_ff_2;
logic   clk_opl2_ff_3;
logic   cen_opl2;

always @(posedge clk_chipset) begin
    clk_opl2_ff_1 <= clk_opl2;
    clk_opl2_ff_2 <= clk_opl2_ff_1;
    clk_opl2_ff_3 <= clk_opl2_ff_2;
    cen_opl2 <= clk_opl2_ff_2 & ~clk_opl2_ff_3;
end


//////////////////////////////////////////////////////////////////

logic reset = 1'b1;
logic [15:0] reset_count = 16'h0000;
logic reset_sdram = 1'b1;
logic [15:0] reset_sdram_count = 16'h0000;

always @(posedge CLK_50M, posedge reset_wire) begin
	if (reset_wire) begin
		reset <= 1'b1;
		reset_count <= 16'h0000;
	end
	else if (reset) begin
		if (reset_count != 16'hffff) begin
			reset <= 1'b1;
			reset_count <= reset_count + 16'h0001;
		end
		else begin
			reset <= 1'b0;
			reset_count <= reset_count;
		end
	end 
	else begin
		reset <= 1'b0;
		reset_count <= reset_count;
	end
end

logic reset_cpu_ff = 1'b1;
logic reset_cpu = 1'b1;
logic [15:0] reset_cpu_count = 16'h0000;

always @(negedge clk_chipset, posedge reset) begin
	if (reset)
		reset_cpu_ff <= 1'b1;
	else
		reset_cpu_ff <= reset;
end

reg tandy_mode = 0;

always @(negedge clk_chipset, posedge reset) begin
	if (reset) begin
		tandy_mode <= status[3];		
		reset_cpu <= 1'b1;
		reset_cpu_count <= 16'h0000;
	end
	else if (reset_cpu) begin
		reset_cpu <= reset_cpu_ff;
		reset_cpu_count <= 16'h0000;
	end
	else begin
		if (reset_cpu_count != 16'h002A) begin
			reset_cpu <= reset_cpu_ff;
			reset_cpu_count <= reset_cpu_count + 16'h0001;
		end
		else begin
			reset_cpu <= 1'b0;
			reset_cpu_count <= reset_cpu_count;
		end
	end
end

always @(posedge CLK_50M, posedge reset_sdram_wire) begin
	if (reset_sdram_wire) begin
		reset_sdram <= 1'b1;
		reset_sdram_count <= 16'h0000;
	end
	else if (reset_sdram) begin
		if (reset_sdram_count != 16'hffff) begin
			reset_sdram <= 1'b1;
			reset_sdram_count <= reset_sdram_count + 16'h0001;
		end
		else begin
			reset_sdram <= 1'b0;
			reset_sdram_count <= reset_sdram_count;
		end
	end 
	else begin
		reset_sdram <= 1'b0;
		reset_sdram_count <= reset_sdram_count;
	end
end

/////////////////////   BIOS LOADER   ////////////////////////////
	reg [4:0]  bios_load_state = 4'h0;
	reg        bios_protect_flag;
    reg        bios_access_request;
	reg [19:0] bios_access_address;
	reg [7:0]  bios_write_data;
	reg        bios_write_n;
	reg [7:0]  bios_write_wait_cnt;
	reg        tandy_bios_write;

	wire select_pcxt  = (ioctl_index[5:0] <  2) && (ioctl_addr[24:16] == 9'b000000000);
	wire select_tandy = (ioctl_index[5:0] == 2) && (ioctl_addr[24:16] == 9'b000000000);
	wire select_xtide = ioctl_index == 3;

	wire [19:0] bios_access_address_wire = select_pcxt  ? { 4'b1111, ioctl_addr[15:0]} :
	                                       select_tandy ? { 4'b1111, ioctl_addr[15:0]} :
	                                       select_xtide ? { 6'b111011, ioctl_addr[13:0]} :
	                                                      20'hFFFFF;

	wire bios_load_n = ~(ioctl_download & (select_pcxt | select_tandy | select_xtide));

	always @(posedge clk_chipset, posedge reset_sdram) begin
		if (reset_sdram) begin
			bios_protect_flag   <= 1'b1;
			bios_access_request <= 1'b0;
			bios_access_address <= 20'hFFFFF;
			bios_write_data     <= 8'hFF;
			bios_write_n        <= 1'b1;
			bios_write_wait_cnt <= 'h0;
			tandy_bios_write    <= 1'b0;
		//	ioctl_wait          <= 1'b1;
			bios_load_state     <= 4'h00;
		end
		else if (~initilized_sdram) begin
			bios_protect_flag   <= 1'b1;
			bios_access_request <= 1'b0;
			bios_access_address <= 20'hFFFFF;
			bios_write_data     <= 8'hFF;
			bios_write_n        <= 1'b1;
			bios_write_wait_cnt <= 'h0;
		//	ioctl_wait          <= 1'b1;
			bios_load_state     <= 4'h00;
		end
		else begin
			casez (bios_load_state)
				4'h00: begin
					bios_protect_flag   <= 1'b1;
					bios_access_address <= 20'hFFFFF;
					bios_write_data     <= 8'hFF;
					bios_write_n        <= 1'b1;
					bios_write_wait_cnt <= 'h0;
					tandy_bios_write    <= 1'b0;

					if (~ioctl_download) begin
						bios_access_request <= 1'b0;
		//				ioctl_wait          <= 1'b0;
					end
					else begin
						bios_access_request <= 1'b1;
		//				ioctl_wait          <= 1'b1;
					end

					if ((ioctl_download) && (~processor_ready) && (address_direction))
						bios_load_state <= 4'h01;
					else
						bios_load_state <= 4'h00;
				end
				4'h01: begin
					bios_protect_flag   <= 1'b0;
					bios_access_request <= 1'b1;
					tandy_bios_write    <= select_tandy;
					if (~ioctl_download) begin
						bios_access_address <= 20'hFFFFF;
						bios_write_data     <= 8'hFF;
						bios_write_n        <= 1'b1;
						bios_write_wait_cnt <= 'h0;
		//				ioctl_wait          <= 1'b0;
						bios_load_state     <= 4'h00;
					end
					else if ((~ioctl_wr) || (bios_load_n)) begin
						bios_access_address <= 20'hFFFFF;
						bios_write_data     <= 8'hFF;
						bios_write_n        <= 1'b1;
						bios_write_wait_cnt <= 'h0;
		//				ioctl_wait          <= 1'b0;
						bios_load_state     <= 4'h01;
					end
					else begin
						bios_access_address <= bios_access_address_wire;
						bios_write_data     <= ioctl_data;
						bios_write_n        <= 1'b1;
						bios_write_wait_cnt <= 'h0;
		//				ioctl_wait          <= 1'b1;
						bios_load_state     <= 4'h02;
					end
				end
				4'h02: begin
					bios_protect_flag   <= 1'b0;
					bios_access_request <= 1'b1;
					bios_access_address <= bios_access_address;
					bios_write_data     <= bios_write_data;
					tandy_bios_write    <= select_tandy;
		//			ioctl_wait          <= 1'b1;
					bios_write_wait_cnt <= bios_write_wait_cnt + 'h1;

					if (bios_write_wait_cnt != 'd20) begin
						bios_write_n        <= 1'b0;
						bios_load_state     <= 4'h02;
					end
					else begin
						bios_write_n        <= 1'b1;
						bios_load_state     <= 4'h03;
					end
				end
				4'h03: begin
					bios_protect_flag   <= 1'b0;
					bios_access_request <= 1'b1;
					bios_access_address <= 20'hFFFFF;
					bios_write_data     <= 8'hFF;
					bios_write_n        <= 1'b1;
					tandy_bios_write    <= 1'b0;
		//			ioctl_wait          <= 1'b1;
					bios_write_wait_cnt <= bios_write_wait_cnt + 'h1;

					if (bios_write_wait_cnt != 'd40)
						bios_load_state     <= 4'h03;
                    else
						bios_load_state     <= 4'h01;
                end
				default: begin
					bios_protect_flag   <= 1'b1;
					bios_access_request <= 1'b0;
					bios_access_address <= 20'hFFFFF;
					bios_write_data     <= 8'hFF;
					bios_write_n        <= 1'b1;
					bios_write_wait_cnt <= 'h0;
					tandy_bios_write    <= 1'b0;
		//			ioctl_wait          <= 1'b0;
					bios_load_state     <= 4'h00;
				end
			endcase
		end
	end

//////////////////////////////////////////////////////////////////

	reg [24:0] splash_cnt = 0;
	reg [3:0] splash_cnt2 = 0;
	reg splashscreen = 1;
	
	always @ (posedge clk_14_318) begin
	
		if (splashscreen) begin
			if (1'b0)  				  //status[7]
				splashscreen <= 0;
			else if(splash_cnt2 == 5) // 5 seconds delay
				splashscreen <= 0;
			else if (splash_cnt == 14318000) begin // 1 second at 14.318Mhz
					splash_cnt2 <= splash_cnt2 + 1;				
					splash_cnt <= 0;
				end
			else
				splash_cnt <= splash_cnt + 1;			
		end
	
	end
	
    //
    // Input F/F PS2_CLK
    //
    logic   device_clock_ff;
    logic   device_clock;

    always_ff @(negedge clk_chipset, posedge reset)
    begin
        if (reset) begin
            device_clock_ff <= 1'b0;
            device_clock    <= 1'b0;
        end
        else begin
            device_clock_ff <= ps2_kbd_clk_in;
            device_clock    <= device_clock_ff ;
        end
    end


    //
    // Input F/F PS2_DAT
    //
    logic   device_data_ff;
    logic   device_data;

    always_ff @(negedge clk_chipset, posedge reset)
    begin
        if (reset) begin
            device_data_ff <= 1'b0;
            device_data    <= 1'b0;
        end
        else begin
            device_data_ff <= ps2_kbd_data_in;
            device_data    <= device_data_ff;
        end
    end
	

	 always @(posedge clk_100) begin
		if (address_latch_enable)
			cpu_address <= cpu_ad_out;
		else
			cpu_address <= cpu_address;
	end	


    wire [7:0] data_bus;
    wire INTA_n;	
    wire [19:0] cpu_ad_out;
    reg  [19:0] cpu_address;
    wire [7:0] cpu_data_bus;    
    wire processor_ready;	
    wire interrupt_to_cpu;
    wire address_latch_enable;
    wire address_direction;

    wire lock_n;
    wire [2:0]processor_status;

    wire [3:0]   dma_acknowledge_n;
	 
	 logic   [7:0]   port_b_out;
    logic   [7:0]   port_c_in;	 
	 reg     [7:0]   sw;
	 
	 assign  sw = mda_mode ? 8'b00111101 : 8'b00101101; // PCXT DIP Switches (MDA or CGA 80)
	 assign  port_c_in[3:0] = port_b_out[3] ? sw[7:4] : sw[3:0];

	wire tandy_bios_flag = bios_write_n ? tandy_mode : tandy_bios_write;

   CHIPSET u_CHIPSET (
        .clock                              (clk_chipset),
        .cpu_clock                            (clk_cpu),
		  .clk_sys                            (clk_chipset),
		  .peripheral_clock                   (pclk),
		  .turbo_mode                         (status[18:17]),
		  .color							(screen_mode == 3'd0),
        .reset                              (reset_cpu),
        .sdram_reset                        (reset_sdram),
        .cpu_address                        (cpu_address),
        .cpu_data_bus                       (cpu_data_bus),
        .processor_status                   (processor_status),
        .processor_lock_n                   (lock_n),
 //     .processor_transmit_or_receive_n    (processor_transmit_or_receive_n),
		  .processor_ready                    (processor_ready),
        .interrupt_to_cpu                   (interrupt_to_cpu),
        .splashscreen                       (splashscreen),
		  .video_output                       (mda_mode),
        .clk_vga_cga                        (clk_28_636),
        .enable_cga                         (1'b1),
        .clk_vga_mda                        (clk_56_875),
        .enable_mda                         (1'b1),
		.mda_rgb                            (2'b10), // always B&W - monochrome monitor tint handled down below
        //.de_o                               (VGA_DE),
        .VGA_R                              (r_in),
        .VGA_G                              (g_in),
        .VGA_B                              (b_in),
        .VGA_HSYNC                          (vga_hs),
        .VGA_VSYNC                          (vga_vs),
		.VGA_HBlank	  				        (HBlank),
		.VGA_VBlank							(VBlank),
		.scandoubler						(~forced_scandoubler),
		.composite_on						(composite_on),
//      .address                            (address),
        .address_ext                        (bios_access_address),
        .ext_access_request                 (bios_access_request),
        .address_direction                  (address_direction),
        .data_bus                           (data_bus),
        .data_bus_ext                       (bios_write_data),
//      .data_bus_direction                 (data_bus_direction),
        .address_latch_enable               (address_latch_enable),
//      .io_channel_check                   (),
        .io_channel_ready                   (1'b1),
        .interrupt_request                  (0),    // use?	-> It does not seem to be necessary.
//      .io_read_n                          (io_read_n),
        .io_read_n_ext                      (1'b1),
//      .io_read_n_direction                (io_read_n_direction),
//      .io_write_n                         (io_write_n),
        .io_write_n_ext                     (1'b1),
//      .io_write_n_direction               (io_write_n_direction),
//      .memory_read_n                      (memory_read_n),
        .memory_read_n_ext                  (1'b1),
//      .memory_read_n_direction            (memory_read_n_direction),
//      .memory_write_n                     (memory_write_n),
        .memory_write_n_ext                 (bios_write_n),
//      .memory_write_n_direction           (memory_write_n_direction),
        .dma_request                        (0),    // use?	-> I don't know if it will ever be necessary, at least not during testing.
        .dma_acknowledge_n                  (dma_acknowledge_n),
//      .address_enable_n                   (address_enable_n),
//      .terminal_count_n                   (terminal_count_n)
        .port_b_out                         (port_b_out),
		  .port_c_in                          (port_c_in),
	     .speaker_out                        (speaker_out),   
         .ps2_clock                          (device_clock),
	     .ps2_data                           (device_data),
	     .ps2_clock_out                      (ps2_kbd_clk_out),
	     .ps2_data_out                       (ps2_kbd_data_out),
//       .ps2_clock                          (PS2K_CLK_IN),
//	     .ps2_data                           (PS2K_DAT_IN),
//	     .ps2_clock_out                      (PS2K_CLK_OUT),
//	     .ps2_data_out                       (PS2K_DAT_OUT),
		  .joy_opts                           (joy_opts),                          //Joy0-Disabled, Joy0-Type, Joy1-Disabled, Joy1-Type, turbo_sync
        .joy0                               (status[28] ? joy1 : joy0),
        .joy1                               (status[28] ? joy0 : joy1),
		  .joya0                              (status[28] ? joya1[15:0] : joya0[15:0]),
		  .joya1                              (status[28] ? joya0[15:0] : joya1[15:0]),
		  .clk_en_opl2                        (cen_opl2), // clk_en_opl2
		  .jtopl2_snd_e                       (jtopl2_snd_e),
		  .tandy_snd_e                        (tandy_snd_e),
		  .adlibhide                          (adlibhide),
		  .tandy_video                        (tandy_mode),
		  .tandy_bios_flag                    (tandy_bios_flag),


		`ifdef NO_COM2
		  .clk_uart                          (clk_uart_en),
		  .uart_rx                           (UART_RX),
		  .uart_tx                           (UART_TX),
		  .uart_cts_n                        (UART_CTS),
		//.uart_dcd_n                        (uart_dcd),
		//.uart_dsr_n                        (uart_dsr),
		  .uart_rts_n                        (UART_RTS),
		//.uart_dtr_n                        (uart_dtr),

		// NO COM2 UART PORT

		`else
		  .clk_uart                           ((status[22:21] == 2'b00) ? clk_uart2 : clk_uart_en),
	      .uart_rx                            (UART_RX),
	      .uart_tx                            (UART_TX),
	      .uart_cts_n                         (UART_CTS),
	    //.uart_dcd_n                         (uart_dcd),
	    //.uart_dsr_n                         (uart_dsr),
	      .uart_rts_n                         (UART_RTS),
	    //.uart_dtr_n                         (uart_dtr),
		  .clk_uart2                          ((status[22:21] == 2'b00) ? clk_uart2 : clk_uart_en),
	      .uart2_rx                           (UART2_RX),
	      .uart2_tx                           (UART2_TX),
	      .uart2_cts_n                        (uart2_cts),
	    //.uart2_dcd_n                        (uart2_dcd),
	    //.uart2_dsr_n                        (uart2_dsr),
	      .uart2_rts_n                        (uart2_rts),
	    //.uart2_dtr_n                        (uart2_dtr),
		`endif
		
		  .enable_sdram                       (1'b1),
		 .initilized_sdram                   (initilized_sdram),
		  .sdram_clock                        (clk_chipset),
		  .sdram_address                      (SDRAM_A),
        .sdram_cke                          (SDRAM_CKE),
        .sdram_cs                           (SDRAM_nCS),
        .sdram_ras                          (SDRAM_nRAS),
        .sdram_cas                          (SDRAM_nCAS),
        .sdram_we                           (SDRAM_nWE),
        .sdram_ba                           (SDRAM_BA),
        .sdram_dq_in                        (SDRAM_DQ_IN),
        .sdram_dq_out                       (SDRAM_DQ_OUT),
        .sdram_dq_io                        (SDRAM_DQ_IO),
        .sdram_ldqm                         (SDRAM_DQML),
        .sdram_udqm                         (SDRAM_DQMH),
		  .ems_enabled                        (~status[11]),
		  .ems_address                        (status[13:12]),
        .bios_protect_flag                  (bios_protect_flag),
		  .bios_writable                      (status[31:30])
    );
	
	wire [15:0] SDRAM_DQ_IN;
	wire [15:0] SDRAM_DQ_OUT;
	wire        SDRAM_DQ_IO;
	wire        initilized_sdram;
	

////////////////////////////  AUDIO  /////////////////////////////////// 

	wire speaker_out;
	wire  [7:0]   tandy_snd_e;
	wire tandy_snd_rdy;

	wire [15:0] jtopl2_snd_e;	
	//wire [16:0]sndmix = (({jtopl2_snd_e[15], jtopl2_snd_e}) << 2) + (speaker_out << 15) + {tandy_snd_e, 6'd0}; // signed mixer
	//wire [16:0]sndmix = (({jtopl2_snd_e[15], jtopl2_snd_e}) << 1) + (~speaker_out << 14) + ({tandy_snd_e, 9'd0}); // ok 1
	//wire [16:0]sndmix = (({1'b0, jtopl2_snd_e}) ) + (~speaker_out << 14) + ({tandy_snd_e, 9'd0}); // bad
	//wire [16:0]sndmix_pcm = (({jtopl2_snd_e[15], jtopl2_snd_e}) << 2) + (~speaker_out << 15) + {tandy_snd_e, 9'd0}; // not bad
	wire [16:0]sndmix = ({jtopl2_snd_e[15], jtopl2_snd_e}) + (~speaker_out << 14) + ({tandy_snd_e, 9'd0}); // ok 2

	`ifdef DEMISTIFY
	assign DAC_R = sndmix >> 1;
	assign DAC_L = sndmix >> 1;	
	`endif

	sigma_delta_dac sigma_delta_dac (
		.clk      ( CLK_50M     ),      // bus clock
		.ldatasum ( sndmix >> 2 ),      // left channel data		(ok1) sndmix >> 1 bad, (ok2) sndmix >> 2 ok
		.rdatasum ( sndmix >> 2 ),      // right channel data		sndmix_pcm >> 1 bad, sndmix_pcm >> 2 bad
		.left     ( AUDIO_L     ),      // left bitstream output
		.right    ( AUDIO_R     )       // right bitsteam output
	);

	//////////////////////////////////////////////////////////////////////// 


	assign SDRAM_DQ_IN = SDRAM_DQ;
	assign SDRAM_DQ = ~SDRAM_DQ_IO ? SDRAM_DQ_OUT : 16'hZZZZ;

	wire s6_3_mux;
	wire [2:0] SEGMENT;	

	i8088 B1(
	  .CORE_CLK(clk_100),
	  .CLK(clk_cpu),

	  .RESET(reset_cpu),
	  .READY(processor_ready),
	  .NMI(1'b0),
	  .INTR(interrupt_to_cpu),

	  .ad_out(cpu_ad_out),
	  .dout(cpu_data_bus),
	  .din(data_bus),
	  
	  .lock_n(lock_n),
	  .s6_3_mux(s6_3_mux),
	  .s2_s0_out(processor_status),
	  .SEGMENT(SEGMENT),

      .biu_done(biu_done),
      .turbo_mode(turbo_mode)
	);
	
	/////////////////   UART

	logic clk_uart_ff_1;
	logic clk_uart_ff_2;
	logic clk_uart_ff_3;
	logic clk_uart_en;

	always @(posedge clk_chipset) begin
		clk_uart_ff_1 <= clk_uart;
		clk_uart_ff_2 <= clk_uart_ff_1;
		clk_uart_ff_3 <= clk_uart_ff_2;
		clk_uart_en   <= ~clk_uart_ff_3 & clk_uart_ff_2;
    end

	`ifdef NO_COM2

	// NO COM2 UART PORT

	`else

	/// SERIAL MICROSOFT MOUSE
	wire UART2_RX;
	wire UART2_TX;
	wire uart2_rts;
	wire uart2_cts;
	wire rts;

	// 	.ps2dta_in(PS2K_MOUSE_DAT_IN),
	// 	.ps2clk_in(PS2K_MOUSE_CLK_IN),
	// 	.ps2dta_out(PS2K_MOUSE_DAT_OUT),
	// 	.ps2clk_out(PS2K_MOUSE_CLK_OUT),

	MSMouseWrapper MSMouseWrapper_inst (
		.clk(clk_chipset),
		.ps2dta(PS2_MOUSE_DAT),
		.ps2clk(PS2_MOUSE_CLK),
		.rts(rts),
		.rd(UART2_RX)
	);

	assign rts = ~uart2_rts;

	// assign xxxx = UART2_RX;		//debug output
	// assign xxxx = rts;			//debug output

	`endif



	////////////////// VIDEO

	wire [5:0] r_in, b_in;	
	wire [6:0] g_in;	
	reg  [7:0] raux, gaux, baux;	
	wire [5:0] raux2, baux2;	
	wire [6:0] gaux2;	
	wire [5:0] raux3, gaux3, baux3;	

	wire vga_hs;
	wire vga_vs;
	wire vga_hs_o;
	wire vga_vs_o;
	wire de_o;

	//wire [1:0] scale = status[2:1];
	wire mda_mode = status[4];	 
	wire [2:0] screen_mode = status[16:14];

	wire   composite_on;
    assign composite_on = status[7];

	wire   display_mode_disable;
    assign display_mode_disable = status[8];
	wire   osd_disable;
    assign osd_disable = status[9];


	video_monochrome_converter video_mono 
	(
		.clk_vid(CLK_VIDEO),
		.ce_pix(ce_pixel),
		
		.R({r_in, 2'b00}),
		.G({g_in, 1'b0}),
		.B({b_in, 2'b00}),

		.gfx_mode(screen_mode),
		
		.R_OUT(raux),
		.G_OUT(gaux),
		.B_OUT(baux)	
	);

	assign raux2 = display_mode_disable ? r_in : raux[7:2];
	assign gaux2 = display_mode_disable ? g_in : gaux[7:1];
	assign baux2 = display_mode_disable ? b_in : baux[7:2];


	mist_video #(.OSD_COLOR(3'd5), .SD_HCNT_WIDTH(10) ) mist_video (
		.clk_sys     ( clk_56_875 ),
	
		// OSD SPI interface
		.SPI_SCK     ( SPI_SCK    ),
		.SPI_SS3     ( SPI_SS3    ),
		.SPI_DI      ( SPI_DI     ),
	
		// scanlines (00-none 01-25% 10-50% 11-75%)   	//only works if scandoubler enabled
		.scanlines   ( 2'b00      ),

		// non-scandoubled pixel clock divider 0 - clk_sys/4, 1 - clk_sys/2
		.ce_divider  ( 1'b1       ),
	
		// 0 = HVSync 31KHz, 1 = CSync 15KHz			//using Graphics Gremlin scandoubler
		.scandoubler_disable (1'b1),
		// disable csync without scandoubler
		.no_csync    ( ~forced_scandoubler ),			// 1'b1
		// YPbPr always uses composite sync
		.ypbpr       ( status[1] ),					// 1'b0
		// Rotate OSD [0] - rotate [1] - left or right
		.rotate      ( 2'b00      ),
		// composite-like blending
		.blend       ( status[2] ),					// 1'b0
	
		// video in
		.R           ( raux2      ),
		.G           ( gaux2[6:1] ),
		.B           ( baux2      ),
		.HSync       ( ~vga_hs    ),
		.VSync       ( ~vga_vs    ),

		// MiST video output signals
		.VGA_R       ( raux3      ),
		.VGA_G       ( gaux3      ),
		.VGA_B       ( baux3      ),
		.VGA_VS      ( vga_vs_o   ),
		.VGA_HS      ( vga_hs_o   )
	);
	
	assign VGA_R  = osd_disable ? {raux2,raux2[1:0]} : {raux3,raux3[1:0]};
	assign VGA_G  = osd_disable ? {gaux2,gaux2[0]  } : {gaux3,gaux3[1:0]};
	assign VGA_B  = osd_disable ? {baux2,baux2[1:0]} : {baux3,baux3[1:0]};

	assign VGA_VS = osd_disable ? ~vga_vs : ~vga_vs_o;		
	assign VGA_HS = osd_disable ? ~vga_hs : ~vga_hs_o;		

	assign VGA_DE = ~(HBlank | VBlank);



	// wire [5:0] osd_r_o;
	// wire [5:0] osd_g_o;
	// wire [5:0] osd_b_o;

	// osd #(.OSD_COLOR(3'd5), .OSD_AUTO_CE(1'b0) ) osd
	// (
	// 	.clk_sys ( clk_56_875 ),	// clk_56_875, clk_28_636, clk_56_875 /auto 0/clk_28_636/clk_56_875/clk_56_875
	// 	.rotate  ( 2'b00      ),
	// 	.ce      ( clk_14_318 ),	// clk_28_636, 1'b0      , clk_14_318 /auto 0/clk_14_318/clk_28_636/clk_14_318
	// 	.SPI_DI  ( SPI_DI     ),
	// 	.SPI_SCK ( SPI_SCK    ),
	// 	.SPI_SS3 ( SPI_SS3    ),
	// 	.R_in    ( raux[7:2]  ),
	// 	.G_in    ( gaux[7:2]  ),
	// 	.B_in    ( baux[7:2]  ),
	// 	.HSync   ( ~vga_hs    ),  //with or without ~
	// 	.VSync   ( ~vga_vs    ),	
	// 	.R_out   ( osd_r_o    ),
	// 	.G_out   ( osd_g_o    ),
	// 	.B_out   ( osd_b_o    )
	// );

	
endmodule
