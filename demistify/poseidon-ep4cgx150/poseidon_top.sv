
module poseidon_top (
	input         CLOCK_50,

	input         KEY0,
	output        LED,
	output  [5:0] VGA_R,
	output  [5:0] VGA_G,
	output  [5:0] VGA_B,
	output        VGA_HS,
	output        VGA_VS,

`ifdef USE_HDMI
	output        HDMI_RST,
	output  [7:0] HDMI_R,
	output  [7:0] HDMI_G,
	output  [7:0] HDMI_B,
	output        HDMI_HS,
	output        HDMI_VS,
	output        HDMI_PCLK,
	output        HDMI_DE,
	output        HDMI_SDA,
	output        HDMI_SCL,
`endif

	input         SPI_SCK,
	inout         SPI_DO,
	input         SPI_DI,
	input         SPI_SS2,    // data_io
	input         SPI_SS3,    // OSD
	input         CONF_DATA0, // SPI_SS for user_io
`ifndef NO_DIRECT_UPLOAD
	input         SPI_SS4,
`endif

	output [12:0] SDRAM_A,
	inout  [15:0] SDRAM_DQ,
	output        SDRAM_DQML,
	output        SDRAM_DQMH,
	output        SDRAM_nWE,
	output        SDRAM_nCAS,
	output        SDRAM_nRAS,
	output        SDRAM_nCS,
	output  [1:0] SDRAM_BA,
	output        SDRAM_CLK,
	output        SDRAM_CKE,

	output        AUDIO_L,
	output        AUDIO_R,
`ifdef I2S_AUDIO
	output        I2S_BCK,
	output        I2S_LRCK,
	output        I2S_DATA,
`endif
`ifdef USE_AUDIO_IN
	input         AUDIO_IN,
`endif
	input         UART_RX,
	output        UART_TX
);


wire [7:0]  r_aux, g_aux, b_aux;	
wire [15:0] dac_l, dac_r;
wire clk_chipset; 

// wire  [1:0] COMPOSITE_OUT;
// wire UART_CTS, UART_RTS;

PCXT guest
(
 .CLOCK_27   (CLOCK_50),
 .RESET_N    (1'b1),        //1'b1 very important to pass this reset signal
 .LED      	 (~LED),

 .SDRAM_DQ	(SDRAM_DQ),	
 .SDRAM_A	(SDRAM_A),
 .SDRAM_DQML(SDRAM_DQML),
 .SDRAM_DQMH(SDRAM_DQMH),
 .SDRAM_nWE	(SDRAM_nWE),
 .SDRAM_nCAS(SDRAM_nCAS),
 .SDRAM_nRAS(SDRAM_nRAS),
 .SDRAM_nCS	(SDRAM_nCS),
 .SDRAM_BA	(SDRAM_BA),
 .SDRAM_CLK	(SDRAM_CLK),
 .SDRAM_CKE	(SDRAM_CKE),
		 			
 .SPI_DO	 (SPI_DO),
 .SPI_DI	 (SPI_DI),
 .SPI_SCK	 (SPI_SCK),
 .SPI_SS2	 (SPI_SS2),
 .SPI_SS3	 (SPI_SS3),
 .SPI_SS4	 (SPI_SS4),
 .CONF_DATA0 (CONF_DATA0),

//  .DAC_L      (dac_l),
//  .DAC_R      (dac_r),
//  .CLK_CHIPSET(clk_chipset),

 .VGA_HS	 (VGA_HS),
 .VGA_VS	 (VGA_VS),
 .VGA_R	 	 (r_aux),
 .VGA_G		 (g_aux),
 .VGA_B		 (b_aux),

 .UART_RX	 (UART_RX),	
 .UART_TX	 (UART_TX)
//  .UART_CTS   (UART_CTS),
//  .UART_RTS   (UART_RTS)
);


// VIDEO bits assignation
assign VGA_R = r_aux[7:2];
assign VGA_G = g_aux[7:2];
assign VGA_B = b_aux[7:2];

/*
audio_top audio_i2s
(
    .clk_50MHz (clk_chipset),
  //.dac_MCLK  (I2S_MCK),
    .dac_LRCK  (I2S_LRCK),
    .dac_SCLK  (I2S_BCK),
    .dac_SDIN  (I2S_DATA),
    .L_data    (dac_l),
    .R_data    (dac_r)
);
*/

endmodule
