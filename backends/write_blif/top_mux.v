module mux16 (D, S, Y);
 	input  [15:0] D;
 	input  [3:0] S;
 	output Y;

 	assign Y = D[S];

endmodule


module top (
input [3:0] S,
input [15:0] D,
output M16
);

mux16 u_mux16 (
        .S (S[3:0]),
        .D (D[15:0]),
        .Y (M16)
    );

endmodule
