module bios_sram (
  input               clka,
  input               ena,
  input               wea,
  input      [15:0]   addra,
  input      [7:0]    dina,
  output reg [7:0]    douta,

  output reg [20:0]   SRAM_ADDR,
  inout      [7:0]    SRAM_DATA,
  output reg          SRAM_WE_n
);

reg [7:0] data;
assign SRAM_DATA = (ena && ~SRAM_WE_n) ? data : 8'bZZZZZZZZ;

always @(negedge clka)
  if (ena) begin
      SRAM_ADDR = {5'b00000, addra};
		if (wea) begin
		   SRAM_WE_n <= 1'b0;			
			data <= dina;
		end
		else begin
			SRAM_WE_n <= 1'b1;
			douta <= SRAM_DATA;
		end
	end
endmodule
