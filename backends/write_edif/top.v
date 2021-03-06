module top
(
 input x,
 input y,
 input cin,

 output reg A,
 output reg cout
 );

 wire bb_out;

 initial begin
    A = 0;
    cout = 0;
 end

always @(posedge x) begin
    A <=  y + cin;
end
always @(negedge x) begin
    cout <=  y + A;
end

bb ubb (cin,y,x,bb_out);

endmodule

(* black_box *) module bb(in1, in2, clk, out1);
 input in1;
 input in2;
 input clk;
  output reg out1;

 always @(posedge clk)
	out1 <= in1 & in2;
endmodule
