module Segment_Decoder 
( 
input iClk, 
input iReset_n, 
input iChip_select_n, 
input iWrite_n, 
input [2:0] iAddress, 
input [31:0] iSegment_decoder_data,
output reg [31:0] HEX0, HEX1,  HEX2, HEX3, HEX4, HEX5
); 
always@(posedge iClk, negedge iReset_n) 
begin 
	if(~iReset_n) 
	begin 
		HEX0 <= 7'd0; 
		HEX1 <= 7'd0; 
		HEX2 <= 7'd0; 
		HEX3 <= 7'd0; 
		HEX4 <= 7'd0; 
		HEX5 <= 7'd0; 
	end 
	else 
	begin 
		if(~iChip_select_n & ~iWrite_n) 
		begin 
		case	(iAddress)
			3'd0:
				case (iSegment_decoder_data)
					  4'd0: HEX0 <= 7'b1000000; // Display 0
					  4'd1: HEX0 <= 7'b1111001; // Display 1
					  4'd2: HEX0 <= 7'b0100100; // Display 2
					  4'd3: HEX0 <= 7'b0110000; // Display 3
					  4'd4: HEX0 <= 7'b0011001; // Display 4
					  4'd5: HEX0 <= 7'b0010010; // Display 5
					  4'd6: HEX0 <= 7'b0000010; // Display 6
					  4'd7: HEX0 <= 7'b1111000; // Display 7
					  4'd8: HEX0 <= 7'b0000000; // Display 8
					  4'd9: HEX0 <= 7'b0010000; // Display 9
					  default: HEX0 <= 7'b1111111;
				endcase
			3'd1:
				case (iSegment_decoder_data)
					  4'd0: HEX1 <= 7'b1000000; // Display 0
					  4'd1: HEX1 <= 7'b1111001; // Display 1
					  4'd2: HEX1 <= 7'b0100100; // Display 2
					  4'd3: HEX1 <= 7'b0110000; // Display 3
					  4'd4: HEX1 <= 7'b0011001; // Display 4
					  4'd5: HEX1 <= 7'b0010010; // Display 5
					  4'd6: HEX1 <= 7'b0000010; // Display 6
					  4'd7: HEX1 <= 7'b1111000; // Display 7
					  4'd8: HEX1 <= 7'b0000000; // Display 8
					  4'd9: HEX1 <= 7'b0010000; // Display 9
					  default: HEX1 <= 7'b1111111;
				endcase
			3'd2:
				case (iSegment_decoder_data)
					  4'd0: HEX2 <= 7'b1000000; // Display 0
					  4'd1: HEX2 <= 7'b1111001; // Display 1
					  4'd2: HEX2 <= 7'b0100100; // Display 2
					  4'd3: HEX2 <= 7'b0110000; // Display 3
					  4'd4: HEX2 <= 7'b0011001; // Display 4
					  4'd5: HEX2 <= 7'b0010010; // Display 5
					  4'd6: HEX2 <= 7'b0000010; // Display 6
					  4'd7: HEX2 <= 7'b1111000; // Display 7
					  4'd8: HEX2 <= 7'b0000000; // Display 8
					  4'd9: HEX2 <= 7'b0010000; // Display 9
					  default: HEX2 <= 7'b1111111;
				endcase
			3'd3:
				case (iSegment_decoder_data)
					  4'd0: HEX3 <= 7'b1000000; // Display 0
					  4'd1: HEX3 <= 7'b1111001; // Display 1
					  4'd2: HEX3 <= 7'b0100100; // Display 2
					  4'd3: HEX3 <= 7'b0110000; // Display 3
					  4'd4: HEX3 <= 7'b0011001; // Display 4
					  4'd5: HEX3 <= 7'b0010010; // Display 5
					  4'd6: HEX3 <= 7'b0000010; // Display 6
					  4'd7: HEX3 <= 7'b1111000; // Display 7
					  4'd8: HEX3 <= 7'b0000000; // Display 8
					  4'd9: HEX3 <= 7'b0010000; // Display 9
					  default: HEX3 <= 7'b1111111;
				endcase
			3'd4:
				case (iSegment_decoder_data)
					  4'd0: HEX4 <= 7'b1000000; // Display 0
					  4'd1: HEX4 <= 7'b1111001; // Display 1
					  4'd2: HEX4 <= 7'b0100100; // Display 2
					  4'd3: HEX4 <= 7'b0110000; // Display 3
					  4'd4: HEX4 <= 7'b0011001; // Display 4
					  4'd5: HEX4 <= 7'b0010010; // Display 5
					  4'd6: HEX4 <= 7'b0000010; // Display 6
					  4'd7: HEX4 <= 7'b1111000; // Display 7
					  4'd8: HEX4 <= 7'b0000000; // Display 8
					  4'd9: HEX4 <= 7'b0010000; // Display 9
					  default: HEX4 <= 7'b1111111;
				endcase
			3'd5:
				case (iSegment_decoder_data)
					  4'd0: HEX5 <= 7'b1000000; // Display 0
					  4'd1: HEX5 <= 7'b1111001; // Display 1
					  4'd2: HEX5 <= 7'b0100100; // Display 2
					  4'd3: HEX5 <= 7'b0110000; // Display 3
					  4'd4: HEX5 <= 7'b0011001; // Display 4
					  4'd5: HEX5 <= 7'b0010010; // Display 5
					  4'd6: HEX5 <= 7'b0000010; // Display 6
					  4'd7: HEX5 <= 7'b1111000; // Display 7
					  4'd8: HEX5 <= 7'b0000000; // Display 8
					  4'd9: HEX5 <= 7'b0010000; // Display 9
					  default: HEX5 <= 7'b1111111;
				endcase
		endcase
		end 
	end 
end 
endmodule 