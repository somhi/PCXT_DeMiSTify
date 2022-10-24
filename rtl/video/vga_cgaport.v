module vga_cgaport(
    input wire clk,
    input wire [17:0] rgb,      // Analog inputs
    output reg [3:0]  video     // irgb video output
    );


    wire [3:0] video1;
    wire [5:0] red, green, blue;
    wire [1:0] red_x, green_x, blue_x;

    assign red   = rgb[17:12];
    assign green = rgb[11:6];
    assign blue  = rgb[5:0];

    //cga_vpaport values for each color:  0, 21, 42, 63

    assign red_x =  (                        (red <= 6'b001011)   ) ? 2'b00 :           //        0 <= 11    2'b00
    ((red   >  6'b001011) && (red <= 6'b011111)   ) ? 2'b01 :           //  11 < 21 <= 31    2'b01
    ((red   >  6'b011111) && (red <= 6'b110100)   ) ? 2'b10 : 2'b11;    //  31 < 42 <= 52    2'b10
                                                                        //  52 < 63          2'b11
    assign green_x= (                        (green <= 6'b001011) ) ? 2'b00 :
    ((green >  6'b001011) && (green <= 6'b011111) ) ? 2'b01 :
    ((green >  6'b011111) && (green <= 6'b110100) ) ? 2'b10 : 2'b11;

    assign blue_x = (                        (blue  <= 6'b001011) ) ? 2'b00 :
    ((blue  >  6'b001011) && (blue  <= 6'b011111) ) ? 2'b01 :
    ((blue  >  6'b011111) && (blue  <= 6'b110100) ) ? 2'b10 : 2'b11;


    assign video1 = ( (red_x == 2'b00) && (green_x == 2'b00) && (blue_x == 2'b00) ) ? 4'h0 :
    ( (red_x == 2'b00) && (green_x == 2'b00) && (blue_x == 2'b10) ) ? 4'h1 :
    ( (red_x == 2'b00) && (green_x == 2'b10) && (blue_x == 2'b00) ) ? 4'h2 :
    ( (red_x == 2'b00) && (green_x == 2'b10) && (blue_x == 2'b10) ) ? 4'h3 :

    ( (red_x == 2'b10) && (green_x == 2'b00) && (blue_x == 2'b00) ) ? 4'h4 :
    ( (red_x == 2'b10) && (green_x == 2'b00) && (blue_x == 2'b10) ) ? 4'h5 :
    ( (red_x == 2'b10) && (green_x == 2'b01) && (blue_x == 2'b00) ) ? 4'h6 :    // Brown!
    ( (red_x == 2'b10) && (green_x == 2'b10) && (blue_x == 2'b10) ) ? 4'h7 :

    ( (red_x == 2'b01) && (green_x == 2'b01) && (blue_x == 2'b01) ) ? 4'h8 :
    ( (red_x == 2'b01) && (green_x == 2'b01) && (blue_x == 2'b11) ) ? 4'h9 :
    ( (red_x == 2'b01) && (green_x == 2'b11) && (blue_x == 2'b01) ) ? 4'hA :
    ( (red_x == 2'b01) && (green_x == 2'b11) && (blue_x == 2'b11) ) ? 4'hB :

    ( (red_x == 2'b11) && (green_x == 2'b01) && (blue_x == 2'b01) ) ? 4'hC :
    ( (red_x == 2'b11) && (green_x == 2'b01) && (blue_x == 2'b11) ) ? 4'hD :
    ( (red_x == 2'b11) && (green_x == 2'b11) && (blue_x == 2'b01) ) ? 4'hE :
    ( (red_x == 2'b11) && (green_x == 2'b11) && (blue_x == 2'b11) ) ? 4'hF : 4'hF;  


    always @(posedge clk)
    begin
        video <= video1;
    end


endmodule






    // always @(posedge clk)
    // begin
    //     case(rgb)
    //         18'b000000_000000_000000 : video <= 4'h0;
    //         18'b000000_000000_101010 : video <= 4'h1;
    //         18'b000000_101010_000000 : video <= 4'h2;
    //         18'b000000_101010_101010 : video <= 4'h3;
    //         18'b101010_000000_000000 : video <= 4'h4;
    //         18'b101010_000000_101010 : video <= 4'h5;
    //         18'b101010_010101_000000 : video <= 4'h6; // Brown!
    //         18'b101010_101010_101010 : video <= 4'h7;
    //         18'b010101_010101_010101 : video <= 4'h8;
    //         18'b010101_010101_111111 : video <= 4'h9;
    //         18'b010101_111111_010101 : video <= 4'hA;
    //         18'b010101_111111_111111 : video <= 4'hB;
    //         18'b111111_010101_010101 : video <= 4'hC;
    //         18'b111111_010101_111111 : video <= 4'hD;
    //         18'b111111_111111_010101 : video <= 4'hE;
    //         18'b111111_111111_111111 : video <= 4'hF;
    //         default : ;
    //     endcase
    // end