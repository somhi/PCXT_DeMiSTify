https://atari-forum.com/viewtopic.php?t=42465

robinsonb5

The 8-bit IDE component from the Amstrad core should be relatively easy to wire up to the PCXT core, and should then work with DeMiSTify.  Probably - it's a more-or-less straight port from MiST.

## kitune-san

https://misterfpga.org/viewtopic.php?p=68654#p68654

I have wired the IDE for MiST using the code in the following links

https://github.com/mist-devel/mist-modules/blob/master/ide.v
https://github.com/gyurco/Next186/blob/master/mist/Next186_MiST.sv#L372

I have not done any detailed research or debugging, so it will not work well as is.



```verilog

//
// XT2IDE
//
logic   [7:0]   xt2ide0_data_bus_out;
logic           ide0_cs1fx;
logic           ide0_cs3fx;
logic           ide0_io_read_n;
logic           ide0_io_write_n;
logic   [2:0]   ide0_address;
logic   [15:0]  ide0_data_bus_in;
logic   [15:0]  ide0_data_bus_out;

XT2IDE xt2ide0 (
    .clock              (clock),
    .reset              (reset),

    .high_speed         (0),

    .chip_select_n      (ide0_chip_select_n),
    .io_read_n          (io_read_n),
    .io_write_n         (io_write_n),

    .address            (address[3:0]),
    .data_bus_in        (internal_data_bus),
    .data_bus_out       (xt2ide0_data_bus_out),

    .ide_cs1fx          (ide0_cs1fx),
    .ide_cs3fx          (ide0_cs3fx),
    .ide_io_read_n      (ide0_io_read_n),
    .ide_io_write_n     (ide0_io_write_n),

    .ide_address        (ide0_address),
    .ide_data_bus_in    (ide0_data_bus_in),
    .ide_data_bus_out   (ide0_data_bus_out)
);


//
// IDE
//
logic           ide0_command_cs;
logic           ide0_control_cs;
logic           ide0_io_read;
logic           ide0_io_read_1;
logic           ide0_io_write;
logic           prev_ide0_io_read;
logic           prev_ide0_io_write;
logic [15:0]    ide0_writedata;


assign ide0_command_cs  = ~ide0_cs1fx;
assign ide0_control_cs  = ~ide0_cs3fx & &ide0_address[2:1];
assign ide0_io_read     = ~ide0_io_read_n  & (ide0_command_cs | ide0_control_cs);
assign ide0_io_write    = ~ide0_io_write_n & (ide0_command_cs | ide0_control_cs);

always_ff @(posedge clock)
begin
    ide0_io_read_1          <= ide0_io_read;
    prev_ide0_io_read       <= ide0_io_read_1;
    prev_ide0_io_write      <= ide0_io_write;
    ide0_address_1          <= ~ide0_control_cs ? {1'b0, ide0_address} : {1'b1, ide0_address};
    ide0_writedata          <= ide0_data_bus_out;
end


ide ide (
    .clk(clock), // system clock
    .clk_en(1'b1),
    .reset(reset),

    // cpu interface
    .address_in(ide0_io_read && ide0_address_1 == 4'hE ? 3'd7 : ide0_address_1[2:0]),
    .sel_secondary(1'b0),           // ? Research needed.
    .data_in(ide0_writedata{[7:0], ide0_writedata[15:8]}),    // ? 
    .data_out({ide0_data_bus_in[7:0], ide0_data_bus_in[15:8]}),     // ? 
    .rd(ide0_io_read   & ~prev_ide0_io_read),
    .hwr(~ide0_io_write & prev_ide0_io_write),
    .lwr(~ide0_io_write & prev_ide0_io_write),
    .sel_ide(ide0_command_cs | ide0_control_cs),
    .intreq(),          // ? Probably not used in PIO mode
    .intreq_ack(1'b0),  // ? Probably not used in PIO mode
    .nrdy(),
    .hdd0_ena(2'b10),        // ? Research needed.
    .hdd1_ena(2'b11),        // ? Research needed.
    .fifo_rd(),
    .fifo_wr(),

    // io controller interface
    …
```

