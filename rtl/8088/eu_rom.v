module eu_rom(
  input clka,
  input [11:0] addra,
  output reg [31:0] douta
);

`ifdef EMBED_8088_ROM
(* ramstyle = "logic" *) reg [31:0] memory[3961:0];
`else
reg [31:0] memory[3961:0];
`endif    

initial $readmemh("microcode.mem", memory);

always @(posedge clka)
  douta <= memory[addra];

endmodule
