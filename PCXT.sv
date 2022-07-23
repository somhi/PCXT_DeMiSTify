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

//	output [20:0] SRAM_A,
//	inout  [15:0] SRAM_Q,     	
//	output        SRAM_WE,    

	output        SPI_DO,
	input         SPI_DI,
	input         SPI_SCK,
	input         SPI_SS2,
	input         SPI_SS3,
	input         SPI_SS4,
	input         CONF_DATA0,

	output        VGA_HS,
	output        VGA_VS,
	output  [5:0] VGA_R,
	output  [5:0] VGA_G,
	output  [5:0] VGA_B,
	output        VGA_DE,    // = ~(VBlank | HBlank)

	`ifdef DEMISTIFY
	output        CLK_VIDEO,

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
	//input         SD_CD,

	input         UART_RX,
	output        UART_TX

//	input         PS2K_CLK_IN,
//	input         PS2K_DAT_IN  //,
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
//             Upper                             Lower              
// 0         1         2         3          4         5         6   
// 01234567890123456789012345678901 23456789012345678901234567890123
// 0123456789ABCDEFGHIJKLMNOPQRSTUV 0123456789ABCDEFGHIJKLMNOPQRSTUV
//    XX  XXXXXXXXXX

`include "build_id.v" 
parameter CONF_STR = {
	"PCXT;;",
	"-;",
   "O3,Model,IBM PCXT,Tandy 1000;",
	//"OHI,CPU Speed,4.77Mhz,7.16Mhz,14.318MHz;", // These bits are reserved until it can be used
	"-;",
	"O7,Splash Screen,Yes,No;",
	"-;",
	"P1,Audio & Video;",
	"P1-;",
	"P1OA,Adlib,On,Invisible;",
	"P1O7,DSS/Covox,Unplugged,Plugged;",
	"P1-;",
	//"P1O89,Aspect ratio,Original,Full Screen,[ARC1],[ARC2];",	
	"P1O4,Video Output,CGA/Tandy,MDA;",
	"P1OEG,Display,Full Color,Green,Amber,B&W,Red,Blue,Fuchsia,Purple;",
	//"PO78,Scandoubler Fx,None,HQ2x,CRT 25%,CRT 50%;",
	"P2,Hardware;",
	"P2-;",
	"P2OB,Lo-tech 2MB EMS, Enabled, Disabled;",
	"P2OCD,EMS Frame,A000,C000,D000;",
	"P2-;",
	"-;",
	"F,ROM,Load BIOS  (F000);",	
	"F,ROM,Load XTIDE (EC00);",	
	"-;",
	"T0,Reset;",
	"R0,Reset and close OSD;",
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


// without .PS2BIDIR(1) do not boot 
// .PS2DIV(2000) value is adequate

user_io #(.STRLEN($size(CONF_STR)>>3), .PS2DIV(2000), .PS2BIDIR(1)) user_io (
	.conf_str      ( CONF_STR       ),
	.clk_sys       ( CLK_50M        ),

	// the spi interface
	.SPI_CLK        ( SPI_SCK       ),
	.SPI_SS_IO      ( CONF_DATA0    ),
	.SPI_MISO       ( SPI_DO        ),   // tristate handling inside user_io
	.SPI_MOSI       ( SPI_DI        ),
	
	.status         ( status        ),
	.buttons        ( buttons       ),
	// .scandoubler_disable ( forced_scandoubler ),

	.ps2_kbd_clk_i		(ps2_kbd_clk_out),
	.ps2_kbd_data_i		(ps2_kbd_data_out),
	.ps2_kbd_clk		(ps2_kbd_clk_in),
	.ps2_kbd_data		(ps2_kbd_data_in)
//  .ps2_mouse_clk_i	(ps2_mouse_clk_out),
//	.ps2_mouse_data_i	(ps2_mouse_data_out),
//	.ps2_mouse_clk		(ps2_mouse_clk_in),
//	.ps2_mouse_data		(ps2_mouse_data_in),
);


data_io DATA_IO (
	.clk_sys    ( CLK_50M ),
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
reg clk_14_318 = 1'b0;
//reg clk_7_16 = 1'b0;
wire clk_4_77;
wire clk_cpu;
wire clk_opl2;
wire peripheral_clock;

`ifdef DEMISTIFY_sockit

assign SDRAM_CLK = CLK_50M;

pll pll
(
	.refclk(CLK_50M),
	.rst(0),
	.outclk_0(clk_100),
	.outclk_1(clk_56_875),
	.outclk_2(clk_28_636),
	.outclk_3(clk_uart),
	.outclk_4(clk_opl2),
	.locked(pll_locked)
);

wire reset_wire = !RESET_N | status[0] | buttons[1] | !pll_locked | (status[14] && usdImgMtd) | (ioctl_download && ioctl_index == 0) | splashscreen;

`else  

pll pll
(
	.inclk0(CLK_50M),
	.areset(1'b0),
	.c0(clk_100),
	.c1(SDRAM_CLK),	
	.c2(clk_uart),
	.c3(clk_opl2),
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
wire ce_pix;
//wire [7:0] video;

assign CLK_VIDEO = clk_56_875;

wire CE_PIXEL;
assign CE_PIXEL = 1'b1;

reg         cen_44100;
reg  [31:0] cen_44100_cnt;
wire [31:0] cen_44100_cnt_next = cen_44100_cnt + 16'd44100;
always @(posedge CLK_50M) begin
	cen_44100 <= 0;
	cen_44100_cnt <= cen_44100_cnt_next;
	if (cen_44100_cnt_next >= (50000000)) begin
		cen_44100 <= 1;
		cen_44100_cnt <= cen_44100_cnt_next - (50000000);
	end
end

always @(posedge clk_28_636)
	clk_14_318 <= ~clk_14_318; // 14.318Mhz

//always @(posedge clk_14_318) begin
//	clk_7_16 <= ~clk_7_16; // 7.16Mhz
//	CE_PIXEL <= mda_mode ? 1'b1 : clk_7_16;
//end

clk_div3 clk_normal // 4.77MHz
(
	.clk(clk_14_318),
	.clk_out(clk_4_77)
);

always @(posedge clk_4_77)
	peripheral_clock <= ~peripheral_clock; // 2.385Mhz

logic  clk_cpu_ff_1;
logic  clk_cpu_ff_2;

always @(posedge clk_100) begin
    clk_cpu_ff_1 <= clk_4_77;
    clk_cpu_ff_2 <= clk_cpu_ff_1;
    clk_cpu      <= clk_cpu_ff_2;
end

logic   clk_opl2_ff_1;
logic   clk_opl2_ff_2;
logic   clk_opl2_ff_3;
logic   cen_opl2;

always @(posedge clk_100) begin
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

always @(negedge clk_100, posedge reset) begin
	if (reset)
		reset_cpu_ff <= 1'b1;
	else
		reset_cpu_ff <= reset;
end

always @(negedge clk_100, posedge reset) begin
	if (reset) begin
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

    always_ff @(negedge clk_cpu, posedge reset)
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

    always_ff @(negedge clk_cpu, posedge reset)
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
	 
	wire tandy_mode = status[3];
	wire mda_mode = status[4];	 
	wire [2:0] screen_mode = status[16:14];
	 
	 
	 assign  sw = mda_mode ? 8'b00111101 : 8'b00101101; // PCXT DIP Switches (MDA or CGA 80)
	 assign  port_c_in[3:0] = port_b_out[3] ? sw[7:4] : sw[3:0];

   CHIPSET u_CHIPSET (
        .clock                              (clk_100),
        .cpu_clock                            (clk_cpu),
		  .clk_sys                            (CLK_50M),
		  .peripheral_clock                   (peripheral_clock),
		  
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
        .de_o                               (VGA_DE),
        .VGA_R                              (r),
        .VGA_G                              (g),
        .VGA_B                              (b),
        .VGA_HSYNC                          (vga_hs),
        .VGA_VSYNC                          (vga_vs),
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
		  .clk_en_44100                       (cen_44100),
		  .dss_covox_en                       (status[7]),
		  .lclamp                             (lclamp),
		  .rclamp                             (rclamp),		  
		  .clk_en_opl2                        (cen_opl2), // clk_en_opl2
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
	    //  .uart_cts_n                        (uart_cts),
	    //  .uart_dcd_n                        (uart_dcd),
	    //  .uart_dsr_n                        (uart_dsr),
	    //  .uart_rts_n                        (uart_rts),
	    //  .uart_dtr_n                        (uart_dtr),
		//   .SRAM_ADDR                         (SRAM_A),
		//   .SRAM_DATA                         (SRAM_Q[7:0]),
		//   .SRAM_WE_n                         (SRAM_WE),
		  .enable_sdram                       (1'b1),
		  .sdram_clock                        (CLK_50M),
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
        .tandy_mode                         (tandy_mode)
    );

	wire [15:0] SDRAM_DQ_IN;
	wire [15:0] SDRAM_DQ_OUT;
	wire        SDRAM_DQ_IO;
	
	assign SDRAM_DQ_IN = SDRAM_DQ;
	assign SDRAM_DQ = ~SDRAM_DQ_IO ? SDRAM_DQ_OUT : 16'hZZZZ;			
	
	wire [15:0] lclamp;
	wire [15:0] rclamp;
	wire speaker_out;

	assign DAC_L = lclamp;	
	assign DAC_R = rclamp;

	sigma_delta_dac sigma_delta_dac (
		.clk      ( CLK_50M     ),      // bus clock
		.ldatasum ( lclamp >> 1 ),      // left channel data
		.rdatasum ( rclamp >> 1 ),      // right channel data
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
	  .SEGMENT(SEGMENT)
	);
	

	///

	always @(posedge clk_cpu) begin
		if (address_latch_enable)
			cpu_address <= cpu_ad_out;
		else
			cpu_address <= cpu_address;
	end	
	
	/// VIDEO


	video_monochrome_converter video_mono 
	(
		.clk_vid(CLK_VIDEO),
		.ce_pix(CE_PIXEL),
		
		.R({r, 2'b0}),
		.G({g, 2'b0}),
		.B({b, 2'b0}),

		.gfx_mode(screen_mode),
		
		.R_OUT(raux),
		.G_OUT(gaux),
		.B_OUT(baux)	
	);

	wire [5:0] vga_r;
	wire [5:0] vga_g;
	wire [5:0] vga_b;
	wire vga_hs;
	wire vga_vs;
	wire [5:0] vga_r_o;
	wire [5:0] vga_g_o;
	wire [5:0] vga_b_o;


	// 1 MDA, 0 CGA
	assign vga_r = mda_mode ? r : raux[7:2];
	assign vga_g = mda_mode ? g : gaux[7:2];
	assign vga_b = mda_mode ? b : baux[7:2];

	mist_video #(.OSD_COLOR(3'd5)) mist_video (
		.clk_sys     ( clk_56_875 ),
	
		// OSD SPI interface
		.SPI_SCK     ( SPI_SCK    ),
		.SPI_SS3     ( SPI_SS3    ),
		.SPI_DI      ( SPI_DI     ),
	
		// scanlines (00-none 01-25% 10-50% 11-75%)
		.scanlines   ( 2'b00      ),

		// non-scandoubled pixel clock divider 0 - clk_sys/4, 1 - clk_sys/2
		.ce_divider  ( 1'b1       ),
	
		// 0 = HVSync 31KHz, 1 = CSync 15KHz
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
		.R           ( vga_r      ),
		.G           ( vga_g      ),
		.B           ( vga_b      ),
		.HSync       ( ~vga_hs    ),
		.VSync       ( ~vga_vs    ),

		// MiST video output signals
		.VGA_R       ( vga_r_o      ),
		.VGA_G       ( vga_g_o      ),
		.VGA_B       ( vga_b_o      ),
		.VGA_VS      ( VGA_VS     ),
		.VGA_HS      ( VGA_HS     )
	
		// `ifdef DEMISTIFY
		// 						   ,
		// .ce_x1_o	 ( ce_x1	  )
		// `endif
	);
	
	assign VGA_R = VGA_DE ? vga_r_o : 6'b000000;
	assign VGA_G = VGA_DE ? vga_g_o : 6'b000000;
	assign VGA_B = VGA_DE ? vga_b_o : 6'b000000;


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
