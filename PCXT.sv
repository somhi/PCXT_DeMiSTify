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

	//Base video clock. Usually equals to CLK_SYS.
	output        CLK_VIDEO,

	output  [5:0] VGA_R,
	output  [5:0] VGA_G,
	output  [5:0] VGA_B,
	output        VGA_HS,
	output        VGA_VS,
	output        VGA_DE,    // = ~(VBlank | HBlank)

	`ifdef DEMISTIFY
	output [15:0]  DAC_L, 
	output [15:0]  DAC_R, 
	`endif

	output        AUDIO_L,
	output        AUDIO_R, 

	//SD-SPI
	output        SD_SCK,
	output        SD_MOSI,
	input         SD_MISO,
	output        SD_CS,
	input         SD_CD,

	input         UART_RX,
	output        UART_TX,
	input		  UART_CTS,
	output 		  UART_RTS,

	input         UART2_RX,
	output        UART2_TX

//	input         PS2K_CLK_IN,
//	input         PS2K_DAT_IN,
//	output        PS2K_CLK_OUT,
//	output        PS2K_DAT_OUT
);

wire CLK_50M;
assign CLK_50M = CLOCK_27;

///////// Default values for ports not used in this core /////////

assign LED  =  ~ioctl_download;   //1'b1;

//assign {SRAM_Q, SRAM_A, SRAM_WE} = 'Z;
//assign SRAM_Q[15:8] = 8'bZZZZZZZZ;
//assign {SDRAM_DQ, SDRAM_A, SDRAM_BA, SDRAM_CLK, SDRAM_CKE, SDRAM_DQML, SDRAM_DQMH, SDRAM_nWE, SDRAM_nCAS, SDRAM_nRAS, SDRAM_nCS} = 'Z;

//////////////////////////////////////////////////////////////////

// Status Bit Map:
//              Upper                          Lower
// 0         1         2         3          4         5         6
// 01234567890123456789012345678901 23456789012345678901234567890123
// 0123456789ABCDEFGHIJKLMNOPQRSTUV 0123456789ABCDEFGHIJKLMNOPQRSTUV
// XXXXX XXXXXXXXXXXXXXXXXXXXXXX


`include "build_id.v" 
parameter CONF_STR = {
	"PCXT;;",
	"-;",
	"O3,Model,IBM PCXT,Tandy 1000;",
	"OHI,CPU Speed,4.77MHz,7.16MHz,14.318MHz;",
	"-;",
	"F,ROM,Load BIOS  (F000);",	
	"F,ROM,Load XTIDE (EC00);",	
	"-;",
	"T0,Reset;",
	"-;",
	"O7,Splash Screen,Yes,No;",
	"-;",
	//"P1,FDD & HDD;",
	//"P1-;",
	//"P1S1,IMG,FDD Image:;",
	//"P1S0,IMG,HDD Image:;",
	//"-;",
	//"P1OJK,Write Protect,None,A:,C:,A: & C:;",
	//"P1-;",
	"P2,Audio & Video;",
	"P2-;",
	"P2OA,Adlib,On,Invisible;",
	"P2-;",
	//"P2O12,Scandoubler Fx,None,HQ2x,CRT 25%,CRT 50%;",
	//"P2O89,Aspect ratio,Original,Full Screen,[ARC1],[ARC2];",	
	"P2O4,Video Output,CGA/Tandy,MDA;",
	"P2OEG,Display,Full Color,Green,Amber,B&W,Red,Blue,Fuchsia,Purple;",	
	"P3,Hardware;",
	"P3-;",
	"P3OB,Lo-tech 2MB EMS,Enabled,Disabled;",
	"P3OCD,EMS Frame,A000,C000,D000;",
	"P3-;",
	"P3ONO,Joystick 1, Analog, Digital, Disabled;",
	"P3OPQ,Joystick 2, Analog, Digital, Disabled;",
	"P3OR,Sync Joy to CPU Speed,No,Yes;",
	"P3OS,Swap Joysticks,No,Yes;",
	"P3-;",
	//"R0,Reset and close OSD;",
	"V,v",`BUILD_DATE 
};

//wire forced_scandoubler;
wire  [1:0] buttons;
wire [31:0] status;
//wire [10:0] ps2_key;

//VHD	
wire[ 0:0] usdRd = { vsdRd };
wire[ 0:0] usdWr = { vsdWr };
wire       usdAck;
wire[31:0] usdLba[1] = '{ vsdLba };
wire       usdBuffWr;
wire[ 8:0] usdBuffA;
wire[ 7:0] usdBuffD[1] = '{ vsdBuffD };
wire[ 7:0] usdBuffQ;
wire[63:0] usdImgSz;
wire[ 0:0] usdImgMtd;

//Keyboard Ps2
wire        ps2_kbd_clk_out;
wire        ps2_kbd_data_out;
wire        ps2_kbd_clk_in;
wire        ps2_kbd_data_in;

//Mouse PS2
wire        ps2_mouse_clk_out;
wire        ps2_mouse_data_out;
wire        ps2_mouse_clk_in;
wire        ps2_mouse_data_in;

wire        ioctl_download;
wire  [7:0] ioctl_index;
wire        ioctl_wr;
wire [24:0] ioctl_addr;
wire  [7:0] ioctl_data;

wire        clk_uart;

wire        adlibhide = status[10];

wire [31:0] joy0, joy1;
wire [31:0] joya0, joya1;
wire [4:0]  joy_opts = status[27:23];

// without .PS2BIDIR(1) do not boot 
// .PS2DIV(2000) value is adequate

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
	// .scandoubler_disable ( forced_scandoubler ),

// //VHD	
// 	.sd_rd         (usdRd),
// 	.sd_wr         (usdWr),
// 	.sd_ack        (usdAck),
// 	.sd_lba        (usdLba),
// 	.sd_buff_wr    (usdBuffWr),
// 	.sd_buff_addr  (usdBuffA),
// 	.sd_buff_din   (usdBuffD),
// 	.sd_buff_dout  (usdBuffQ),
// 	.img_mounted   (usdImgMtd),
// 	.img_size	   (usdImgSz),	

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


data_io DATA_IO (
	.clk_sys    ( clk_chipset ),
	.SPI_SCK    ( SPI_SCK ),
	.SPI_SS2    ( SPI_SS2 ),
	.SPI_DI     ( SPI_DI  ),
	.SPI_DO     ( SPI_DO  ),

	.ioctl_download ( ioctl_download ),
	// .ioctl_upload   ( upload_active  ),
	.ioctl_index( ioctl_index  ),

    // ram interface
	.ioctl_wr   ( ioctl_wr     ),
	.ioctl_addr ( ioctl_addr   ),
	.ioctl_dout ( ioctl_data   )
	// .ioctl_din  ( ioctl_din    )
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

`ifdef DEMISTIFY_sockit

assign SDRAM_CLK = clk_chipset;

pll pll
(
	.refclk(CLK_50M),
	.rst(0),
	.outclk_0(clk_100),
	.outclk_1(clk_56_875),
	.outclk_2(clk_28_636),
	.outclk_3(clk_uart),
	.outclk_4(clk_opl2),
	.outclk_5(clk_chipset),
//	.outclk_6(clk_113_750),
	.locked(pll_locked)
);

wire reset_wire = !RESET_N | status[0] | buttons[1] | !pll_locked | (status[14] && usdImgMtd) | (ioctl_download && ioctl_index == 0) | splashscreen;

`else  

pll pll
(
	.inclk0(CLK_50M),
	.areset(1'b0),
	.c0(clk_100),
	.c1(clk_chipset),	
	.c2(SDRAM_CLK),
	.c3(clk_uart),
	.c4(clk_opl2),
	.locked(pll_locked)
);

wire pll_locked2;
pllvideo pllvideo
(
	.inclk0(CLK_50M),
	.areset(1'b0),
	.c0(clk_28_636),
	.c1(clk_56_875),	
//	.c2(clk_113_750),
//	.c3(clk_14_318),
//	.c4(clk_7_16),
	.locked(pll_locked2)
);

wire reset_wire = !RESET_N | status[0] | buttons[1] | !pll_locked | !pll_locked2 | (status[14] && usdImgMtd) | (ioctl_download && ioctl_index == 0) | splashscreen;

`endif


//////////////////////////////////////////////////////////////////

wire HBlank;
wire HSync;
wire VBlank;
wire VSync;
//wire ce_pixel_cga;
//wire ce_pixel_mda;
wire ce_pixel;
//wire [7:0] video;

assign CLK_VIDEO = clk_56_875;

//wire CLK_VIDEO_MDA;
//wire CLK_VIDEO_CGA;
//assign CLK_VIDEO_MDA = clk_113_750;
//assign CLK_VIDEO_CGA = clk_56_875;
//assign ce_pixel_mda = clk_28_636;


always @(posedge clk_28_636) begin
	clk_14_318 <= ~clk_14_318; // 14.318Mhz
//	ce_pixel_cga <= clk_14_318;	//if outside always block appears an overscan column in CGA mode
end

assign ce_pixel = 1'b1;

always @(posedge clk_14_318) begin
	clk_7_16 <= ~clk_7_16; // 7.16Mhz
end

clk_div3 clk_normal // 4.77MHz
(
	.clk(clk_14_318),
	.clk_out(clk_4_77)
);

always @(posedge clk_4_77)
	peripheral_clock <= ~peripheral_clock; // 2.385Mhz

logic  biu_done;
logic  turbo_mode;

always @(posedge clk_chipset) begin
    if (biu_done)
        turbo_mode  <= (status[18:17] == 2'b01 || status[18:17] == 2'b10);
    else
        turbo_mode  <= turbo_mode;
end

logic  clk_cpu_ff_1;
logic  clk_cpu_ff_2;

logic  pclk_ff_1;
logic  pclk_ff_2;

always @(posedge clk_chipset) begin
    clk_cpu_ff_1 <= (status[18:17] == 2'b10) ? clk_14_318 : (status[18:17] == 2'b01) ? clk_7_16 : clk_4_77;
    clk_cpu_ff_2 <= clk_cpu_ff_1;
    clk_cpu      <= clk_cpu_ff_2;
    pclk_ff_1    <= peripheral_clock;
    pclk_ff_2    <= pclk_ff_1;
    pclk         <= pclk_ff_2;
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

//////////////////////////////////////////////////////////////////

	wire [5:0] r, g, b;	
	reg [7:0] raux, gaux, baux;	
	
	wire de_o;
	
	reg [24:0] splash_cnt = 0;
	reg [3:0] splash_cnt2 = 0;
	reg splashscreen = 1;
	
	always @ (posedge clk_14_318) begin
	
		if (splashscreen) begin
			if (status[7])
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
	
    wire [7:0] data_bus;
    wire INTA_n;	
    wire [19:0] cpu_ad_out;
    reg  [19:0] cpu_address;
    wire [7:0] cpu_data_bus;    
    wire processor_ready;	
    wire interrupt_to_cpu;
    wire address_latch_enable;

    wire lock_n;
    wire [2:0]processor_status;
	 
	 logic   [7:0]   port_b_out;
    logic   [7:0]   port_c_in;	 
	 reg     [7:0]   sw;
	 
	//wire [1:0] scale = status[2:1];
	wire mda_mode = status[4];	 
	wire [2:0] screen_mode = status[16:14];
	 
	 
	 assign  sw = mda_mode ? 8'b00111101 : 8'b00101101; // PCXT DIP Switches (MDA or CGA 80)
	 assign  port_c_in[3:0] = port_b_out[3] ? sw[7:4] : sw[3:0];

   CHIPSET u_CHIPSET (
        .clock                              (clk_chipset),
        .cpu_clock                            (clk_cpu),
		  .clk_sys                            (clk_chipset),
		  .peripheral_clock                   (pclk),
		  .turbo_mode                         (status[18:17]),
		  .color										  (screen_mode == 3'd0),
        .reset                              (reset_cpu),
        .sdram_reset                        (reset),
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
        .VGA_R                              (r),
        .VGA_G                              (g),
        .VGA_B                              (b),
        .VGA_HSYNC                          (vga_hs),
        .VGA_VSYNC                          (vga_vs),
		.VGA_HBlank	  				        (HBlank),
		.VGA_VBlank							(VBlank),
//      .address                            (address),
        .address_ext                        (20'hFFFFF),
//      .address_direction                  (address_direction),
        .data_bus                           (data_bus),
        .data_bus_ext                       (8'hFF),
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
        .memory_write_n_ext                 (1'b1),
//      .memory_write_n_direction           (memory_write_n_direction),
        .dma_request                        (0),    // use?	-> I don't know if it will ever be necessary, at least not during testing.
//      .dma_acknowledge_n                  (dma_acknowledge_n),
//      .address_enable_n                   (address_enable_n),
//      .terminal_count_n                   (terminal_count_n)
        .port_b_out                         (port_b_out),
		  .port_c_in                          (port_c_in),
	     .speaker_out                        (speaker_out),   
        .ps2_clock                          (device_clock),
	     .ps2_data                           (device_data),
	     .ps2_clock_out                      (ps2_kbd_clk_out),
	     .ps2_data_out                       (ps2_kbd_data_out),
//         .ps2_clock                          (PS2K_CLK_IN),
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
		  .ioctl_download                     (ioctl_download),
		  .ioctl_index                        (ioctl_index),
		  .ioctl_wr                           (ioctl_wr),
		  .ioctl_addr                         (ioctl_addr),
		  .ioctl_data                         (ioctl_data),		  
		  .clk_uart                          (clk_uart),
	     .uart_rx                           (UART_RX),
	     .uart_tx                           (UART_TX),
	      .uart_cts_n                        (UART_CTS),
	    //  .uart_dcd_n                        (uart_dcd),
	    //  .uart_dsr_n                        (uart_dsr),
	      .uart_rts_n                        (UART_RTS),
	    //  .uart_dtr_n                        (uart_dtr),
	     .uart2_rx                           (UART2_RX),
	     .uart2_tx                           (UART2_TX),
	   //  .uart2_cts_n                        (uart2_cts),
	   //  .uart2_dcd_n                        (uart2_dcd),
	   //  .uart2_dsr_n                        (uart2_dsr),
	   //  .uart2_rts_n                        (uart2_rts),
	   //  .uart2_dtr_n                        (uart2_dtr),
		  .enable_sdram                       (1'b1),
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
		  .ems_address                        (status[13:12])
    );

	wire speaker_out;
	wire  [7:0]   tandy_snd_e;
	wire tandy_snd_rdy;

	wire [15:0] jtopl2_snd_e;	
	//wire [16:0]sndmix = (({jtopl2_snd_e[15], jtopl2_snd_e}) << 2) + (speaker_out << 15) + {tandy_snd_e, 6'd0}; // signed mixer
	wire [16:0]sndmix = (({1'b0, jtopl2_snd_e}) << 1) + (speaker_out << 14) + {tandy_snd_e, 8'd0};

	wire [15:0] SDRAM_DQ_IN;
	wire [15:0] SDRAM_DQ_OUT;
	wire        SDRAM_DQ_IO;
	
	assign SDRAM_DQ_IN = SDRAM_DQ;
	assign SDRAM_DQ = ~SDRAM_DQ_IO ? SDRAM_DQ_OUT : 16'hZZZZ;			

	assign DAC_L = sndmix >> 1;	
	assign DAC_R = sndmix >> 1;

	sigma_delta_dac sigma_delta_dac (
		.clk      ( CLK_50M     ),      // bus clock
		.ldatasum ( sndmix >> 1 ),      // left channel data
		.rdatasum ( sndmix >> 1 ),      // right channel data
		.left     ( AUDIO_L     ),      // left bitstream output
		.right    ( AUDIO_R     )       // right bitsteam output
	);

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
	

	///

	always @(posedge clk_100) begin
		if (address_latch_enable)
			cpu_address <= cpu_ad_out;
		else
			cpu_address <= cpu_address;
	end	
	
	/// VIDEO


	video_monochrome_converter video_mono 
	(
		.clk_vid(CLK_VIDEO),
		.ce_pix(ce_pixel),
		
		.R({r, 2'b00}),
		.G({g, 2'b00}),
		.B({b, 2'b00}),

		.gfx_mode(screen_mode),
		
		.R_OUT(raux),
		.G_OUT(gaux),
		.B_OUT(baux)	
	);

	wire vga_hs;
	wire vga_vs;

	mist_video #(.OSD_COLOR(3'd5), .SD_HCNT_WIDTH(10)) mist_video (
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
		.no_csync    ( 1'b1       ),
		// YPbPr always uses composite sync
		.ypbpr       ( 1'b0       ),
		// Rotate OSD [0] - rotate [1] - left or right
		.rotate      ( 2'b00      ),
		// composite-like blending
		.blend       ( 1'b0       ),
	
		// video in
		.R           ( raux[7:2]  ),
		.G           ( gaux[7:2]  ),
		.B           ( baux[7:2]  ),
		.HSync       ( ~vga_hs    ),
		.VSync       ( ~vga_vs    ),

		// MiST video output signals
		.VGA_R       ( VGA_R      ),
		.VGA_G       ( VGA_G      ),
		.VGA_B       ( VGA_B      ),
		.VGA_VS      ( VGA_VS     ),
		.VGA_HS      ( VGA_HS     )
	
		// `ifdef DEMISTIFY
		// 						   ,
		// .ce_x1_o	 ( ce_x1	  )
		// `endif
	);
	
	assign VGA_DE = ~(HBlank | VBlank);
	

reg vsd = 0;
always @(posedge CLK_50M) if(usdImgMtd[0]) vsd <= |usdImgSz;

wire       vsdRd;
wire       vsdWr;
wire       vsdAck = usdAck;
wire[31:0] vsdLba;
wire       vsdBuffWr = usdBuffWr;
wire[ 8:0] vsdBuffA = usdBuffA;
wire[ 7:0] vsdBuffD;
wire[ 7:0] vsdBuffQ = usdBuffQ;
wire[63:0] vsdImgSz = usdImgSz;
wire       vsdImgMtd = usdImgMtd[0];

wire vsdCs = usdCs | ~vsd;
wire vsdCk = usdCk;
wire vsdMosi = usdDo;
wire vsdMiso;

wire usdCs;
wire usdCk;
wire usdDo;
wire usdDi = vsd ? vsdMiso : SD_MISO;

assign SD_CS   = usdCs | vsd;
assign SD_SCK  = usdCk & ~vsd;
assign SD_MOSI = usdDo & ~vsd;

/*
sd_card sd_card
(
	.clk_sys     (CLK_50M  ),
	.reset       (reset    ),
	.sdhc        (status[4]),
	.sd_rd       (vsdRd    ),
	.sd_wr       (vsdWr    ),
	.sd_ack      (vsdAck   ),
	.sd_lba      (vsdLba   ),
	.sd_buff_wr  (vsdBuffWr),
	.sd_buff_addr(vsdBuffA ),
	.sd_buff_dout(vsdBuffQ ),
	.sd_buff_din (vsdBuffD ),
	.img_size    (vsdImgSz ),
	.img_mounted (vsdImgMtd),
	.clk_spi     (clk_25   ),
	.ss          (vsdCs    ),
	.sck         (vsdCk    ),
	.mosi        (vsdMosi  ),
	.miso        (vsdMiso  )
);
*/

endmodule

module led
(
	input      clk,
	input      in,
	output reg out
);

integer counter = 0;
always @(posedge clk) begin
	if(!counter) out <= 0;
	else begin
		counter <= counter - 1'b1;
		out <= 1;
	end
	
	if(in) counter <= 4500000;
end

endmodule
