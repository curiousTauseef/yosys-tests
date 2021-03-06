module top
(
	input [7:0] data_a, data_b,
	input [6:1] addr_a, addr_b,
	input we_a, we_b, re_a, re_b, clk,
	output reg [7:0] q_a, q_b
);
	// Declare the RAM variable
	reg [7:0] ram[63:0];

	// Port A
	always @ (posedge clk)
	begin
		if (we_a)
		begin
			ram[addr_a] <= data_a;
			q_a <= data_a;
		end
		q_a <= ram[addr_a];
	end



endmodule
