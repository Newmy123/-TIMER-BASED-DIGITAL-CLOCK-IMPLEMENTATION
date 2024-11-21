module project_group
(
	input CLOCK_50,
	input [0:0] KEY,
	output [6:0] HEX0,
	output [6:0] HEX1,
	output [6:0] HEX2,
	output [6:0] HEX3,
	output [6:0] HEX4,
	output [6:0] HEX5,
	output [9:0] LEDR,
	input [9:0] SW
);
system nios_system(
.clk_clk											(CLOCK_50),
.reset_reset_n									(KEY[0]),
.hex0_external_connection_export			({7'd0,HEX0}),
.hex1_external_connection_export			({7'd0,HEX1}),
.hex2_external_connection_export			({7'd0,HEX2}),
.hex3_external_connection_export			({7'd0,HEX3}),	
.hex4_external_connection_export			({7'd0,HEX4}),
.hex5_external_connection_export			({7'd0,HEX5}),
.led_external_connection_export			({10'd0,LEDR}),
.switch_external_connection_export		({10'd0,SW})
);
endmodule 