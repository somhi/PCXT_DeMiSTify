// Graphics Gremlin
//
// Copyright (c) 2021 Eric Schlaepfer
// This work is licensed under the Creative Commons Attribution-ShareAlike 4.0
// International License. To view a copy of this license, visit
// http://creativecommons.org/licenses/by-sa/4.0/ or send a letter to Creative
// Commons, PO Box 1866, Mountain View, CA 94042, USA.
//
`default_nettype none
module cga_composite(
    // Clock
    input clk,

    input lclk,
    input hclk,

    input [3:0] video, // IRGB video in
    input hsync,
    input vsync_l,
    input bw_mode,
    input osd_disable,

    output hsync_out,
    output vsync_out,
    output csync_out,
    output [6:0] comp_video,
    output [1:0] composite_out
    );

    reg [9:0] lclk_del;
    reg [9:0] hclk_del;
    reg [9:0] hsync_del;
    reg [9:0] vsync_l_del;
    wire lclk_delx, hclk_delx, hsync_delx, vsync_l_delx;

    always @ (posedge clk) begin
        lclk_del  <= {lclk_del[9], lclk_del[8], lclk_del[7], lclk_del[6], lclk_del[5], lclk_del[4], lclk_del[3], lclk_del[2], lclk_del[1], lclk_del[0], lclk};
        hclk_del  <= {hclk_del[9], hclk_del[8], hclk_del[7], hclk_del[6], hclk_del[5], hclk_del[4], hclk_del[3], hclk_del[2], hclk_del[1], hclk_del[0], hclk};
        hsync_del <= {hsync_del[9], hsync_del[8], hsync_del[7], hsync_del[6], hsync_del[5], hsync_del[4], hsync_del[3], hsync_del[2], hsync_del[1], hsync_del[0], hsync};
        vsync_l_del <= {vsync_l_del[9], vsync_l_del[8], vsync_l_del[7], vsync_l_del[6], vsync_l_del[5], vsync_l_del[4], vsync_l_del[3], vsync_l_del[2], vsync_l_del[1], vsync_l_del[0], vsync_l};		  	  
    end

    assign lclk_delx    = ~osd_disable ? lclk_del[5]    : lclk;      //every 32 clk
    assign hclk_delx    = ~osd_disable ? hclk_del[5]    : hclk;      //every 16 clk
    assign hsync_delx   = ~osd_disable ? hsync_del[5]   : hsync;     //every line 114*16 clk
    assign vsync_l_delx = ~osd_disable ? vsync_l_del[5] : vsync_l;   //every screen 

    reg[3:0] vid_del;
    reg hsync_dly = 1'b0;
    reg vsync_dly_l = 1'b0;
    reg[3:0] hsync_counter = 4'd0;
    reg[3:0] vsync_counter = 4'd0;
    reg vsync_trig = 1'b0;

    reg[2:0] count_358 = 3'd0;
    wire clk_3m58;
    wire clk_14m3;
    reg clk_old = 1'b0;

    wire burst;
    wire csync;

    reg[6:0] grey_level;

    // Color shifter
    reg yellow_burst;
    reg red;
    reg magenta;
    wire blue;
    wire cyan;
    wire green;

    reg color_out;
    wire color_out2;

    reg hclk_old;

    always @ (posedge clk)
    begin
        hclk_old <= hclk_delx;
    end

    // Resync the video to the falling edge of 14.318MHz
    always @ (posedge clk)
    begin
        if (clk_14m3 && !clk_old) begin
            vid_del <= video;
        end
    end

    // Delay the sync pulses
    always @ (posedge clk)
    begin
        if (hclk_delx && !hclk_old) begin
            hsync_dly <= hsync_delx;
            vsync_dly_l <= vsync_l_delx;
        end
    end

    // hsync counter
    always @ (posedge clk)
    begin
        if (lclk_delx) begin
            if (hsync_dly) begin
                if (hsync_counter == 4'd11) begin
                    hsync_counter <= 4'd0;
                end else begin
                    hsync_counter <= hsync_counter + 4'd1;
                    if ((hsync_counter + 4'd1) == 4'd2) begin
                        vsync_trig <= 1'b1;
                    end
                end
            end else begin
                hsync_counter <= 4'd0;
            end
        end else begin
            vsync_trig <= 1'b0;
        end
    end

    assign hsync_out = (hsync_counter > 4'd1) && (hsync_counter < 4'd6);
    assign burst = bw_mode ? 1'b0 : (~vsync_dly_l &
                                     ((hsync_counter == 4'd7) ||
                                      (hsync_counter == 4'd8)));

    // vsync counter
    always @ (posedge clk)
    begin
        if (vsync_trig) begin
            if (!vsync_dly_l) begin
                vsync_counter <= 4'd0;
            end else begin
                vsync_counter <= {vsync_counter[2:0], 1'b1};
            end
        end
    end

    // Positive going vsync pulse
    assign vsync_out = vsync_counter[0] & ~vsync_counter[3];

    assign csync = ~(vsync_out ^ hsync_out);

    assign csync_out = csync;

    // Generate 3.58MHz from the 28MHz clock coming in
    always @ (posedge clk)
    begin
        count_358 <= count_358 + 3'd1;
        clk_old <= clk_14m3;
    end
    assign clk_3m58 = count_358[2];
    wire clk_7m;
    assign clk_7m = count_358[1];
    assign clk_14m3 = count_358[0];

    // Create color phase clocks
    always @ (posedge clk)
    begin
        // Check for 14.318MHz rising edge
        if (!clk_14m3 && clk_old) begin
            yellow_burst <= clk_3m58;
            red <= yellow_burst;
        end
        // Check for 14.318MHz falling edge
        if (clk_14m3 && !clk_old) begin
            magenta <= red;
        end
    end
    assign blue = ~yellow_burst;
    assign cyan = ~red;
    assign green = ~magenta;

    // Color mux
    always @ (*)
    begin
        // R, G, B
        case ({vid_del[2] ^ burst, vid_del[1] ^ burst, vid_del[0]})
            3'd0: color_out <= 1'b0;
            3'd1: color_out <= blue;
            3'd2: color_out <= green;
            3'd3: color_out <= cyan;
            3'd4: color_out <= red;
            3'd5: color_out <= magenta;
            3'd6: color_out <= yellow_burst;
            3'd7: color_out <= 1'b1;
        endcase
    end

    // Black and white mode? Color is disabled.
    assign color_out2 = bw_mode ?
                        (vid_del[2:0] != 0) :
                        (color_out);

    always @ (*)
    begin
        case (vid_del[2:0])
            3'd0:  grey_level <= 7'd29;
            3'd1:  grey_level <= 7'd36;
            3'd2:  grey_level <= 7'd49;
            3'd3:  grey_level <= 7'd56;
            3'd4:  grey_level <= 7'd39;
            3'd5:  grey_level <= 7'd46;
            3'd6:  grey_level <= 7'd60;
            3'd7:  grey_level <= 7'd68;
        endcase
    end

    assign comp_video = ~csync ? 0 : (grey_level + (vid_del[3] ? 7'd31 : 7'd0) +
                        (color_out2 ? 7'd28 : 7'd0));

	 
	//////////  Composite direct output with 2 pins by @thesonders  ///////////
	reg [6:0] datainH = 0;
	reg [6:0] datainL = 0;
    wire composite_resync  = clk_14m3 && !clk_old;
	 
	serialize_comp_tx serialize_comp_tx(
	    .tx_in({datainL,datainH}),
	    .tx_inclock(clk),
	    .tx_out(composite_out)
    );
	 
	always @ (posedge clk) 
    begin
        if (composite_resync) begin
				 case (comp_video[6:4])
				 0:begin datainH<=0;end
				 1:begin datainH<=1;end
				 2:begin datainH<=3;end
				 3:begin datainH<=7;end
				 4:begin datainH<=15;end
				 5:begin datainH<=31;end
				 6:begin datainH<=63;end
				 7:begin datainH<=127;end
				 endcase
				 
				 case (comp_video[3:1])
				 0:begin datainL<=0;end
				 1:begin datainL<=1;end
				 2:begin datainL<=3;end
				 3:begin datainL<=7;end
				 4:begin datainL<=15;end
				 5:begin datainL<=31;end
				 6:begin datainL<=63;end
				 7:begin datainL<=127;end
				 endcase
				 
        end
    end

endmodule
