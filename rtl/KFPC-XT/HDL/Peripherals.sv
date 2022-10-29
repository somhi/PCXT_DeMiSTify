//
// KFPC-XT Peripherals
// Written by kitune-san
//
module PERIPHERALS #(
        parameter ps2_over_time = 16'd1000
    ) (
        input   logic           clock,
        input   logic           clk_sys,
        input   logic           cpu_clock,
        input   logic           peripheral_clock,
        input   logic   [1:0]   turbo_mode,
        input   logic           color,
        input   logic           reset,
        // CPU
        output  logic           interrupt_to_cpu,
        // Bus Arbiter
        input   logic           interrupt_acknowledge_n,
        output  logic           dma_chip_select_n,
        output  logic           dma_page_chip_select_n,
        // SplashScreen
        input   logic           splashscreen,
        // VGA
        input   logic           video_output,
        input   logic           clk_vga_cga,
        input   logic           enable_cga,
        input   logic           clk_vga_mda,
        input   logic           enable_mda,
        input   logic   [1:0]   mda_rgb,
        output  logic           de_o,
        output  logic   [5:0]   VGA_R,
        output  logic   [5:0]   VGA_G,
        output  logic   [5:0]   VGA_B,
        output  logic           VGA_HSYNC,
        output  logic           VGA_VSYNC,
        output  logic           VGA_HBlank,
        output  logic           VGA_VBlank,
        input   logic           scandoubler,
        output  reg     [6:0]   comp_video,
        output  logic   [1:0]   composite_out,
        input   logic           composite_on,
        input   logic           vga_composite,       
        input   logic   [17:0]  rgb_18b,
        // I/O Ports
        input   logic   [19:0]  address,
        input   logic   [7:0]   internal_data_bus,
        output  logic   [7:0]   data_bus_out,
        output  logic           data_bus_out_from_chipset,
        input   logic   [7:0]   interrupt_request,
        input   logic           io_read_n,
        input   logic           io_write_n,
        input   logic           memory_read_n,
        input   logic           memory_write_n,
        input   logic           address_enable_n,
        // Peripherals
        output  logic   [2:0]   timer_counter_out,
        output  logic           speaker_out,
        output  logic   [7:0]   port_a_out,
        output  logic           port_a_io,
        input   logic   [7:0]   port_b_in,
        output  logic   [7:0]   port_b_out,
        output  logic           port_b_io,
        input   logic   [7:0]   port_c_in,
        output  logic   [7:0]   port_c_out,
        output  logic   [7:0]   port_c_io,
        input   logic           ps2_clock,
        input   logic           ps2_data,
        output  logic           ps2_clock_out,
        output  logic           ps2_data_out,
        input   logic           ps2_mouseclk_in,
        input   logic           ps2_mousedat_in,
        output  logic           ps2_mouseclk_out,
        output  logic           ps2_mousedat_out,
        input   logic   [4:0]   joy_opts,
        input   logic   [31:0]  joy0,
        input   logic   [31:0]  joy1,
        input   logic   [15:0]  joya0,
        input   logic   [15:0]  joya1,
        // JTOPL
        input   logic           clk_en_opl2,
        output  logic   [15:0]  jtopl2_snd_e,
        input   logic           adlibhide,
        // TANDY
        input   logic           tandy_video,
        output  logic   [7:0]   tandy_snd_e,
        output  logic           tandy_snd_rdy,
        // UART
        input   logic           clk_uart,
        input   logic           clk_uart2,
        input   logic           uart_rx,
        output  logic           uart_tx,
        input   logic           uart_cts_n,
        input   logic           uart_dcd_n,
        input   logic           uart_dsr_n,
        output  logic           uart_rts_n,
        output  logic           uart_dtr_n,
        // EMS
        input   logic           ems_enabled,
        input   logic   [1:0]   ems_address,
        output  reg     [6:0]   map_ems[0:3], // Segment hE000, hE400, hE800, hEC00
        output  reg             ena_ems[0:3], // Enable Segment Map hE000, hE400, hE800, hEC00
        output  logic           ems_b1,
        output  logic           ems_b2,
        output  logic           ems_b3,
        output  logic           ems_b4,
        input   logic   [2:0]   bios_writable
    );

    wire grph_mode;
    wire hres_mode;



    //
    // CPU clock edge
    //
    logic   prev_cpu_clock;

    always_ff @(posedge clock, posedge reset)
    begin
        if (reset)
            prev_cpu_clock <= 1'b0;
        else
            prev_cpu_clock <= cpu_clock;
    end

    wire    cpu_clock_posedge = ~prev_cpu_clock & cpu_clock;
    wire    cpu_clock_negedge = prev_cpu_clock & ~cpu_clock;


    //
    // chip select
    //
    logic   [7:0]   chip_select_n;

    always_comb
    begin
        if (~address_enable_n & ~address[9] & ~address[8])
        begin
            casez (address[7:5])
                3'b000:
                    chip_select_n = 8'b11111110;
                3'b001:
                    chip_select_n = 8'b11111101;
                3'b010:
                    chip_select_n = 8'b11111011;
                3'b011:
                    chip_select_n = 8'b11110111;
                3'b100:
                    chip_select_n = 8'b11101111;
                3'b101:
                    chip_select_n = 8'b11011111;
                3'b110:
                    chip_select_n = 8'b10111111;
                3'b111:
                    chip_select_n = 8'b01111111;
                default:
                    chip_select_n = 8'b11111111;
            endcase
        end
        else
        begin
            chip_select_n = 8'b11111111;
        end
    end

    wire    iorq = ~io_read_n | ~io_write_n;

    assign  dma_chip_select_n       = iorq && chip_select_n[0];
    wire    interrupt_chip_select_n = iorq && chip_select_n[1];
    wire    timer_chip_select_n     = iorq && chip_select_n[2];
    wire    ppi_chip_select_n       = iorq && chip_select_n[3];
    assign  dma_page_chip_select_n  = iorq && chip_select_n[4];

    wire    joystick_select        = (iorq && ~address_enable_n && address[15:3] == (16'h0200 >> 3)); // 0x200 .. 0x207
    wire    nmi_mask_register_n    = ~(tandy_video && iorq && ~address_enable_n && address[15:3] == (16'h00a0 >> 3)); // 0xa0 - 0xa7

    wire    tandy_chip_select_n    = ~(iorq && ~address_enable_n && address[15:3] == (16'h00c0 >> 3)); // 0xc0 - 0xc7
    wire    opl_chip_select_n      = ~(iorq && ~address_enable_n && address[15:1] == (16'h0388 >> 1)); // 0x388 .. 0x389
    wire    video_chip_select_n    = ~((tandy_video & grph_mode & hres_mode) && ~iorq && ~address_enable_n & (address[19:17] == nmi_mask_register_data[3:1])); // 128KB
    wire    cga_chip_select_n      = ~(~iorq && ~address_enable_n && enable_cga & (address[19:15] == 5'b10111)); // B8000 - BFFFF (16 KB / 32 KB)
    wire    mda_chip_select_n      = ~(~iorq && ~address_enable_n && enable_mda & (address[19:15] == 6'b10110)); // B0000 - B7FFF (8 repeated blocks of 4Kb)
    wire    uart_cs                =  (~address_enable_n && {address[15:3], 3'd0} == 16'h03F8);
    wire    uart2_cs               =  (~address_enable_n && {address[15:3], 3'd0} == 16'h02F8);
    wire    lpt_cs                 =  (iorq && ~address_enable_n && address[15:0] == 16'h0378);
    wire    tandy_page_cs          =  (iorq && ~address_enable_n && address[15:0] == 16'h03DF);

    wire    [3:0] ems_page_address = (ems_address == 2'b00) ? 4'b1010 : (ems_address == 2'b01) ? 4'b1100 : 4'b1101;
    wire    ems_oe                 = (iorq && ~address_enable_n && ems_enabled && ({address[15:2], 2'd0} == 16'h0260));          // 260h..263h
    assign  ems_b1                 = (~iorq && ena_ems[0] && (address[19:14] == {ems_page_address, 2'b00})); // A0000h - C0000h - D0000h
    assign  ems_b2                 = (~iorq && ena_ems[1] && (address[19:14] == {ems_page_address, 2'b01})); // A4000h - C4000h - D4000h
    assign  ems_b3                 = (~iorq && ena_ems[2] && (address[19:14] == {ems_page_address, 2'b10})); // A8000h - C8000h - D8000h
    assign  ems_b4                 = (~iorq && ena_ems[3] && (address[19:14] == {ems_page_address, 2'b11})); // AC000h - CC000h - DC000h


    logic   [1:0]   ems_access_address;
    logic           ems_write_enable;
    logic   [7:0]   write_map_ems_data;
    logic           write_map_ena_data;

    always_ff @(posedge clock, posedge reset)
    begin
        if (reset)
        begin
            ems_access_address  <= 2'b11;
            ems_write_enable    <= 1'b0;
            write_map_ems_data  <= 8'd0;
            write_map_ena_data  <= 1'b0;
        end
        else
        begin
            ems_access_address  <= address[1:0];
            ems_write_enable    <= ems_oe && ~io_write_n;
            write_map_ems_data  <= (internal_data_bus == 8'hFF) ? 8'hFF : (internal_data_bus < 8'h80) ? internal_data_bus[6:0] : map_ems[address[1:0]];
            write_map_ena_data  <= (internal_data_bus == 8'hFF) ? 1'b0  : (internal_data_bus < 8'h80) ? 1'b1 : ena_ems[address[1:0]];
        end
    end

    always_ff @(posedge clock, posedge reset)
    begin
        if (reset)
        begin
            map_ems = '{7'h00, 7'h00, 7'h00, 7'h00};
            ena_ems = '{1'b0, 1'b0, 1'b0, 1'b0};
        end
        else if (ems_write_enable)
        begin
            map_ems[ems_access_address] <= write_map_ems_data;
            ena_ems[ems_access_address] <= write_map_ena_data;
        end
    end


    //
    // 8259
    //
    logic           timer_interrupt;
    logic           keybord_interrupt;
    logic           uart_interrupt;
    logic           uart2_interrupt;
    logic   [7:0]   interrupt_data_bus_out;

    KF8259 u_KF8259 
    (
        // Bus
        .clock                      (clock),
        .reset                      (reset),
        .chip_select_n              (interrupt_chip_select_n),
        .read_enable_n              (io_read_n),
        .write_enable_n             (io_write_n),
        .address                    (address[0]),
        .data_bus_in                (internal_data_bus),
        .data_bus_out               (interrupt_data_bus_out),

        // I/O
        .cascade_in                 (3'b000),
        //.cascade_out                (),
        //.cascade_io                 (),
        .slave_program_n            (1'b1),
        //.buffer_enable              (),
        //.slave_program_or_enable_buffer     (),
        .interrupt_acknowledge_n    (interrupt_acknowledge_n),
        .interrupt_to_cpu           (interrupt_to_cpu),
        .interrupt_request          ({interrupt_request[7:5],
                                        uart_interrupt,
                                        uart2_interrupt & ~uart2_cs,   //kitune-san change to force IRQ go low every time accessing UART
                                        interrupt_request[2],
                                        keybord_interrupt,
                                        timer_interrupt})
    );

    //
    // 8253
    //
    logic   prev_p_clock_1;
    logic   prev_p_clock_2;
    always_ff @(posedge clock, posedge reset)
    begin
        if (reset)
        begin
            prev_p_clock_1 <= 1'b0;
            prev_p_clock_2 <= 1'b0;
        end
        else
        begin
            prev_p_clock_1 <= peripheral_clock;
            prev_p_clock_2 <= prev_p_clock_1;

        end
    end

    wire    p_clock_posedge = prev_p_clock_1 & ~prev_p_clock_2;

    logic   timer_clock;
    always_ff @(posedge clock, posedge reset)
    begin
        if (reset)
            timer_clock         <= 1'b0;
        else if (p_clock_posedge)
            timer_clock         <= ~timer_clock;
        else
            timer_clock         <= timer_clock;
    end

    logic   [7:0]   timer_data_bus_out;

    wire    tim2gatespk = port_b_out[0] & ~port_b_io;
    wire    spkdata     = port_b_out[1] & ~port_b_io;

    KF8253 u_KF8253 
    (
        // Bus
        .clock                      (clock),
        .reset                      (reset),
        .chip_select_n              (timer_chip_select_n),
        .read_enable_n              (io_read_n),
        .write_enable_n             (io_write_n),
        .address                    (address[1:0]),
        .data_bus_in                (internal_data_bus),
        .data_bus_out               (timer_data_bus_out),

        // I/O
        .counter_0_clock            (timer_clock),
        .counter_0_gate             (1'b1),
        .counter_0_out              (timer_counter_out[0]),
        .counter_1_clock            (timer_clock),
        .counter_1_gate             (1'b1),
        .counter_1_out              (timer_counter_out[1]),
        .counter_2_clock            (timer_clock),
        .counter_2_gate             (tim2gatespk),
        .counter_2_out              (timer_counter_out[2])
    );

    assign  timer_interrupt = timer_counter_out[0];
    assign  speaker_out     = timer_counter_out[2] & spkdata;

    //
    // 8255
    //
    logic   [7:0]   ppi_data_bus_out;
    logic   [7:0]   port_a_in;

    KF8255 u_KF8255 
    (
        // Bus
        .clock                      (clock),
        .reset                      (reset),
        .chip_select_n              (ppi_chip_select_n),
        .read_enable_n              (io_read_n),
        .write_enable_n             (io_write_n),
        .address                    (address[1:0]),
        .data_bus_in                (internal_data_bus),
        .data_bus_out               (ppi_data_bus_out),

        // I/O
        .port_a_in                  (port_a_in),
        .port_a_out                 (port_a_out),
        .port_a_io                  (port_a_io),
        .port_b_in                  (port_b_in),
        .port_b_out                 (port_b_out),
        .port_b_io                  (port_b_io),
        .port_c_in                  (port_c_in),
        .port_c_out                 (port_c_out),
        .port_c_io                  (port_c_io)
    );

    //
    // KFPS2KB
    //
    logic           ps2_send_clock;
    logic           keybord_irq;
    logic           uart_irq;
    logic           uart2_irq;
    logic   [7:0]   keycode;
    logic   [7:0]   tandy_keycode;
    logic           prev_ps2_reset;
    logic           prev_ps2_reset_n;
    logic           lock_recv_clock;

    wire    clear_keycode = port_b_out[7];
    wire    ps2_reset_n   = ~tandy_video ? port_b_out[6] : 1'b1;

    always_ff @(posedge clock, posedge reset)
    begin
        if (reset)
            prev_ps2_reset_n <= 1'b0;
        else
            prev_ps2_reset_n <= ps2_reset_n;
    end

    KFPS2KB u_KFPS2KB 
    (
        // Bus
        .clock                      (clock),
        .peripheral_clock           (peripheral_clock),
        .reset                      (reset),

        // PS/2 I/O
        .device_clock               (ps2_clock | lock_recv_clock),
        .device_data                (ps2_data),

        // I/O
        .irq                        (keybord_irq),
        .keycode                    (keycode),
        .clear_keycode              (clear_keycode)
    );

    // Keybord reset
    KFPS2KB_Send_Data u_KFPS2KB_Send_Data 
    (
        // Bus
        .clock                      (clock),
        .peripheral_clock           (peripheral_clock),
        .reset                      (reset),

        // PS/2 I/O
        .device_clock               (ps2_clock),
        .device_clock_out           (ps2_send_clock),
        .device_data_out            (ps2_data_out),
        .sending_data_flag          (lock_recv_clock),

        // I/O
        .send_request               (~prev_ps2_reset_n & ps2_reset_n),
        .send_data                  (8'hFF)
    );

    // Convert Tandy scancode
    Tandy_Scancode_Converter u_Tandy_Scancode_Converter 
    (
        .clock                      (clock),
        .reset                      (reset),
        .scancode                   (keycode),
        .keybord_irq                (keybord_irq),
        .convert_data               (tandy_keycode)
    );

    always_ff @(posedge clock, posedge reset)
    begin
        if (reset)
            ps2_clock_out = 1'b1;
        else
            //ps2_clock_out = ~(keybord_irq | ~ps2_send_clock | ~ps2_reset_n);
            ps2_clock_out = ps2_send_clock;

    end


    wire [7:0] jtopl2_dout;
    wire [7:0] opl32_data;
    assign opl32_data = adlibhide ? 8'hFF : jtopl2_dout;


`ifdef NO_ADLIB

    // NO ADLIB SOUND

`else

    jtopl2 jtopl2_inst
    (
        .rst(reset),
        .clk(clock),
        .cen(clk_en_opl2),
        .din(internal_data_bus),
        .dout(jtopl2_dout),
        .addr(address[0]),
        .cs_n(opl_chip_select_n),
        .wr_n(io_write_n),
        .irq_n(),
        .snd(jtopl2_snd_e),
        .sample()
    );

`endif


    // Tandy sound
    sn76489_top sn76489
    (
        .clock_i(clock),
        .clock_en_i(clk_en_opl2), // 3.579MHz
        .res_n_i(~reset),
        .ce_n_i(tandy_chip_select_n),
        .we_n_i(io_write_n),
        .ready_o(tandy_snd_rdy),
        .d_i(internal_data_bus),
        .aout_o(tandy_snd_e)
    );

    logic   keybord_interrupt_ff;
    logic   uart_interrupt_ff;
    logic   uart2_interrupt_ff;
    always_ff @(posedge clock, posedge reset)
    begin
        if (reset)
        begin
            keybord_interrupt_ff    <= 1'b0;
            keybord_interrupt       <= 1'b0;
            uart_interrupt_ff       <= 1'b0;
            uart_interrupt          <= 1'b0;
            uart2_interrupt_ff      <= 1'b0;
            uart2_interrupt         <= 1'b0;
        end
        else
        begin
            keybord_interrupt_ff    <= keybord_irq;
            keybord_interrupt       <= keybord_interrupt_ff;
            uart_interrupt_ff       <= uart_irq;
            uart_interrupt          <= uart_interrupt_ff;
            uart2_interrupt_ff      <= uart2_irq;
            uart2_interrupt         <= uart2_interrupt_ff;
        end
    end

    logic	prev_io_read_n;
    logic	prev_io_write_n;
    logic	[7:0]	write_to_uart;
    logic	[7:0]	write_to_uart2;
    logic [7:0] uart_readdata_1;
    logic [7:0] uart_readdata;
    logic [7:0] uart2_readdata_1;
    logic [7:0] uart2_readdata;

    always_ff @(posedge clock)
    begin
        prev_io_read_n <= io_read_n;
        prev_io_write_n <= io_write_n;
    end

    logic   [7:0]   keycode_ff;
    always_ff @(posedge clock, posedge reset)
    begin
        if (reset)
        begin
            keycode_ff  <= 8'h00;
            port_a_in   <= 8'h00;
        end
        else
        begin
            keycode_ff  <= ~tandy_video ? keycode : tandy_keycode;
            port_a_in   <= keycode_ff;
        end
    end

    reg [7:0] lpt_data = 8'hFF;
    reg [7:0] tandy_page_data = 8'h00;
    reg [7:0] nmi_mask_register_data = 8'hFF;
    always_ff @(posedge clock)
    begin
        if (~io_write_n)
        begin
            write_to_uart <= internal_data_bus;
            write_to_uart2 <= internal_data_bus;
        end
        else
        begin
            write_to_uart <= write_to_uart;
            write_to_uart2 <= write_to_uart2;
        end

        if ((lpt_cs) && (~io_write_n))
            lpt_data <= internal_data_bus;

        if ((tandy_page_cs) && (~io_write_n))
            tandy_page_data <= internal_data_bus;

        if ((~nmi_mask_register_n) && (~io_write_n))
            nmi_mask_register_data <= internal_data_bus;

    end

    wire iorq_uart = (io_write_n & ~prev_io_write_n) || (~io_read_n  & prev_io_read_n);
    uart uart1
    (
        .clk               (clock),
        .br_clk            (clk_uart),
        .reset             (reset),

        .address           (address[2:0]),
        .writedata         (write_to_uart),
        .read              (~io_read_n  & prev_io_read_n),
        .write             (io_write_n & ~prev_io_write_n),
        .readdata          (uart_readdata_1),
        .cs                (uart_cs & iorq_uart),

        .rx                (uart_rx),
        .tx                (uart_tx),
        .cts_n             (uart_cts_n),
        .dcd_n             (uart_dcd_n),
        .dsr_n             (uart_dsr_n),
        .rts_n             (uart_rts_n),
        .dtr_n             (uart_dtr_n),
        .ri_n              (1),

        .irq               (uart_irq)
    );

    wire uart2_tx;
    wire rts_n;

    uart uart2
    (
        .clk               (clock),
        .br_clk            (clk_uart2),
        .reset             (reset),

        .address           (address[2:0]),
        .writedata         (write_to_uart2),
        .read              (~io_read_n  & prev_io_read_n),
        .write             (io_write_n & ~prev_io_write_n),
        .readdata          (uart2_readdata_1),
        .cs                (uart2_cs & iorq_uart),
        .rx                (uart2_tx),
        .cts_n             (0),
        .dcd_n             (0),
        .dsr_n             (0),
        .ri_n              (1),
        .rts_n             (rts_n),
        .irq               (uart2_irq)
    );

    MSMouseWrapper MSMouseWrapper_inst 
    (
        .clk(clock),
        .ps2dta_in(ps2_mousedat_in),
        .ps2clk_in(ps2_mouseclk_in),
        .ps2dta_out(ps2_mousedat_out),
        .ps2clk_out(ps2_mouseclk_out),
        .rts(~rts_n),
        .rd(uart2_tx)
    );

    // Timing of the readings may need to be reviewed.
    always_ff @(posedge clock)
    begin
        if (~io_read_n)
        begin
            uart_readdata <= uart_readdata_1;
            uart2_readdata <= uart2_readdata_1;
        end
        else
        begin
            uart_readdata <= uart_readdata;
            uart2_readdata <= uart2_readdata;
        end
    end


    logic  [16:0]  video_ram_address;
    logic  [7:0]   video_ram_data;
    logic          video_memory_write_n;
    logic          mda_chip_select_n_1;
    logic          cga_chip_select_n_1;
    logic          video_chip_select_n_1;
    logic  [14:0]  video_io_address;
    logic  [7:0]   video_io_data;
    logic          video_io_write_n;
    logic          video_io_read_n;
    logic          video_address_enable_n;
    logic  [14:0]  mda_io_address_1;
    logic  [14:0]  mda_io_address_2;
    logic  [7:0]   mda_io_data_1;
    logic  [7:0]   mda_io_data_2;
    logic          mda_io_write_n_1;
    logic          mda_io_write_n_2;
    logic          mda_io_write_n_3;
    logic          mda_io_read_n_1;
    logic          mda_io_read_n_2;
    logic          mda_io_read_n_3;
    logic          mda_address_enable_n_1;
    logic          mda_address_enable_n_2;
    logic  [14:0]  cga_io_address_1;
    logic  [14:0]  cga_io_address_2;
    logic  [7:0]   cga_io_data_1;
    logic  [7:0]   cga_io_data_2;
    logic          cga_io_write_n_1;
    logic          cga_io_write_n_2;
    logic          cga_io_write_n_3;
    logic          cga_io_read_n_1;
    logic          cga_io_read_n_2;
    logic          cga_io_read_n_3;
    logic          cga_address_enable_n_1;
    logic          cga_address_enable_n_2;

    always_ff @(posedge clock)
    begin
        if (~io_write_n | ~io_read_n)
        begin
            video_io_address    <= address[13:0];
            video_io_data       <= internal_data_bus;
        end
        else
        begin
            video_io_address    <= video_io_address;
            video_io_data       <= video_io_data;
        end
    end

    always_ff @(posedge clock)
    begin
        video_ram_address       <= address[16:0];
        video_ram_data          <= internal_data_bus;
        video_memory_write_n    <= memory_write_n;
        mda_chip_select_n_1     <= mda_chip_select_n;
        cga_chip_select_n_1     <= cga_chip_select_n;
        video_chip_select_n_1   <= video_chip_select_n;

        video_io_write_n        <= io_write_n;
        video_io_read_n         <= io_read_n;
        video_address_enable_n  <= address_enable_n;
    end

    always_ff @(posedge clk_vga_mda)
    begin
        mda_io_address_1        <= video_io_address;
        mda_io_address_2        <= mda_io_address_1;
        mda_io_data_1           <= video_io_data;
        mda_io_data_2           <= mda_io_data_1;
        mda_io_write_n_1        <= video_io_write_n;
        mda_io_write_n_2        <= mda_io_write_n_1;
        mda_io_write_n_3        <= mda_io_write_n_2;
        mda_io_read_n_1         <= video_io_read_n;
        mda_io_read_n_2         <= mda_io_read_n_1;
        mda_io_read_n_3         <= mda_io_read_n_2;
        mda_address_enable_n_1  <= video_address_enable_n;
        mda_address_enable_n_2  <= mda_address_enable_n_1;
    end

    always_ff @(posedge clk_vga_cga)
    begin
        cga_io_address_1    <= video_io_address;
        cga_io_address_2    <= cga_io_address_1;
        cga_io_data_1       <= video_io_data;
        cga_io_data_2       <= cga_io_data_1;
        cga_io_write_n_1    <= video_io_write_n;
        cga_io_write_n_2    <= cga_io_write_n_1;
        cga_io_write_n_3    <= cga_io_write_n_2;
        cga_io_read_n_1     <= video_io_read_n;
        cga_io_read_n_2     <= cga_io_read_n_1;
        cga_io_read_n_3     <= cga_io_read_n_2;
        cga_address_enable_n_1  <= video_address_enable_n;
        cga_address_enable_n_2  <= cga_address_enable_n_1;
    end


    reg   [5:0]   R_CGA;
    reg   [5:0]   G_CGA;
    reg   [5:0]   B_CGA;
    reg           HSYNC_CGA;
    reg           VSYNC_CGA;
    reg           HBLANK_CGA;
    reg           VBLANK_CGA;

    reg   [5:0]   R_MDA;
    reg   [5:0]   G_MDA;
    reg   [5:0]   B_MDA;
    reg           HSYNC_MDA;
    reg           VSYNC_MDA;
    reg           HBLANK_MDA;
    reg           VBLANK_MDA;

    reg           de_o_cga;
    reg           de_o_mda;

    wire   [3:0]  video_cga;
    wire          video_mda;

    assign VGA_R = video_output ? R_MDA : R_CGA;
    assign VGA_G = video_output ? G_MDA : G_CGA;
    assign VGA_B = video_output ? B_MDA : B_CGA;
    assign VGA_HSYNC = video_output ? HSYNC_MDA : HSYNC_CGA;
    assign VGA_VSYNC = video_output ? VSYNC_MDA : VSYNC_CGA;

    assign VGA_HBlank = video_output ? HBLANK_MDA : HBLANK_CGA;
    assign VGA_VBlank = video_output ? VBLANK_MDA : VBLANK_CGA;

    assign de_o = video_output ? de_o_mda : de_o_cga;

    wire MDA_VRAM_ENABLE;
    wire [18:0] MDA_VRAM_ADDR;
    wire [7:0] MDA_VRAM_DOUT;
    wire MDA_CRTC_OE;
    reg  MDA_CRTC_OE_1;
    reg  MDA_CRTC_OE_2;
    wire [7:0] MDA_CRTC_DOUT;
    reg  [7:0] MDA_CRTC_DOUT_1;
    reg  [7:0] MDA_CRTC_DOUT_2;

    wire intensity;


    mda_vgaport vga_mda 
    (
        .clk(clk_vga_mda),
        .video(video_mda),
        .intensity(intensity),
        .red(R_MDA),
        .green(G_MDA),
        .blue(B_MDA)
        //	  .mda_rgb(mda_rgb)
    );

    mda mda1 
    (
        .clk                        (clk_vga_mda),
        .bus_a                      (mda_io_address_2),
        .bus_ior_l                  (mda_io_read_n_3),
        .bus_iow_l                  (mda_io_write_n_3),
        .bus_memr_l                 (1'd0),
        .bus_memw_l                 (1'd0),
        .bus_d                      (mda_io_data_2),
        .bus_out                    (MDA_CRTC_DOUT),
        .bus_dir                    (MDA_CRTC_OE),
        .bus_aen                    (mda_address_enable_n_2),
        .ram_we_l                   (MDA_VRAM_ENABLE),
        .ram_a                      (MDA_VRAM_ADDR),
        .ram_d                      (MDA_VRAM_DOUT),
        .hsync                      (HSYNC_MDA),
        .hblank                     (HBLANK_MDA),
        .vsync                      (VSYNC_MDA),
        .vblank                     (VBLANK_MDA),
        .intensity                  (intensity),
        .video                      (video_mda),
        .de_o                       (de_o_mda)
    );

    always_ff @(posedge clock)
    begin
        MDA_CRTC_DOUT_1 <= MDA_CRTC_DOUT;
        MDA_CRTC_DOUT_2 <= MDA_CRTC_DOUT_1;
        MDA_CRTC_OE_1   <= MDA_CRTC_OE;
        MDA_CRTC_OE_2   <= MDA_CRTC_OE_1;
    end


    wire CGA_VRAM_ENABLE;
    wire [18:0] CGA_VRAM_ADDR;
    wire [7:0] CGA_VRAM_DOUT;
    wire CGA_CRTC_OE;
    wire CGA_CRTC_OE_1;
    wire CGA_CRTC_OE_2;
    wire [7:0] CGA_CRTC_DOUT;
    wire [7:0] CGA_CRTC_DOUT_1;
    wire [7:0] CGA_CRTC_DOUT_2;

    // Sets up the card to generate a video signal
    // that will work with a standard VGA monitor
    // connected to the VGA port.
    localparam MDA_70HZ = 0;

    wire thin_font;

    // Thin font switch (TODO: switchable with Keyboard shortcut)
    assign thin_font = 1'b0; // Default: No thin font


    // CGA digital to analog converter
    cga_vgaport vga_cga 
    (
        .clk(clk_vga_cga),
        .video(video_cga),
        .red(R_CGA),
        .green(G_CGA),
        .blue(B_CGA)
    );

    cga cga1 
    (
        .clk                        (clk_vga_cga),
        .bus_a                      (cga_io_address_2),
        .bus_ior_l                  (cga_io_read_n_3),
        .bus_iow_l                  (cga_io_write_n_3),
        .bus_memr_l                 (1'd0),
        .bus_memw_l                 (1'd0),
        .bus_d                      (cga_io_data_2),
        .bus_out                    (CGA_CRTC_DOUT),
        .bus_dir                    (CGA_CRTC_OE),
        .bus_aen                    (cga_address_enable_n_2),
        .ram_we_l                   (CGA_VRAM_ENABLE),
        .ram_a                      (CGA_VRAM_ADDR),
        .ram_d                      (CGA_VRAM_DOUT),
    //	.hsync                      (HSYNC_CGA),              // non scandoubled
    //  .dbl_hsync                  (HSYNC_CGA),              // scandoubled
        .hblank                     (HBLANK_CGA),
    //  .vsync                      (VSYNC_CGA),
        .vblank                     (VBLANK_CGA),
        .de_o                       (de_o_cga),
    //  .video                      (video_cga),              // non scandoubled
    //  .dbl_video                  (video_cga),              // scandoubled
        .comp_video                 (comp_video),
        .splashscreen               (splashscreen),
        .thin_font                  (thin_font),
        .tandy_video                (tandy_video),
        .color                      (color),
        .grph_mode                  (grph_mode),
        .hres_mode                  (hres_mode),

        .scandoubler			 	(scandoubler),
        .hsync_sd                   (HSYNC_CGA),
        .vsync_sd                   (VSYNC_CGA),
        .video_sd                   (video_cga),
        .composite_out              (composite_out),
        .composite_on               (composite_on),
        .vga_composite              (vga_composite),
        .rgb_18b                    (rgb_18b)
    );

    always_ff @(posedge clock)
    begin
        CGA_CRTC_OE_1   <= CGA_CRTC_OE;
        CGA_CRTC_OE_2   <= CGA_CRTC_OE_1;
        CGA_CRTC_DOUT_1 <= CGA_CRTC_DOUT;
        CGA_CRTC_DOUT_2 <= CGA_CRTC_DOUT_1;
    end


    defparam cga1.BLINK_MAX = 24'd4772727;
    defparam mda1.BLINK_MAX = 24'd9100000;
    wire [7:0] cga_vram_cpu_dout;
    wire [7:0] mda_vram_cpu_dout;


    `ifdef CGA_128

        vram_ip_128  cga_vram	// 128 kB
        (
            .clock_a                  (clock),
            .enable_a                 (~cga_chip_select_n_1 || ~video_chip_select_n_1),
            .wren_a                   (~video_memory_write_n),
            .address_a                ((tandy_video & grph_mode & hres_mode) ? ~video_chip_select_n_1 ? video_ram_address : tandy_page_data[3] ? {tandy_page_data[5:3], video_ram_address[13:0]} : {tandy_page_data[5:4], video_ram_address[14:0]} : video_ram_address[13:0]),
            .data_a                   (video_ram_data),
            .q_a                      (cga_vram_cpu_dout),
            .clock_b                  (clk_vga_cga),
            .enable_b                 (CGA_VRAM_ENABLE),
            .wren_b                   (1'b0),
            .address_b                ((tandy_video & grph_mode & hres_mode) ? {tandy_page_data[2:1], CGA_VRAM_ADDR[14:0]} : CGA_VRAM_ADDR[13:0]),
            .data_b                   (8'h0),
            .q_b                      (CGA_VRAM_DOUT)
        );

    `elsif CGA_128_CV

        vram_ip_128_CV  cga_vram	// 128 kB
        (
            .clock_a                  (clock),
            .enable_a                 (~cga_chip_select_n_1 || ~video_chip_select_n_1),
            .wren_a                   (~video_memory_write_n),
            .address_a                ((tandy_video & grph_mode & hres_mode) ? ~video_chip_select_n_1 ? video_ram_address : tandy_page_data[3] ? {tandy_page_data[5:3], video_ram_address[13:0]} : {tandy_page_data[5:4], video_ram_address[14:0]} : video_ram_address[13:0]),
            .data_a                   (video_ram_data),
            .q_a                      (cga_vram_cpu_dout),
            .clock_b                  (clk_vga_cga),
            .enable_b                 (CGA_VRAM_ENABLE),
            .wren_b                   (1'b0),
            .address_b                ((tandy_video & grph_mode & hres_mode) ? {tandy_page_data[2:1], CGA_VRAM_ADDR[14:0]} : CGA_VRAM_ADDR[13:0]),
            .data_b                   (8'h0),
            .q_b                      (CGA_VRAM_DOUT)
        );

    `elsif CGA_64

        vram_ip_64  cga_vram	// 64 kB     Improves arkanoid and Gods video output, but then Prince does not display well
        (
            .clock_a                     (clock),
            .enable_a                 (~cga_chip_select_n_1 || ~video_chip_select_n_1),
            .wren_a                   (~video_memory_write_n),
            .address_a                ((tandy_video & grph_mode & hres_mode) ? ~video_chip_select_n_1 ? video_ram_address : tandy_page_data[3] ? {tandy_page_data[5:3], video_ram_address[13:0]} : {tandy_page_data[5:4], video_ram_address[14:0]} : video_ram_address[13:0]),
            //  .address_a                ((tandy_video & grph_mode & hres_mode) ? ~video_chip_select_n_1 ? video_ram_address : tandy_page_data[3] ? {1'b0, tandy_page_data[4:3], video_ram_address[13:0]} : {1'b0,tandy_page_data[5], video_ram_address[14:0]} : video_ram_address[13:0]),
            .data_a                   (video_ram_data),
            .q_a                      (cga_vram_cpu_dout),
            .clock_b                  (clk_vga_cga),
            .enable_b                 (CGA_VRAM_ENABLE),
            .wren_b                   (1'b0),
            .address_b                ((tandy_video & grph_mode & hres_mode) ? {tandy_page_data[2:1], CGA_VRAM_ADDR[14:0]} : CGA_VRAM_ADDR[13:0]),
            //  .address_b                ((tandy_video & grph_mode & hres_mode) ? {1'b0, tandy_page_data[1], CGA_VRAM_ADDR[14:0]} : CGA_VRAM_ADDR[13:0]),
            .data_b                   (8'h0),
            .q_b                      (CGA_VRAM_DOUT)
        );
        //  {tandy_page_data[5:3], video_ram_address[13:0]} => {1'b0, tandy_page_data[4:3], video_ram_address[13:0]}
        //  {tandy_page_data[2:1], CGA_VRAM_ADDR[14:0]}     => {1'b0, tandy_page_data[1], CGA_VRAM_ADDR[14:0]}

    `elsif CGA_32

        vram_ip_32	cga_vram (
            .clock_a                  ( clock ),
            .enable_a                 (~cga_chip_select_n_1),
            .wren_a                   (~video_memory_write_n),
            .address_a                ((tandy_video & grph_mode & hres_mode) ? video_ram_address : video_ram_address[13:0]),
            .data_a                   (video_ram_data),
            .q_a                      (cga_vram_cpu_dout),
            .clock_b                  (clk_vga_cga),
            .enable_b                 (CGA_VRAM_ENABLE),
            .wren_b                   (1'b0),
            .address_b                ((tandy_video & grph_mode & hres_mode) ? CGA_VRAM_ADDR[14:0] : CGA_VRAM_ADDR[13:0]),
            .data_b                   (8'h0),
            .q_b                      (CGA_VRAM_DOUT)
        );

    `elsif CGA_16

        vram_ip_16  cga_vram   	// 16 kB  (Tandy games don't work)
        (
            .clock_a                  (clock),
            .enable_a                 (~cga_chip_select_n_1),
            .wren_a                   (~video_memory_write_n),
            .address_a                ((tandy_video & grph_mode & hres_mode) ? video_ram_address : video_ram_address[13:0]),
            .data_a                   (video_ram_data),
            .q_a                      (cga_vram_cpu_dout),
            .clock_b                  (clk_vga_cga),
            .enable_b                 (CGA_VRAM_ENABLE),
            .wren_b                   (1'b0),
            .address_b                ((tandy_video & grph_mode & hres_mode) ? CGA_VRAM_ADDR[14:0] : CGA_VRAM_ADDR[13:0]),
            .data_b                   (8'h0),
            .q_b                      (CGA_VRAM_DOUT)
        );

    `elsif NO_CGA

        // NO CGA IN ATLAS CYC1000  (only 66 M9K)
        // 32 Kb CGA represent 64 M9K alone
        // NO CGA IN SIDI
        // NO CGA IN MIST  (only 66 M9K)

    `else

    `endif


    `ifdef NO_MDA

        // NO MDA

    `elsif MDA_CV

        vram_ip_4_CV mda_vram   //4 kB
        (
            .clock_a                  (clock),
            .enable_a                 (~mda_chip_select_n_1),
            .wren_a                   (~video_memory_write_n),
            .address_a                (video_ram_address[11:0]),
            .data_a                   (video_ram_data),
            .q_a                      (mda_vram_cpu_dout),
            .clock_b                  (clk_vga_mda),
            .enable_b                 (MDA_VRAM_ENABLE),
            .wren_b                   (1'b0),
            .address_b                (MDA_VRAM_ADDR[11:0]),
            .data_b                   (8'h0),
            .q_b                      (MDA_VRAM_DOUT)
        );

    `else

        vram_ip_4 mda_vram   //4 kB
        (
            .clock_a                  (clock),
            .enable_a                 (~mda_chip_select_n_1),
            .wren_a                   (~video_memory_write_n),
            .address_a                (video_ram_address[11:0]),
            .data_a                   (video_ram_data),
            .q_a                      (mda_vram_cpu_dout),
            .clock_b                  (clk_vga_mda),
            .enable_b                 (MDA_VRAM_ENABLE),
            .wren_b                   (1'b0),
            .address_b                (MDA_VRAM_ADDR[11:0]),
            .data_b                   (8'h0),
            .q_b                      (MDA_VRAM_DOUT)
        );

    `endif



    //
    // Joysticks
    //

    logic [7:0] joy_data;

    tandy_pcjr_joy joysticks
    (
        .clk                       (clock),
        .reset                     (reset),
        .en                        (joystick_select && ~io_write_n),
        .turbo_mode                (turbo_mode),
        .joy_opts                  (joy_opts),
        .joy0                      (joy0),
        .joy1                      (joy1),
        .joya0                     (joya0),
        .joya1                     (joya1),
        .d_out                     (joy_data)
    );


    //
    // data_bus_out
    //
    
    always_ff @(posedge clock)
    begin
        if (~interrupt_acknowledge_n)
        begin
            data_bus_out_from_chipset <= 1'b1;
            data_bus_out <= interrupt_data_bus_out;
        end
        else if ((~interrupt_chip_select_n) && (~io_read_n))
        begin
            data_bus_out_from_chipset <= 1'b1;
            data_bus_out <= interrupt_data_bus_out;
        end
        else if ((~timer_chip_select_n) && (~io_read_n))
        begin
            data_bus_out_from_chipset <= 1'b1;
            data_bus_out <= timer_data_bus_out;
        end
        else if ((~ppi_chip_select_n) && (~io_read_n))
        begin
            data_bus_out_from_chipset <= 1'b1;
            data_bus_out <= ppi_data_bus_out;
        end
        else if ((~cga_chip_select_n) && (~memory_read_n))
        begin
            data_bus_out_from_chipset <= 1'b1;
            data_bus_out <= cga_vram_cpu_dout;
        end
        else if ((~mda_chip_select_n) && (~memory_read_n))
        begin
            data_bus_out_from_chipset <= 1'b1;
            data_bus_out <= mda_vram_cpu_dout;
        end
        else if (CGA_CRTC_OE_2)
        begin
            data_bus_out_from_chipset <= 1'b1;
            data_bus_out <= CGA_CRTC_DOUT_2;
        end
        else if (MDA_CRTC_OE_2)
        begin
            data_bus_out_from_chipset <= 1'b1;
            data_bus_out <= MDA_CRTC_DOUT_2;
        end
        else if ((~opl_chip_select_n) && (~io_read_n))
        begin
            data_bus_out_from_chipset <= 1'b1;
            data_bus_out <= opl32_data;
        end
        else if ((uart_cs) && (~io_read_n))
        begin
            data_bus_out_from_chipset <= 1'b1;
            data_bus_out <= uart_readdata;
        end
        else if ((uart2_cs) && (~io_read_n))
        begin
            data_bus_out_from_chipset <= 1'b1;
            data_bus_out <= uart2_readdata;
        end
        else if ((ems_oe) && (~io_read_n))
        begin
            data_bus_out_from_chipset <= 1'b1;
            data_bus_out <= ena_ems[address[1:0]] ? map_ems[address[1:0]] : 8'hFF;
        end
        else if ((lpt_cs) && (~io_read_n))
        begin
            data_bus_out_from_chipset <= 1'b1;
            data_bus_out <= lpt_data;
        end
        else if ((~nmi_mask_register_n) && (~io_read_n))
        begin
            data_bus_out_from_chipset <= 1'b1;
            data_bus_out <= nmi_mask_register_data;
        end
        else if (joystick_select && ~io_read_n)
        begin
            data_bus_out_from_chipset <= 1'b1;
            data_bus_out <= joy_data;
        end
        else
        begin
            data_bus_out_from_chipset <= 1'b0;
            data_bus_out <= 8'b00000000;
        end
    end

endmodule

