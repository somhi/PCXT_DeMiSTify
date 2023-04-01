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

        inout         SPI_DO,
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

        output  [1:0] COMPOSITE_OUT,

        output        CLK_VIDEO,	//Base video clock. Usually equals to CLK_SYS.
        output        VGA_DE,    	// = ~(VBlank | HBlank)

        output        AUDIO_L,
        output        AUDIO_R,

	`ifdef DEMISTIFY
        output [15:0]  DAC_L,
        output [15:0]  DAC_R,

        output         CLK_CHIPSET,
    `endif

    `ifndef MIST_SIDI
        input         PS2K_CLK_IN,
        input         PS2K_DAT_IN,
        output        PS2K_CLK_OUT,
        output        PS2K_DAT_OUT,

        input         PS2K_MOUSE_CLK_IN,
        input         PS2K_MOUSE_DAT_IN,
        output        PS2K_MOUSE_CLK_OUT,
        output        PS2K_MOUSE_DAT_OUT,        
	`endif

        input		  UART_CTS,
        output 		  UART_RTS,
        input         UART_RX,
        output        UART_TX
    );

    wire CLK_50M;
    assign CLK_50M = CLOCK_27;
    assign LED =  ~ioctl_download;   //1'b1;

    ///////// Default values for ports not used in this core /////////
    //assign {SRAM_Q, SRAM_A, SRAM_WE} = 'Z;
    //assign SRAM_Q[15:8] = 8'bZZZZZZZZ;

    //
    ///////////////////////   MiST FRAMEWORK   ///////////////////////
    //
    // Bitmap for MiST config string options
    //
    // 0         1         2         3          4         5         6
    // 01234567890123456789012345678901 234567890123456789012345678901
    // 0123456789ABCDEFGHIJKLMNOPQRSTUV WXYZabcdefghijklmnopqrstuvwxyz
    // XttXX..XttXXXXXXXXXttXXXXXXXXtXX aaaaaattaaDDDDDD...XX.........

	`include "build_id.v"

    //CAUTION: Too many entries will hung the OSD when entering a submenu (CONF_STR < 1024 bytes)
    parameter CONF_STR = {		// options order: 0,1,2,...
		"PCXT;;",
		"O3,Model,IBM PCXT,Tandy 1000;",
		"OHI,CPU Speed,4.77MHz,7.16MHz,9.54MHz,PC/AT 3.5MHz;",
        //"OJK,Write Protect,None,A:,B:,A: & B:;",    
		//
        `ifndef MIST_SIDI
		"S0,IMGVHD,Mount IDE 1:;",
		"S1,IMGVHD,Mount IDE 2:;",
        `endif
		"P1,BIOS;",
		"P1F,ROM,PCXT BIOS:;",
		"P1F,ROM,Tandy BIOS:;",
		"P1F,ROM,EC00 BIOS:;",
		"P1OUV,BIOS Writable,None,EC00,PCXT/Tandy,All;",
        "P1O7,Boot Splash Screen,Yes,No;",
		"P2,Audio;",
        "P2OA,C/MS Audio,Enabled,Disabled;",
        "P2Oef,OPL2,Adlib 388h,SB FM 388h/228h, Disabled;",     //[41:40]
		"P2OWX,Speaker Volume,1,2,3,4;",
		"P2OYZ,Tandy Volume,1,2,3,4;",
		"P2Oab,Audio Boost,No,2x,4x;",
		//"P2Ocd,Stereo Mix,none,25%,50%,100%;",
		//
		"P3,Video;",
		//"P3O12,Scandoubler Fx,None,HQ2x,CRT 25%,CRT 50%;",
		//"P3O89,Aspect ratio,Original,Full Screen,[ARC1],[ARC2];",
		//"P3OT,Border,No,Yes;",
		"P3O4,Video Output,CGA/Tandy,MDA;",
		"P3OEG,Display,Full Color,Green,Amber,B&W,Red,Blue,Fuchsia,Purple;",
		"P3Oh,Composite Blending,No,Yes;",
		"P3Oi,Composite (DB15 green),Off,On;",
		"P3Ol,VGA+Compos(1pin no.osd),Off,On;",
        "P3Og,EXPER.YPbPr,Off,On;",
		//
		"P4,Hardware;",
		"P4OB,Lo-tech 2MB EMS,Enabled,Disabled;",
		"P4OCD,EMS Frame,C000,D000,E000;",
        "P4Op,A000 UMB,Enabled,Disabled;",           //[51]
		"P4ONO,Joystick 1, Analog, Digital, Disabled;",
		"P4OPQ,Joystick 2, Analog, Digital, Disabled;",
		"P4OR,Sync Joy to CPU Speed,No,Yes;",
		"P4OS,Swap Joysticks,No,Yes;",
		//
		"T0,Reset;",
		//
        `ifdef DEBUG2
		"P5,Debug;",
//      "P5Oq,Comp. simulated (WIP),Off,On;",           //[52] -> "P2o8,Composite video,Off,On;",
//      "P5OLM,UART signal,clk_uart,clk_uart_en;",      //[22:21] 
//		"P5Oj,DEBUG.Displ.mode disable,No,Yes;",        //[45] display_mode_disable
//		"P5Ok,DEBUG.OSD disable,No,Yes;",               //[46] osd_disable
        `endif
		//
		"V,v",`BUILD_DATE
	};

    wire forced_scandoubler;
    wire [1:0] buttons;
    wire [63:0] status;
    wire [7:0]  xtctl;

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
    wire [7:0]  ioctl_data;
    reg         ioctl_wait;

    wire [63:0] rtc_data;

    wire [31:0] joy0, joy1;
    wire [31:0] joya0, joya1;
    wire [4:0]  joy_opts = status[27:23];

    //wire composite = status[52] | xtctl[0];
	//wire [1:0] scale = status[2:1];
    wire mda_mode = status[4] | xtctl[5];
    wire [2:0] screen_mode = status[16:14];
    //wire [1:0] ar = status[9:8];
    //wire border = status[29] | xtctl[1];
	wire a000h = ~status[51] & ~xtctl[6];
    wire composite_on = status[44];
    wire vga_composite = status[47];

	//debug
    `ifdef DEBUG2
    wire display_mode_disable = status[45];
    wire osd_disable = status[46];
    `else
    wire display_mode_disable = 1'b0;
    wire osd_disable = 1'b0;
    `endif


    //reg [1:0]   scale_video_ff;
    reg         mda_mode_video_ff;
    reg [2:0]   screen_mode_video_ff;
    //reg         border_video_ff;
	 
    //wire VGA_VBlank_border;
    //wire std_hsyncwidth;
    wire pause_core;

    // Virtual HDD Bus
    wire        hdd_cmd_req;
    wire        hdd_dat_req;
    wire  [2:0] hdd_addr;
    wire [15:0] hdd_data_out;
    wire [15:0] hdd_data_in;
    wire        hdd_wr;
    wire        hdd_status_wr;
    wire        hdd_data_wr;
    wire        hdd_data_rd;
    wire  [1:0] hdd0_ena;

    wire  [3:0] ide0_addr;
    wire [15:0] ide0_writedata;
    wire [15:0] ide0_readdata;
    wire        ide0_read;
    wire        ide0_write;

    always @(posedge CLK_VIDEO)
    begin
        //scale_video_ff          <= scale;
        mda_mode_video_ff       <= mda_mode;
        screen_mode_video_ff    <= screen_mode;
        //border_video_ff         <= border;
        //VIDEO_ARX               <= (!ar) ? 12'd4 : (ar - 1'd1);
        //VIDEO_ARY               <= (!ar) ? 12'd3 : 12'd0;
    end

    // .PS2DIV(2000) value is adequate

    `ifdef MIST_SIDI
    user_io #(.STRLEN($size(CONF_STR)>>3), .PS2DIV(2000), .PS2BIDIR(1), .FEATURES(32'h1050) /* FEAT_PS2REP | FEAT_IDE0_ATA | FEAT_IDE1_ATA*/) user_io
    `else 
    user_io #(.STRLEN($size(CONF_STR)>>3), .PS2DIV(2000)) user_io 
    `endif
	(
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

		.rtc            ( rtc_data      ),

        `ifdef MIST_SIDI
		.ps2_kbd_clk_i		(ps2_kbd_clk_out),
		.ps2_kbd_data_i		(ps2_kbd_data_out),
		.ps2_kbd_clk		(ps2_kbd_clk_in),
		.ps2_kbd_data		(ps2_kbd_data_in),

		.ps2_mouse_clk_i    (ps2_mouse_clk_out),
		.ps2_mouse_data_i	(ps2_mouse_data_out),
		.ps2_mouse_clk		(ps2_mouse_clk_in),
		.ps2_mouse_data		(ps2_mouse_data_in),
        `endif

		.joystick_0         (joy0 ),
		.joystick_1         (joy1 ),
		.joystick_analog_0  (joya0),
		.joystick_analog_1  (joya1)
	);

    `ifndef MIST_SIDI
    assign PS2K_CLK_OUT     = ps2_kbd_clk_out;
    assign PS2K_DAT_OUT     = ps2_kbd_data_out;
    assign ps2_kbd_clk_in   = PS2K_CLK_IN;
    assign ps2_kbd_data_in  = PS2K_DAT_IN; 

    assign PS2K_MOUSE_CLK_OUT = ps2_mouse_clk_out;
    assign PS2K_MOUSE_DAT_OUT = ps2_mouse_data_out;
    assign ps2_mouse_clk_in   = PS2K_MOUSE_CLK_IN;
    assign ps2_mouse_data_in  = PS2K_MOUSE_DAT_IN;
    `endif
    

    data_io #(.ENABLE_IDE(1'b1)) data_io
	(
		.clk_sys    ( clk_chipset ),
		.SPI_SCK    ( SPI_SCK ),
		.SPI_SS2    ( SPI_SS2 ),
        .SPI_SS4    ( SPI_SS4 ),
		.SPI_DI     ( SPI_DI  ),
		.SPI_DO     ( SPI_DO  ),    

		.ioctl_download ( ioctl_download ),
	//  .ioctl_upload   ( upload_active  ),
		.ioctl_index    ( ioctl_index    ),

		// ram interface
		.ioctl_wr   ( ioctl_wr     ),
		.ioctl_addr ( ioctl_addr   ),
		.ioctl_dout ( ioctl_data   ),
	//  .ioctl_din  ( ioctl_din    )

        .hdd_clk       ( clk_chipset  ),        //clk_chipset  same as data_io and ide module
        .hdd_cmd_req   ( hdd_cmd_req  ),
        .hdd_dat_req   ( hdd_dat_req  ),
    //  .hdd_cdda_req  ( hdd_cdda_req ),
    //  .hdd_cdda_wr   ( hdd_cdda_wr  ),
        .hdd_status_wr ( hdd_status_wr),
        .hdd_addr      ( hdd_addr     ),
        .hdd_wr        ( hdd_wr       ),
        .hdd_data_out  ( hdd_data_out ),
        .hdd_data_in   ( hdd_data_in  ),
        .hdd_data_rd   ( hdd_data_rd  ),
        .hdd_data_wr   ( hdd_data_wr  ),
        .hdd0_ena      ( hdd0_ena     )
	);

    ide ide (
        .clk           ( clk_chipset ),
        .clk_en        ( 1'b1 ),
        .reset         ( reset ),
        .address_in    ( (ide0_read && ide0_addr == 4'hE) ? 3'd7 : ide0_addr[2:0] ),
        .sel_secondary ( 1'b0 ),
        .data_in       ( ide0_writedata  ),
        .data_out      ( ide0_readdata   ),
 //     .data_oe       ( ),
        .rd            ( ide0_read  ),
        .hwr           ( ide0_write ),
        .lwr           ( ide0_write ),
        .sel_ide       ( ide0_read | (ide0_write & !ide0_addr[3]) ),
//      .intreq        ( ),
        .intreq_ack    ( 1'b0 ),     // interrupt clear
//      .nrdy          ( ),          // fifo is not ready for reading 
        .hdd0_ena      ( hdd0_ena ), // enables Master & Slave drives on primary channel
        .hdd1_ena      ( 2'b00 ),    // enables Master & Slave drives on secondary channel
//      .fifo_rd       ( ),
//      .fifo_wr       ( ),

        // connection to the IO-Controller
        .hdd_cmd_req   ( hdd_cmd_req ),
        .hdd_dat_req   ( hdd_dat_req ),
        .hdd_status_wr ( hdd_status_wr ),
        .hdd_addr      ( hdd_addr ),
        .hdd_wr        ( hdd_wr ),
        .hdd_data_in   ( hdd_data_in ),
        .hdd_data_out  ( hdd_data_out ),
        .hdd_data_rd   ( hdd_data_rd ),
        .hdd_data_wr   ( hdd_data_wr )
    );
    

    //
    ///////////////////////   CLOCKS   /////////////////////////////
    //

    wire clk_sys;
    wire pll_locked;

    wire clk_100;
    wire clk_28_636;
    wire clk_56_875;
    reg clk_25 = 1'b0;
    reg clk_14_318 = 1'b0;
    reg clk_9_54 = 1'b0;
    reg clk_7_16 = 1'b0;
    wire clk_4_77;
    wire clk_cpu;
    wire pclk;
    wire clk_chipset;
    wire peripheral_clock;
    wire clk_uart;

    localparam [27:0] cur_rate = 28'd50000000; // clk_chipset freq

	`ifdef DEMISTIFY_SOCKIT		/////  SOCKIT BOARD with Cyclone V   /////

		assign SDRAM_CLK = clk_chipset;

		pll pll
		(
			.refclk(CLK_50M),
			.rst(0),
			.outclk_0(clk_100),			//100                   CLOCK_CORE
			.outclk_1(clk_chipset),		//50                    CLOCK_CHIP
			.outclk_2(clk_uart),		//14.7456 -> 14.7541    CLOCK_UART
			.locked(pll_locked)
		);

		pllvideo pllvideo
		(
			.refclk(CLK_50M),
			.rst(0),
			.outclk_0(clk_28_636),		//28.636                CLOCK_VGA_CGA
			.outclk_1(clk_56_875),		//56.875 -> 57.272      CLOCK_VGA_MDA
			.locked()
		);

	`else  						/////  REST OF BOARDS    /////

		pll pll
		(
			.inclk0(CLK_50M),
			.areset(1'b0),
			.c0(clk_100),			//100                           CLOCK_CORE
			.c1(clk_chipset),		//50                            CLOCK_CHIP
			.c2(SDRAM_CLK),			//50 -2ns
			.c3(clk_uart),			//14.7456 MHz                   CLOCK_UART
			.locked(pll_locked)
		);

		pllvideo pllvideo
		(
			.inclk0(CLK_50M),
			.areset(1'b0),
			.c0(clk_28_636),		//28.636 -> 28.636      CLOCK_VGA_CGA
			.c1(clk_56_875),		//56.875 -> 57.272      CLOCK_VGA_MDA
			.locked()
		);

	`endif


    `ifdef MIST_SIDI    //Reset from OSD did not work in some SiDi board. This counter increases OSD reset toogle time
        reg        reset_OSD = 0;
        reg [16:0] clr_addr  = 0;
        always @(posedge clk_chipset) begin
            if(~&clr_addr) clr_addr  <= clr_addr + 1'd1;
            else           reset_OSD <= 0;

            if(status[0]) begin
                clr_addr <= 0;
                reset_OSD <= 1;
            end
        end

        wire reset_wire = !RESET_N | reset_OSD | buttons[1] | !pll_locked | splashscreen | bios_access_request;   //bios_access_request by kitune-san to supply ioctl_wait signal
    `else 
        wire reset_wire = !RESET_N | status[0] | buttons[1] | !pll_locked | splashscreen | bios_access_request;   //bios_access_request by kitune-san to supply ioctl_wait signal
    `endif

    wire reset_sdram_wire = !RESET_N | !pll_locked;

    //////////////////////////////////////////////////////////////////

    // TODO: messy, use a single clock domain at least
    always @(posedge clk_28_636)
        clk_14_318 <= ~clk_14_318; 	// 14.318Mhz

    reg [4:0] clk_9_54_cnt = 1'b0;
    always @(posedge clk_chipset)
        if (4'd0 == clk_9_54_cnt) begin
            if (clk_9_54)
                clk_9_54_cnt  <= 4'd3 - 4'd1;
            else
                clk_9_54_cnt  <= 4'd2 - 4'd1;
            clk_9_54      <= ~clk_9_54;
        end
        else begin
            clk_9_54_cnt  <= clk_9_54_cnt - 4'd1;
            clk_9_54      <= clk_9_54;
        end

    always @(posedge clk_chipset)
        clk_25 <= ~clk_25;

    always @(posedge clk_14_318)
        clk_7_16 <= ~clk_7_16;      // 7.16Mhz

    clk_div3 clk_normal             // 4.77MHz
    (
        .clk(clk_14_318),
        .clk_out(clk_4_77)
    );

    always @(posedge clk_4_77)
        peripheral_clock <= ~peripheral_clock; // 2.385Mhz

    //////////////////////////////////////////////////////////////////

    logic  biu_done;
    logic  [7:0] clock_cycle_counter_division_ratio;
    logic  [7:0] clock_cycle_counter_decrement_value;
    logic        shift_read_timing;
    logic  [1:0] ram_read_wait_cycle;
    logic  [1:0] ram_write_wait_cycle;
    logic        cycle_accrate;
    logic  [1:0] clk_select;


    always @(posedge clk_chipset, posedge reset)
    begin
        if (reset)
            clk_select  <= 2'b00;

        else if (biu_done)
            clk_select  <= (xtctl[3:2] == 2'b00 & ~xtctl[7]) ? status[18:17] : xtctl[7] ? 2'b11 : xtctl[3:2] - 2'b01;

        else
            clk_select  <= clk_select;

    end

    logic  clk_cpu_ff_1;
    logic  clk_cpu_ff_2;

    logic  pclk_ff_1;
    logic  pclk_ff_2;

    always @(posedge clk_chipset, posedge reset)
    begin
        if (reset)
        begin
            clk_cpu_ff_1    <= 1'b0;
            clk_cpu_ff_2    <= 1'b0;
            clk_cpu         <= 1'b0;
            pclk_ff_1       <= 1'b0;
            pclk_ff_2       <= 1'b0;
            pclk            <= 1'b0;
            cycle_accrate   <= 1'b1;
            clock_cycle_counter_division_ratio  <= 8'd1 - 8'd1;
            clock_cycle_counter_decrement_value <= 8'd1;
            shift_read_timing                   <= 1'b0;
            ram_read_wait_cycle                 <= 2'd0;
            ram_write_wait_cycle                <= 2'd0;
        end
        else
        begin
            clk_cpu_ff_2    <= clk_cpu_ff_1;
            clk_cpu         <= clk_cpu_ff_2;
            pclk_ff_1       <= peripheral_clock;
            pclk_ff_2       <= pclk_ff_1;
            pclk            <= pclk_ff_2;
            casez (clk_select)
                2'b00: begin
                    clk_cpu_ff_1    <= clk_4_77;
                    clock_cycle_counter_division_ratio  <= 8'd1 - 8'd1;
                    clock_cycle_counter_decrement_value <= 8'd1;
                    shift_read_timing                   <= 1'b0;
                    ram_read_wait_cycle                 <= 2'd0;
                    ram_write_wait_cycle                <= 2'd0;
                    cycle_accrate                       <= 1'b1;
                end
                2'b01: begin
                    clk_cpu_ff_1    <= clk_7_16;
                    clock_cycle_counter_division_ratio  <= 8'd2 - 8'd1;
                    clock_cycle_counter_decrement_value <= 8'd3;
                    shift_read_timing                   <= 1'b0;
                    ram_read_wait_cycle                 <= 2'd0;
                    ram_write_wait_cycle                <= 2'd0;
                    cycle_accrate                       <= 1'b1;
                end
                2'b10: begin
                    clk_cpu_ff_1    <= clk_9_54;
                    clock_cycle_counter_division_ratio  <= 8'd10 - 8'd1;
                    clock_cycle_counter_decrement_value <= 8'd21;
                    shift_read_timing                   <= 1'b0;
                    ram_read_wait_cycle                 <= 2'd0;
                    ram_write_wait_cycle                <= 2'd0;
                    cycle_accrate                       <= 1'b1;

                end
                2'b11: begin
                    clk_cpu_ff_1    <= clk_25;
                    clock_cycle_counter_division_ratio  <= 8'd1 - 8'd1;
                    clock_cycle_counter_decrement_value <= 8'd5;
                    shift_read_timing                   <= 1'b1;
                    ram_read_wait_cycle                 <= 2'd1;
                    ram_write_wait_cycle                <= 2'd0;
                    cycle_accrate                       <= 1'b0;
                end
            endcase
        end
    end

    //////////////////////////////////////////////////////////////////

    logic reset = 1'b1;
    logic [15:0] reset_count = 16'h0000;
    logic reset_sdram = 1'b1;
    logic [15:0] reset_sdram_count = 16'h0000;

    always @(posedge clk_chipset, posedge reset_wire)
    begin
        if (reset_wire)
        begin
            reset <= 1'b1;
            reset_count <= 16'h0000;
        end
        else if (reset)
        begin
            if (reset_count != 16'hffff)
            begin
                reset <= 1'b1;
                reset_count <= reset_count + 16'h0001;
            end
            else
            begin
                reset <= 1'b0;
                reset_count <= reset_count;
            end
        end
        else
        begin
            reset <= 1'b0;
            reset_count <= reset_count;
        end
    end

    logic reset_cpu_ff = 1'b1;
    logic reset_cpu = 1'b1;
    logic [15:0] reset_cpu_count = 16'h0000;

    always @(negedge clk_chipset, posedge reset)
    begin
        if (reset)
            reset_cpu_ff <= 1'b1;
        else
            reset_cpu_ff <= reset;
    end

    reg tandy_mode = 0;

    always @(negedge clk_chipset, posedge reset)
    begin
        if (reset)
        begin
            tandy_mode <= status[3];
            reset_cpu <= 1'b1;
            reset_cpu_count <= 16'h0000;
        end
        else if (reset_cpu)
        begin
            reset_cpu <= reset_cpu_ff;
            reset_cpu_count <= 16'h0000;
        end
        else
        begin
            if (reset_cpu_count != 16'h002A)
            begin
                reset_cpu <= reset_cpu_ff;
                reset_cpu_count <= reset_cpu_count + 16'h0001;
            end
            else
            begin
                reset_cpu <= 1'b0;
                reset_cpu_count <= reset_cpu_count;
            end
        end
    end

    always @(posedge clk_chipset, posedge reset_sdram_wire)
    begin
        if (reset_sdram_wire)
        begin
            reset_sdram <= 1'b1;
            reset_sdram_count <= 16'h0000;
        end
        else if (reset_sdram)
        begin
            if (reset_sdram_count != 16'hffff)
            begin
                reset_sdram <= 1'b1;
                reset_sdram_count <= reset_sdram_count + 16'h0001;
            end
            else
            begin
                reset_sdram <= 1'b0;
                reset_sdram_count <= reset_sdram_count;
            end
        end
        else
        begin
            reset_sdram <= 1'b0;
            reset_sdram_count <= reset_sdram_count;
        end
    end

    //
    ///////////////////////   BIOS LOADER   ////////////////////////////
    //

    reg [4:0]  bios_load_state = 4'h0;
    reg [1:0]  bios_protect_flag;
    reg        bios_access_request;
    reg [19:0] bios_access_address;
    reg [15:0] bios_write_data;
    reg        bios_write_n;
    reg [7:0]  bios_write_wait_cnt;
    reg        bios_write_byte_cnt;
    reg        tandy_bios_write;

    wire select_pcxt  = (ioctl_index[5:0] <  2) && (ioctl_addr[24:16] == 9'b000000000);
    wire select_tandy = (ioctl_index[5:0] == 2) && (ioctl_addr[24:16] == 9'b000000000);
    wire select_xtide = ioctl_index == 3;

    wire [19:0] bios_access_address_wire = select_pcxt  ? { 4'b1111, ioctl_addr[15:0]} :
         select_tandy ? { 4'b1111, ioctl_addr[15:0]} :
         select_xtide ? { 6'b111011, ioctl_addr[13:0]} :
         20'hFFFFF;

    wire bios_load_n = ~(ioctl_download & (select_pcxt | select_tandy | select_xtide));

    always @(posedge clk_chipset, posedge reset_sdram)
    begin
        if (reset_sdram)
        begin
            bios_protect_flag   <= 2'b11;
            bios_access_request <= 1'b0;
            bios_access_address <= 20'hFFFFF;
            bios_write_data     <= 16'hFFFF;
            bios_write_n        <= 1'b1;
            bios_write_wait_cnt <= 'h0;
            bios_write_byte_cnt <= 1'h0;
            tandy_bios_write    <= 1'b0;
            ioctl_wait          <= 1'b1;
            bios_load_state     <= 4'h00;
        end
        else if (~initilized_sdram)
        begin
            bios_protect_flag   <= 2'b11;
            bios_access_request <= 1'b0;
            bios_access_address <= 20'hFFFFF;
            bios_write_data     <= 16'hFFFF;
            bios_write_n        <= 1'b1;
            bios_write_wait_cnt <= 'h0;
            bios_write_byte_cnt <= 1'h0;
            ioctl_wait          <= 1'b1;
            bios_load_state     <= 4'h00;
        end
        else
        begin
            casez (bios_load_state)
                4'h00:
                begin
                    bios_protect_flag   <= ~status[31:30];  // bios_writable
                    bios_access_address <= 20'hFFFFF;
                    bios_write_data     <= 16'hFFFF;
                    bios_write_n        <= 1'b1;
                    bios_write_wait_cnt <= 'h0;
                    bios_write_byte_cnt <= 1'h0;
                    tandy_bios_write    <= 1'b0;

                    if (~ioctl_download)
                    begin
                        bios_access_request <= 1'b0;
                        ioctl_wait          <= 1'b0;
                    end
                    else
                    begin
                        bios_access_request <= 1'b1;
                        ioctl_wait          <= 1'b1;
                    end

                    if ((ioctl_download) && (~processor_ready) && (address_direction))
                        bios_load_state <= 4'h01;
                    else
                        bios_load_state <= 4'h00;
                end
                4'h01:
                begin
                    bios_protect_flag   <= 2'b00;
                    bios_access_request <= 1'b1;
                    bios_write_byte_cnt <= 1'h0;
                    tandy_bios_write    <= select_tandy;

                    if (~ioctl_download)
                    begin
                        bios_access_address <= 20'hFFFFF;
                        bios_write_data     <= 16'hFFFF;
                        bios_write_n        <= 1'b1;
                        bios_write_wait_cnt <= 'h0;
                        ioctl_wait          <= 1'b0;
                        bios_load_state     <= 4'h00;
                    end
                    else if ((~ioctl_wr) || (bios_load_n))
                    begin
                        bios_access_address <= 20'hFFFFF;
                        bios_write_data     <= 16'hFFFF;
                        bios_write_n        <= 1'b1;
                        bios_write_wait_cnt <= 'h0;
                        ioctl_wait          <= 1'b0;
                        bios_load_state     <= 4'h01;
                    end
                    else
                    begin
                        bios_access_address <= bios_access_address_wire;
                        bios_write_data     <= {8'hFF,ioctl_data};
                        bios_write_n        <= 1'b1;
                        bios_write_wait_cnt <= 'h0;
                        ioctl_wait          <= 1'b1;
                        bios_load_state     <= 4'h02;
                    end
                end
                4'h02:
                begin
                    bios_protect_flag   <= 2'b00;
                    bios_access_request <= 1'b1;
                    bios_access_address <= bios_access_address;
                    bios_write_data     <= bios_write_data;
                    bios_write_byte_cnt <= bios_write_byte_cnt;
                    tandy_bios_write    <= select_tandy;
                    ioctl_wait          <= 1'b1;
                    bios_write_wait_cnt <= bios_write_wait_cnt + 'h1;

                    if (bios_write_wait_cnt != 'd20)
                    begin
                        bios_write_n        <= 1'b0;
                        bios_load_state     <= 4'h02;
                    end
                    else
                    begin
                        bios_write_n        <= 1'b1;
                        bios_load_state     <= 4'h03;
                    end
                end
                4'h03:
                begin
                    bios_protect_flag   <= 2'b00;
                    bios_access_request <= 1'b1;
                    bios_access_address <= 20'hFFFFF;
                    bios_write_data     <= 16'hFFFF;
                    bios_write_n        <= 1'b1;
                    bios_write_byte_cnt <= bios_write_byte_cnt;
                    tandy_bios_write    <= 1'b0;
                    ioctl_wait          <= 1'b1;
                    bios_write_wait_cnt <= bios_write_wait_cnt + 'h1;

                    if (bios_write_wait_cnt != 'd40)       //'h40 does not load BIOS
                        bios_load_state     <= 4'h03;
                    else
                        bios_load_state     <= 4'h01;
                end
                default:
                begin
                    bios_protect_flag   <= 2'b11;
                    bios_access_request <= 1'b0;
                    bios_access_address <= 20'hFFFFF;
                    bios_write_data     <= 16'hFFFF;
                    bios_write_n        <= 1'b1;
                    bios_write_wait_cnt <= 'h0;
                    bios_write_byte_cnt <= 1'h0;
                    tandy_bios_write    <= 1'b0;
                    ioctl_wait          <= 1'b0;
                    bios_load_state     <= 4'h00;
                end
            endcase
        end
    end


    //////////////////////////////////////////////////////////////////

    //
    // Splash screen
    //
    reg splash_off;
    reg [24:0] splash_cnt = 0;
    reg [3:0] splash_cnt2 = 0;
    reg splashscreen = 1;

    always @ (posedge clk_14_318)
    begin
        splash_off <= status[7];

        if (splashscreen)
        begin
            if (splash_off)
                splashscreen <= 0;
            else if(splash_cnt2 == 5) // 5 seconds delay
                splashscreen <= 0;
            else if (splash_cnt == 14318000)
            begin // 1 second at 14.318Mhz
                splash_cnt2 <= splash_cnt2 + 1;
                splash_cnt <= 0;
            end
            else
                splash_cnt <= splash_cnt + 1;
        end

    end


    `ifdef MIST_SIDI

    wire device_clock = ps2_kbd_clk_in;
    wire device_data  = ps2_kbd_data_in;

    `else

    //
    // Input F/F PS2_CLK
    //
    logic   device_clock_ff;
    logic   device_clock_ff2;
    logic   device_clock_ff3;
    logic   device_clock;

    always_ff @(posedge clk_chipset, posedge reset)
    begin
        if (reset)
        begin
            device_clock_ff  <= 1'b0;
            device_clock_ff2 <= 1'b0;
            device_clock_ff3 <= 1'b0;
            device_clock     <= 1'b0;
        end
        else
        begin
            device_clock_ff  <= ps2_kbd_clk_in;
            device_clock_ff2 <= device_clock_ff;
            device_clock_ff3 <= device_clock_ff2;
            device_clock     <= device_clock_ff3 ;
        end
    end


    //
    // Input F/F PS2_DAT
    //
    logic   device_data_ff;
    logic   device_data_ff2;
    logic   device_data_ff3;
    logic   device_data;

    always_ff @(posedge clk_chipset, posedge reset)
    begin
        if (reset)
        begin
            device_data_ff  <= 1'b0;
            device_data_ff2 <= 1'b0;
            device_data_ff3 <= 1'b0;
            device_data     <= 1'b0;
        end
        else
        begin
            device_data_ff  <= ps2_kbd_data_in;
            device_data_ff2 <= device_data_ff;
            device_data_ff3 <= device_data_ff2;
            device_data     <= device_data_ff3;
        end
    end

    `endif


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

    always @(posedge clk_chipset)
    begin
        if (address_latch_enable)
            cpu_address <= cpu_ad_out;
        else
            cpu_address <= cpu_address;
    end

    CHIPSET #(.clk_rate(cur_rate)) u_CHIPSET
	(
		.clock                              (clk_chipset),
		.cpu_clock                          (clk_cpu),
		.clk_sys                            (clk_chipset),
		.peripheral_clock                   (pclk),
		.clk_select                         (clk_select),
		.color							    (color),
		.reset                              (reset_cpu),
		.sdram_reset                        (reset_sdram),
		.cpu_address                        (cpu_address),
		.cpu_data_bus                       (cpu_data_bus),
		.processor_status                   (processor_status),
		.processor_lock_n                   (lock_n),
	//	.processor_transmit_or_receive_n    (processor_transmit_or_receive_n),
		.processor_ready                    (processor_ready),
		.interrupt_to_cpu                   (interrupt_to_cpu),
		.splashscreen                       (splashscreen),
	//	.std_hsyncwidth                     (std_hsyncwidth),
	//	.composite                          (composite),
		.video_output                       (mda_mode_video_ff),
		.clk_vga_cga                        (clk_28_636),
		.enable_cga                         (1'b1),
		.clk_vga_mda                        (clk_56_875),
		.enable_mda                         (1'b1),
		.mda_rgb                            (2'b10), // always B&W - monochrome monitor tint handled down below
	//	.de_o                               (VGA_DE),
		.VGA_R                              (r_in),
		.VGA_G                              (g_in),
		.VGA_B                              (b_in),
		.VGA_HSYNC                          (vga_hs),
		.VGA_VSYNC                          (vga_vs),
		.VGA_HBlank	  				        (HBlank),
		.VGA_VBlank							(VBlank),
	//	.VGA_VBlank_border                  (VGA_VBlank_border),
		.scandoubler						(~forced_scandoubler),
        .comp_video                         (comp_video),
        .composite_on                       (composite_on),
        .vga_composite                      (vga_composite),
        .composite_out                      (COMPOSITE_OUT),
        .rgb_18b                            (rgb_18b),
	//	.address                            (address),
		.address_ext                        (bios_access_address),
		.ext_access_request                 (bios_access_request),
		.address_direction                  (address_direction),
		.data_bus                           (data_bus),
		.data_bus_ext                       (bios_write_data[7:0]),
	//	.data_bus_direction                 (data_bus_direction),
		.address_latch_enable               (address_latch_enable),
	//  .io_channel_check                   (),
		.io_channel_ready                   (1'b1),
		.interrupt_request                  (0),    // use?	-> It does not seem to be necessary.
	//  .io_read_n                          (io_read_n),
		.io_read_n_ext                      (1'b1),
	//  .io_read_n_direction                (io_read_n_direction),
	//  .io_write_n                         (io_write_n),
		.io_write_n_ext                     (1'b1),
	//  .io_write_n_direction               (io_write_n_direction),
	//  .memory_read_n                      (memory_read_n),
		.memory_read_n_ext                  (1'b1),
	//  .memory_read_n_direction            (memory_read_n_direction),
	//  .memory_write_n                     (memory_write_n),
		.memory_write_n_ext                 (bios_write_n),
	//  .memory_write_n_direction           (memory_write_n_direction),
		.dma_request                        (0),    // use?	-> I don't know if it will ever be necessary, at least not during testing.
		.dma_acknowledge_n                  (dma_acknowledge_n),
	//  .address_enable_n                   (address_enable_n),
	//  .terminal_count_n                   (terminal_count_n)
		.port_b_out                         (port_b_out),
		.port_c_in                          (port_c_in),
		.port_b_in                          (port_b_out),
		.speaker_out                        (speaker_out),
		.ps2_clock                          (device_clock),
		.ps2_data                           (device_data),
		.ps2_clock_out                      (ps2_kbd_clk_out),
		.ps2_data_out                       (ps2_kbd_data_out),
		.ps2_mouseclk_in                    (ps2_mouse_clk_in),
		.ps2_mousedat_in                    (ps2_mouse_data_in),
		.ps2_mouseclk_out                   (ps2_mouse_clk_out),
		.ps2_mousedat_out                   (ps2_mouse_data_out),
		.joy_opts                           (joy_opts),           //Joy0-Disabled, Joy0-Type, Joy1-Disabled, Joy1-Type, turbo_sync
		.joy0                               (status[28] ? joy1 : joy0),
		.joy1                               (status[28] ? joy0 : joy1),
		.joya0                              (status[28] ? joya1[15:0] : joya0[15:0]),
		.joya1                              (status[28] ? joya0[15:0] : joya1[15:0]),
		.jtopl2_snd_e                       (jtopl2_snd_e),
		.tandy_snd_e                        (tandy_snd_e),
		.opl2_io                            (xtctl[4] ? 2'b10 : status[41:40]),
		.cms_en                             (~status[10]),
		.o_cms_l                            (cms_l_snd_e),
		.o_cms_r                            (cms_r_snd_e),
		.tandy_video                        (tandy_mode),
		.tandy_bios_flag                    (tandy_bios_flag),
	//	.tandy_16_gfx                       (tandy_16_gfx),
	//	.tandy_color_16                     (tandy_color_16),
    //  .clk_uart                           ((status[22:21] == 2'b00) ? clk_uart : clk_uart_en),   //debug
        .clk_uart                           (clk_uart),
		.clk_uart2                          (clk_uart2_en),
		.uart_rx                            (UART_RX),
		.uart_tx                            (UART_TX),
		.uart_cts_n                         (UART_CTS),
		.uart_dcd_n                         (1'b0), 	//(uart_dcd),
		.uart_dsr_n                         (1'b0),		//(uart_dsr),
		.uart_rts_n                         (UART_RTS),
	//	.uart_dtr_n                         (uart_dtr),
		.enable_sdram                       (1'b1),
		.initilized_sdram                   (initilized_sdram),
		.sdram_clock                        (clk_chipset),    //SDRAM_CLK phased is sent to SDRAM pin 
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
		.ide0_addr                          (ide0_addr),
		.ide0_writedata                     (ide0_writedata),
		.ide0_readdata                      (ide0_readdata),
		.ide0_read                          (ide0_read),
		.ide0_write                         (ide0_write),
		.rtc_data                           (rtc_data),
		.xtctl                              (xtctl),
		.enable_a000h                       (a000h),
		.wait_count_clk_en                  (~clk_cpu & clk_cpu_ff_2),
		.ram_read_wait_cycle                (ram_read_wait_cycle),
		.ram_write_wait_cycle               (ram_write_wait_cycle),
		.pause_core                         (pause_core)
	);

    wire [15:0] SDRAM_DQ_IN;
    wire [15:0] SDRAM_DQ_OUT;
    wire        SDRAM_DQ_IO;
    wire        initilized_sdram;

    assign SDRAM_DQ_IN = SDRAM_DQ;
    assign SDRAM_DQ = ~SDRAM_DQ_IO ? SDRAM_DQ_OUT : 16'hZZZZ;

    wire s6_3_mux;
    wire [2:0] SEGMENT;

    i8088 B1 	
	(
		.CORE_CLK(clk_100),
		.CLK(clk_cpu),

		.RESET(reset_cpu),
		.READY(processor_ready && ~pause_core),
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
		.cycle_accrate(cycle_accrate),
		.clock_cycle_counter_division_ratio(clock_cycle_counter_division_ratio),
		.clock_cycle_counter_decrement_value(clock_cycle_counter_decrement_value),
		.shift_read_timing(shift_read_timing)
	);

    //
    ////////////////////////////  AUDIO  ///////////////////////////////////
    //

    wire [15:0] cms_l_snd_e;
    wire [16:0] cms_l_snd = {cms_l_snd_e[15],cms_l_snd_e};
    wire [15:0] cms_r_snd_e;
    wire [16:0] cms_r_snd = {cms_r_snd_e[15],cms_r_snd_e};
	 
    wire [15:0] jtopl2_snd_e;
    wire [16:0] jtopl2_snd = {jtopl2_snd_e[15], jtopl2_snd_e};
    wire [10:0] tandy_snd_e;
    wire [16:0] tandy_snd = {{{2{tandy_snd_e[10]}}, {4{tandy_snd_e[10]}}, tandy_snd_e} << status[35:34], 2'b00};
    wire [16:0] spk_vol =  {2'b00, {3'b000,~speaker_out} << status[33:32], 11'd0};
    wire        speaker_out;

    localparam [3:0] comp_f1 = 4;
    localparam [3:0] comp_a1 = 2;
    localparam       comp_x1 = ((32767 * (comp_f1 - 1)) / ((comp_f1 * comp_a1) - 1)) + 1; // +1 to make sure it won't overflow
    localparam       comp_b1 = comp_x1 * comp_a1;

    localparam [3:0] comp_f2 = 8;
    localparam [3:0] comp_a2 = 4;
    localparam       comp_x2 = ((32767 * (comp_f2 - 1)) / ((comp_f2 * comp_a2) - 1)) + 1; // +1 to make sure it won't overflow
    localparam       comp_b2 = comp_x2 * comp_a2;

    function [15:0] compr;
        input [15:0] inp;
        reg [15:0] v, v1, v2;
        begin
            v  = inp[15] ? (~inp) + 1'd1 : inp;
            v1 = (v < comp_x1[15:0]) ? (v * comp_a1) : (((v - comp_x1[15:0])/comp_f1) + comp_b1[15:0]);
            v2 = (v < comp_x2[15:0]) ? (v * comp_a2) : (((v - comp_x2[15:0])/comp_f2) + comp_b2[15:0]);
            v  = status[37] ? v2 : v1;
            compr = inp[15] ? ~(v-1'd1) : v;
        end
    endfunction

    reg [15:0] cmp_l;
    reg [15:0] out_l;
    always @(posedge clk_chipset)
    begin
        reg [16:0] tmp_l;

        tmp_l <= jtopl2_snd + cms_l_snd + tandy_snd + spk_vol;

        // clamp the output
        out_l <= (^tmp_l[16:15]) ? {tmp_l[16], {15{tmp_l[15]}}} : tmp_l[15:0];

        cmp_l <= compr(out_l);
    end
	 
    reg [15:0] cmp_r;
    reg [15:0] out_r;
    always @(posedge clk_chipset)
    begin
        reg [16:0] tmp_r;

        tmp_r <= jtopl2_snd + cms_r_snd + tandy_snd + spk_vol;

        // clamp the output
        out_r <= (^tmp_r[16:15]) ? {tmp_r[16], {15{tmp_r[15]}}} : tmp_r[15:0];

        cmp_r <= compr(out_r);
    end

	`ifdef DEMISTIFY	//needed for not getting error in Quartus compilation for MiST board
		assign DAC_L =  pause_core ? 1'b0 : status[37:36] ? cmp_l : out_l;
		assign DAC_R =  pause_core ? 1'b0 : status[37:36] ? cmp_r : out_r;

        assign CLK_CHIPSET = clk_chipset;
	`endif

    sigma_delta_dac sigma_delta_dac 
	(
		.clk      ( clk_chipset ),      // bus clock
		.ldatasum ( pause_core ? 1'b0 : status[37:36] ? cmp_l : out_l ),      // left channel data		(ok1) sndmix >> 1 bad, (ok2) sndmix >> 2 ok
		.rdatasum ( pause_core ? 1'b0 : status[37:36] ? cmp_r : out_r ),      // right channel data		sndmix_pcm >> 1 bad, sndmix_pcm >> 2 bad
		.left     ( AUDIO_L     ),      // left bitstream output
		.right    ( AUDIO_R     )       // right bitsteam output
	);

    //
    ////////////////////////////  UART  ///////////////////////////////////
    //

    logic clk_uart_ff_1;
    logic clk_uart_ff_2;
    logic clk_uart_ff_3;
    logic clk_uart_en;
    logic clk_uart2_en;
    logic [2:0] clk_uart2_counter;

    always @(posedge clk_chipset)
    begin
        clk_uart_ff_1 <= clk_uart;
        clk_uart_ff_2 <= clk_uart_ff_1;
        clk_uart_ff_3 <= clk_uart_ff_2;
        clk_uart_en   <= ~clk_uart_ff_3 & clk_uart_ff_2;
    end

    always @(posedge clk_chipset)
    begin
        if (clk_uart_en)
        begin
            if (3'd7 != clk_uart2_counter)
            begin
                clk_uart2_counter <= clk_uart2_counter +3'd1;
                clk_uart2_en <= 1'b0;
            end
            else
            begin
                clk_uart2_counter <= 3'd0;
                clk_uart2_en <= 1'b1;
            end
        end
        else
        begin
            clk_uart2_counter <= clk_uart2_counter;
            clk_uart2_en <= 1'b0;
        end
    end

	// UART1 connected to external cable to host for serdrive
	// UART2 connected internally in Peripherals.sv for serial mouse


    //
    ///////////////////////   VIDEO   ///////////////////////
    //

    wire HBlank;
    wire HSync;
    wire VBlank;
    wire VSync;
    wire ce_pixel;
    wire de_o;

    wire [5:0] r_in, g_in, b_in;
    reg  [7:0] raux,  gaux,  baux;
    wire [5:0] raux2, gaux2, baux2;
    wire [5:0] raux3, gaux3, baux3;
    reg  [7:0] raux4, gaux4, baux4;

    wire vga_hs;
    wire vga_vs;
    wire vga_hs_o;
    wire vga_vs_o;

    wire [6:0] comp_video;
    wire [17:0] rgb_18b;
    wire clk_vid;

    assign CLK_VIDEO = clk_56_875;
    assign ce_pixel = 1'b1;
    assign clk_vid = mda_mode_video_ff ? clk_56_875 : clk_28_636;

    wire color = (screen_mode_video_ff == 3'd0);

    video_monochrome_converter video_mono
	(
		.clk_vid(clk_vid),
		.ce_pix(ce_pixel),

		.R({r_in, 2'b00}),
		.G({g_in, 2'b00}),
		.B({b_in, 2'b00}),

		.gfx_mode(screen_mode_video_ff),

		.R_OUT(raux),
		.G_OUT(gaux),
		.B_OUT(baux)
	);

    // display_mode_disable default is 0
    assign raux2 = display_mode_disable ? r_in : raux[7:2];
    assign gaux2 = display_mode_disable ? g_in : gaux[7:2];
    assign baux2 = display_mode_disable ? b_in : baux[7:2];


    mist_video #( .SD_HCNT_WIDTH(10) ) mist_video    //.OSD_COLOR(3'd5),
	(
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
		.ypbpr       ( status[42] ),					// 1'b0
		// Rotate OSD [0] - rotate [1] - left or right
		.rotate      ( 2'b00      ),
		// composite-like blending
		.blend       ( status[43] ),					// 1'b0

		// video in
		.R           ( raux2      ),
		.G           ( gaux2      ),
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

    // osd_disable default is 0
    assign raux4  = osd_disable ? {raux2,raux2[1:0]} : {raux3,raux3[1:0]};
    assign gaux4  = osd_disable ? {gaux2,gaux2[1:0]} : {gaux3,gaux3[1:0]};
    assign baux4  = osd_disable ? {baux2,baux2[1:0]} : {baux3,baux3[1:0]};

    assign rgb_18b = {raux4[7:2],gaux4[7:2],baux4[7:2]};    // for composite real video output

    // osd_disable default is 0
    assign VGA_VS = osd_disable ? ~vga_vs : ~vga_vs_o;
    assign VGA_HS = osd_disable ? ~vga_hs : ~vga_hs_o;
    assign VGA_DE = ~(HBlank | VBlank);

    `ifdef NO_CREDITS
    assign VGA_R = composite_on ?                        8'd0 : raux4;
    assign VGA_G = composite_on ?  {comp_video,comp_video[0]} : gaux4;
    assign VGA_B = composite_on ?                        8'd0 : baux4;

    `else
    assign VGA_R = pause_core ? pre2x_r : composite_on ?                        8'd0 : raux4;
    assign VGA_G = pause_core ? pre2x_g : composite_on ?  {comp_video,comp_video[0]} : gaux4;
    assign VGA_B = pause_core ? pre2x_b : composite_on ?                        8'd0 : baux4;

    // JTFRAME CREDITS.  
    // TODO: SIGNALS to be updated 
    //wire LHBL = border_video_ff ? HBlank_fixed : HBlank_VGA;
    //wire LVBL = border_video_ff ? std_hsyncwidth ? VGA_VBlank_border : ~VSync : VBlank;
    //wire       pre2x_LHBL, pre2x_LVBL;

    wire [7:0] pre2x_r, pre2x_g, pre2x_b;

    jtframe_credits #(
        .PAGES  (4),
        .COLW   (8),
        .BLKPOL (1)
    ) u_credits(
        .rst        ( reset       ),
        .clk        ( clk_56_875  ), //clk_chipset not good  
        //.pxl_cen    ( mda_mode_video_ff ? clk_14_318 : clk_56_875   ), // clk_14_318 ok in MDA, clk_28_636 or clk_56_875 better in CGA
        .pxl_cen    ( clk_14_318  ), 
        
        // input image
        .HB         ( HBlank  ),  //LHBL
        .VB         ( VBlank  ),  //LVBL
        .rgb_in     ( { raux, gaux, baux } ),

        // control
        .enable     ( pause_core ),
        .rotate     ( 2'd0  ),
        .toggle     ( 1'b0  ),
        .fast_scroll( 1'b0  ),
        .border     ( 1'b1 ),  //border_video_ff
        .vram_ctrl  ( 3'b0  ),

        // Optional VRAM control
        .vram_din   ( 8'h0  ),
        .vram_dout  (       ),
        .vram_addr  ( 8'h0  ),
        .vram_we    ( 1'b0  ),

        // output image
        .HB_out     (       ),  //pre2x_LHBL
        .VB_out     (       ),  //pre2x_LVBL
        .rgb_out    ( {pre2x_r, pre2x_g, pre2x_b } )
    );

    `endif


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
