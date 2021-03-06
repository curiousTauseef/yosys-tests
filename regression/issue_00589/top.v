module FullAdder (input  I0, input  I1, input  CIN, output  O, output  COUT);
wire  inst0_O;
wire  inst1_CO;
SB_LUT4 #(.LUT_INIT(16'h9696)) inst0 (.I0(I0), .I1(I1), .I2(CIN), .I3(1'b0), .O(inst0_O));
SB_CARRY inst1 (.I0(I0), .I1(I1), .CI(CIN), .CO(inst1_CO));
assign O = inst0_O;
assign COUT = inst1_CO;
endmodule

module Add5Cout (input [4:0] I0, input [4:0] I1, output [4:0] O, output  COUT);
wire  inst0_O;
wire  inst0_COUT;
wire  inst1_O;
wire  inst1_COUT;
wire  inst2_O;
wire  inst2_COUT;
wire  inst3_O;
wire  inst3_COUT;
wire  inst4_O;
wire  inst4_COUT;
FullAdder inst0 (.I0(I0[0]), .I1(I1[0]), .CIN(1'b0), .O(inst0_O), .COUT(inst0_COUT));
FullAdder inst1 (.I0(I0[1]), .I1(I1[1]), .CIN(inst0_COUT), .O(inst1_O), .COUT(inst1_COUT));
FullAdder inst2 (.I0(I0[2]), .I1(I1[2]), .CIN(inst1_COUT), .O(inst2_O), .COUT(inst2_COUT));
FullAdder inst3 (.I0(I0[3]), .I1(I1[3]), .CIN(inst2_COUT), .O(inst3_O), .COUT(inst3_COUT));
FullAdder inst4 (.I0(I0[4]), .I1(I1[4]), .CIN(inst3_COUT), .O(inst4_O), .COUT(inst4_COUT));
assign O = {inst4_O,inst3_O,inst2_O,inst1_O,inst0_O};
assign COUT = inst4_COUT;
endmodule

module Register5CE (input [4:0] I, output [4:0] O, input  CLK, input  CE);
wire  inst0_Q;
wire  inst1_Q;
wire  inst2_Q;
wire  inst3_Q;
wire  inst4_Q;
SB_DFFE inst0 (.C(CLK), .E(CE), .D(I[0]), .Q(inst0_Q));
SB_DFFE inst1 (.C(CLK), .E(CE), .D(I[1]), .Q(inst1_Q));
SB_DFFE inst2 (.C(CLK), .E(CE), .D(I[2]), .Q(inst2_Q));
SB_DFFE inst3 (.C(CLK), .E(CE), .D(I[3]), .Q(inst3_Q));
SB_DFFE inst4 (.C(CLK), .E(CE), .D(I[4]), .Q(inst4_Q));
assign O = {inst4_Q,inst3_Q,inst2_Q,inst1_Q,inst0_Q};
endmodule

module Counter5CE (output [4:0] O, output  COUT, input  CLK, input  CE);
wire [4:0] inst0_O;
wire  inst0_COUT;
wire [4:0] inst1_O;
Add5Cout inst0 (.I0(inst1_O), .I1({1'b0,1'b0,1'b0,1'b0,1'b1}), .O(inst0_O), .COUT(inst0_COUT));
Register5CE inst1 (.I(inst0_O), .O(inst1_O), .CLK(CLK), .CE(CE));
assign O = inst1_O;
assign COUT = inst0_COUT;
endmodule

module Mux2 (input [1:0] I, input  S, output  O);
wire  inst0_O;
SB_LUT4 #(.LUT_INIT(16'hCACA)) inst0 (.I0(I[0]), .I1(I[1]), .I2(S), .I3(1'b0), .O(inst0_O));
assign O = inst0_O;
endmodule

module Mux2x8 (input [7:0] I0, input [7:0] I1, input  S, output [7:0] O);
wire  inst0_O;
wire  inst1_O;
wire  inst2_O;
wire  inst3_O;
wire  inst4_O;
wire  inst5_O;
wire  inst6_O;
wire  inst7_O;
Mux2 inst0 (.I({I1[0],I0[0]}), .S(S), .O(inst0_O));
Mux2 inst1 (.I({I1[1],I0[1]}), .S(S), .O(inst1_O));
Mux2 inst2 (.I({I1[2],I0[2]}), .S(S), .O(inst2_O));
Mux2 inst3 (.I({I1[3],I0[3]}), .S(S), .O(inst3_O));
Mux2 inst4 (.I({I1[4],I0[4]}), .S(S), .O(inst4_O));
Mux2 inst5 (.I({I1[5],I0[5]}), .S(S), .O(inst5_O));
Mux2 inst6 (.I({I1[6],I0[6]}), .S(S), .O(inst6_O));
Mux2 inst7 (.I({I1[7],I0[7]}), .S(S), .O(inst7_O));
assign O = {inst7_O,inst6_O,inst5_O,inst4_O,inst3_O,inst2_O,inst1_O,inst0_O};
endmodule

module Add8 (input [7:0] I0, input [7:0] I1, output [7:0] O);
wire  inst0_O;
wire  inst0_COUT;
wire  inst1_O;
wire  inst1_COUT;
wire  inst2_O;
wire  inst2_COUT;
wire  inst3_O;
wire  inst3_COUT;
wire  inst4_O;
wire  inst4_COUT;
wire  inst5_O;
wire  inst5_COUT;
wire  inst6_O;
wire  inst6_COUT;
wire  inst7_O;
wire  inst7_COUT;
FullAdder inst0 (.I0(I0[0]), .I1(I1[0]), .CIN(1'b0), .O(inst0_O), .COUT(inst0_COUT));
FullAdder inst1 (.I0(I0[1]), .I1(I1[1]), .CIN(inst0_COUT), .O(inst1_O), .COUT(inst1_COUT));
FullAdder inst2 (.I0(I0[2]), .I1(I1[2]), .CIN(inst1_COUT), .O(inst2_O), .COUT(inst2_COUT));
FullAdder inst3 (.I0(I0[3]), .I1(I1[3]), .CIN(inst2_COUT), .O(inst3_O), .COUT(inst3_COUT));
FullAdder inst4 (.I0(I0[4]), .I1(I1[4]), .CIN(inst3_COUT), .O(inst4_O), .COUT(inst4_COUT));
FullAdder inst5 (.I0(I0[5]), .I1(I1[5]), .CIN(inst4_COUT), .O(inst5_O), .COUT(inst5_COUT));
FullAdder inst6 (.I0(I0[6]), .I1(I1[6]), .CIN(inst5_COUT), .O(inst6_O), .COUT(inst6_COUT));
FullAdder inst7 (.I0(I0[7]), .I1(I1[7]), .CIN(inst6_COUT), .O(inst7_O), .COUT(inst7_COUT));
assign O = {inst7_O,inst6_O,inst5_O,inst4_O,inst3_O,inst2_O,inst1_O,inst0_O};
endmodule

module Register8R (input [7:0] I, output [7:0] O, input  CLK, input  RESET);
wire  inst0_Q;
wire  inst1_Q;
wire  inst2_Q;
wire  inst3_Q;
wire  inst4_Q;
wire  inst5_Q;
wire  inst6_Q;
wire  inst7_Q;
SB_DFFSR inst0 (.C(CLK), .R(RESET), .D(I[0]), .Q(inst0_Q));
SB_DFFSR inst1 (.C(CLK), .R(RESET), .D(I[1]), .Q(inst1_Q));
SB_DFFSR inst2 (.C(CLK), .R(RESET), .D(I[2]), .Q(inst2_Q));
SB_DFFSR inst3 (.C(CLK), .R(RESET), .D(I[3]), .Q(inst3_Q));
SB_DFFSR inst4 (.C(CLK), .R(RESET), .D(I[4]), .Q(inst4_Q));
SB_DFFSR inst5 (.C(CLK), .R(RESET), .D(I[5]), .Q(inst5_Q));
SB_DFFSR inst6 (.C(CLK), .R(RESET), .D(I[6]), .Q(inst6_Q));
SB_DFFSR inst7 (.C(CLK), .R(RESET), .D(I[7]), .Q(inst7_Q));
assign O = {inst7_Q,inst6_Q,inst5_Q,inst4_Q,inst3_Q,inst2_Q,inst1_Q,inst0_Q};
endmodule

module Counter8R (output [7:0] O, input  CLK, input  RESET);
wire [7:0] inst0_O;
wire [7:0] inst1_O;
Add8 inst0 (.I0(inst1_O), .I1({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}), .O(inst0_O));
Register8R inst1 (.I(inst0_O), .O(inst1_O), .CLK(CLK), .RESET(RESET));
assign O = inst1_O;
endmodule

module EQ8 (input [7:0] I0, input [7:0] I1, output  O);
wire  inst0_O;
wire  inst1_O;
wire  inst2_O;
wire  inst3_O;
wire  inst4_O;
wire  inst5_O;
wire  inst6_O;
wire  inst7_O;
SB_LUT4 #(.LUT_INIT(16'h8282)) inst0 (.I0(1'b1), .I1(I0[0]), .I2(I1[0]), .I3(1'b0), .O(inst0_O));
SB_LUT4 #(.LUT_INIT(16'h8282)) inst1 (.I0(inst0_O), .I1(I0[1]), .I2(I1[1]), .I3(1'b0), .O(inst1_O));
SB_LUT4 #(.LUT_INIT(16'h8282)) inst2 (.I0(inst1_O), .I1(I0[2]), .I2(I1[2]), .I3(1'b0), .O(inst2_O));
SB_LUT4 #(.LUT_INIT(16'h8282)) inst3 (.I0(inst2_O), .I1(I0[3]), .I2(I1[3]), .I3(1'b0), .O(inst3_O));
SB_LUT4 #(.LUT_INIT(16'h8282)) inst4 (.I0(inst3_O), .I1(I0[4]), .I2(I1[4]), .I3(1'b0), .O(inst4_O));
SB_LUT4 #(.LUT_INIT(16'h8282)) inst5 (.I0(inst4_O), .I1(I0[5]), .I2(I1[5]), .I3(1'b0), .O(inst5_O));
SB_LUT4 #(.LUT_INIT(16'h8282)) inst6 (.I0(inst5_O), .I1(I0[6]), .I2(I1[6]), .I3(1'b0), .O(inst6_O));
SB_LUT4 #(.LUT_INIT(16'h8282)) inst7 (.I0(inst6_O), .I1(I0[7]), .I2(I1[7]), .I3(1'b0), .O(inst7_O));
assign O = inst7_O;
endmodule

module Decode1028 (input [7:0] I, output  O);
wire  inst0_O;
EQ8 inst0 (.I0(I), .I1({1'b0,1'b1,1'b1,1'b0,1'b0,1'b1,1'b1,1'b0}), .O(inst0_O));
assign O = inst0_O;
endmodule

module Counter8Mod103COUT (output [7:0] O, output  COUT, input  CLK);
wire [7:0] inst0_O;
wire  inst1_O;
Counter8R inst0 (.O(inst0_O), .CLK(CLK), .RESET(inst1_O));
Decode1028 inst1 (.I(inst0_O), .O(inst1_O));
assign O = inst0_O;
assign COUT = inst1_O;
endmodule

module Add4Cout (input [3:0] I0, input [3:0] I1, output [3:0] O, output  COUT);
wire  inst0_O;
wire  inst0_COUT;
wire  inst1_O;
wire  inst1_COUT;
wire  inst2_O;
wire  inst2_COUT;
wire  inst3_O;
wire  inst3_COUT;
FullAdder inst0 (.I0(I0[0]), .I1(I1[0]), .CIN(1'b0), .O(inst0_O), .COUT(inst0_COUT));
FullAdder inst1 (.I0(I0[1]), .I1(I1[1]), .CIN(inst0_COUT), .O(inst1_O), .COUT(inst1_COUT));
FullAdder inst2 (.I0(I0[2]), .I1(I1[2]), .CIN(inst1_COUT), .O(inst2_O), .COUT(inst2_COUT));
FullAdder inst3 (.I0(I0[3]), .I1(I1[3]), .CIN(inst2_COUT), .O(inst3_O), .COUT(inst3_COUT));
assign O = {inst3_O,inst2_O,inst1_O,inst0_O};
assign COUT = inst3_COUT;
endmodule

module Register4CE (input [3:0] I, output [3:0] O, input  CLK, input  CE);
wire  inst0_Q;
wire  inst1_Q;
wire  inst2_Q;
wire  inst3_Q;
SB_DFFE inst0 (.C(CLK), .E(CE), .D(I[0]), .Q(inst0_Q));
SB_DFFE inst1 (.C(CLK), .E(CE), .D(I[1]), .Q(inst1_Q));
SB_DFFE inst2 (.C(CLK), .E(CE), .D(I[2]), .Q(inst2_Q));
SB_DFFE inst3 (.C(CLK), .E(CE), .D(I[3]), .Q(inst3_Q));
assign O = {inst3_Q,inst2_Q,inst1_Q,inst0_Q};
endmodule

module Counter4CE (output [3:0] O, output  COUT, input  CLK, input  CE);
wire [3:0] inst0_O;
wire  inst0_COUT;
wire [3:0] inst1_O;
Add4Cout inst0 (.I0(inst1_O), .I1({1'b0,1'b0,1'b0,1'b1}), .O(inst0_O), .COUT(inst0_COUT));
Register4CE inst1 (.I(inst0_O), .O(inst1_O), .CLK(CLK), .CE(CE));
assign O = inst1_O;
assign COUT = inst0_COUT;
endmodule

module Register8CE (input [7:0] I, output [7:0] O, input  CLK, input  CE);
wire  inst0_Q;
wire  inst1_Q;
wire  inst2_Q;
wire  inst3_Q;
wire  inst4_Q;
wire  inst5_Q;
wire  inst6_Q;
wire  inst7_Q;
SB_DFFE inst0 (.C(CLK), .E(CE), .D(I[0]), .Q(inst0_Q));
SB_DFFE inst1 (.C(CLK), .E(CE), .D(I[1]), .Q(inst1_Q));
SB_DFFE inst2 (.C(CLK), .E(CE), .D(I[2]), .Q(inst2_Q));
SB_DFFE inst3 (.C(CLK), .E(CE), .D(I[3]), .Q(inst3_Q));
SB_DFFE inst4 (.C(CLK), .E(CE), .D(I[4]), .Q(inst4_Q));
SB_DFFE inst5 (.C(CLK), .E(CE), .D(I[5]), .Q(inst5_Q));
SB_DFFE inst6 (.C(CLK), .E(CE), .D(I[6]), .Q(inst6_Q));
SB_DFFE inst7 (.C(CLK), .E(CE), .D(I[7]), .Q(inst7_Q));
assign O = {inst7_Q,inst6_Q,inst5_Q,inst4_Q,inst3_Q,inst2_Q,inst1_Q,inst0_Q};
endmodule

module PIPO8CE (input  SI, input [7:0] PI, input  LOAD, output [7:0] O, input  CLK, input  CE);
wire  inst0_O;
wire  inst1_O;
wire  inst2_O;
wire  inst3_O;
wire  inst4_O;
wire  inst5_O;
wire  inst6_O;
wire  inst7_O;
wire [7:0] inst8_O;
Mux2 inst0 (.I({PI[0],SI}), .S(LOAD), .O(inst0_O));
Mux2 inst1 (.I({PI[1],inst8_O[0]}), .S(LOAD), .O(inst1_O));
Mux2 inst2 (.I({PI[2],inst8_O[1]}), .S(LOAD), .O(inst2_O));
Mux2 inst3 (.I({PI[3],inst8_O[2]}), .S(LOAD), .O(inst3_O));
Mux2 inst4 (.I({PI[4],inst8_O[3]}), .S(LOAD), .O(inst4_O));
Mux2 inst5 (.I({PI[5],inst8_O[4]}), .S(LOAD), .O(inst5_O));
Mux2 inst6 (.I({PI[6],inst8_O[5]}), .S(LOAD), .O(inst6_O));
Mux2 inst7 (.I({PI[7],inst8_O[6]}), .S(LOAD), .O(inst7_O));
Register8CE inst8 (.I({inst7_O,inst6_O,inst5_O,inst4_O,inst3_O,inst2_O,inst1_O,inst0_O}), .O(inst8_O), .CLK(CLK), .CE(CE));
assign O = inst8_O;
endmodule

module Or2 (input [1:0] I, output  O);
wire  inst0_O;
SB_LUT4 #(.LUT_INIT(16'hEEEE)) inst0 (.I0(I[0]), .I1(I[1]), .I2(1'b0), .I3(1'b0), .O(inst0_O));
assign O = inst0_O;
endmodule

module And2 (input [1:0] I, output  O);
wire  inst0_O;
SB_LUT4 #(.LUT_INIT(16'h8888)) inst0 (.I0(I[0]), .I1(I[1]), .I2(1'b0), .I3(1'b0), .O(inst0_O));
assign O = inst0_O;
endmodule

module FixedLSL16_8 (input [15:0] I, output [15:0] O);
assign O = {I[7],I[6],I[5],I[4],I[3],I[2],I[1],I[0],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0};
endmodule

module Add16 (input [15:0] I0, input [15:0] I1, output [15:0] O);
wire  inst0_O;
wire  inst0_COUT;
wire  inst1_O;
wire  inst1_COUT;
wire  inst2_O;
wire  inst2_COUT;
wire  inst3_O;
wire  inst3_COUT;
wire  inst4_O;
wire  inst4_COUT;
wire  inst5_O;
wire  inst5_COUT;
wire  inst6_O;
wire  inst6_COUT;
wire  inst7_O;
wire  inst7_COUT;
wire  inst8_O;
wire  inst8_COUT;
wire  inst9_O;
wire  inst9_COUT;
wire  inst10_O;
wire  inst10_COUT;
wire  inst11_O;
wire  inst11_COUT;
wire  inst12_O;
wire  inst12_COUT;
wire  inst13_O;
wire  inst13_COUT;
wire  inst14_O;
wire  inst14_COUT;
wire  inst15_O;
wire  inst15_COUT;
FullAdder inst0 (.I0(I0[0]), .I1(I1[0]), .CIN(1'b0), .O(inst0_O), .COUT(inst0_COUT));
FullAdder inst1 (.I0(I0[1]), .I1(I1[1]), .CIN(inst0_COUT), .O(inst1_O), .COUT(inst1_COUT));
FullAdder inst2 (.I0(I0[2]), .I1(I1[2]), .CIN(inst1_COUT), .O(inst2_O), .COUT(inst2_COUT));
FullAdder inst3 (.I0(I0[3]), .I1(I1[3]), .CIN(inst2_COUT), .O(inst3_O), .COUT(inst3_COUT));
FullAdder inst4 (.I0(I0[4]), .I1(I1[4]), .CIN(inst3_COUT), .O(inst4_O), .COUT(inst4_COUT));
FullAdder inst5 (.I0(I0[5]), .I1(I1[5]), .CIN(inst4_COUT), .O(inst5_O), .COUT(inst5_COUT));
FullAdder inst6 (.I0(I0[6]), .I1(I1[6]), .CIN(inst5_COUT), .O(inst6_O), .COUT(inst6_COUT));
FullAdder inst7 (.I0(I0[7]), .I1(I1[7]), .CIN(inst6_COUT), .O(inst7_O), .COUT(inst7_COUT));
FullAdder inst8 (.I0(I0[8]), .I1(I1[8]), .CIN(inst7_COUT), .O(inst8_O), .COUT(inst8_COUT));
FullAdder inst9 (.I0(I0[9]), .I1(I1[9]), .CIN(inst8_COUT), .O(inst9_O), .COUT(inst9_COUT));
FullAdder inst10 (.I0(I0[10]), .I1(I1[10]), .CIN(inst9_COUT), .O(inst10_O), .COUT(inst10_COUT));
FullAdder inst11 (.I0(I0[11]), .I1(I1[11]), .CIN(inst10_COUT), .O(inst11_O), .COUT(inst11_COUT));
FullAdder inst12 (.I0(I0[12]), .I1(I1[12]), .CIN(inst11_COUT), .O(inst12_O), .COUT(inst12_COUT));
FullAdder inst13 (.I0(I0[13]), .I1(I1[13]), .CIN(inst12_COUT), .O(inst13_O), .COUT(inst13_COUT));
FullAdder inst14 (.I0(I0[14]), .I1(I1[14]), .CIN(inst13_COUT), .O(inst14_O), .COUT(inst14_COUT));
FullAdder inst15 (.I0(I0[15]), .I1(I1[15]), .CIN(inst14_COUT), .O(inst15_O), .COUT(inst15_COUT));
assign O = {inst15_O,inst14_O,inst13_O,inst12_O,inst11_O,inst10_O,inst9_O,inst8_O,inst7_O,inst6_O,inst5_O,inst4_O,inst3_O,inst2_O,inst1_O,inst0_O};
endmodule

module FixedLSR16_11 (input [15:0] I, output [15:0] O);
assign O = {1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,I[15],I[14],I[13],I[12],I[11]};
endmodule

module And2x16 (input [15:0] I0, input [15:0] I1, output [15:0] O);
wire  inst0_O;
wire  inst1_O;
wire  inst2_O;
wire  inst3_O;
wire  inst4_O;
wire  inst5_O;
wire  inst6_O;
wire  inst7_O;
wire  inst8_O;
wire  inst9_O;
wire  inst10_O;
wire  inst11_O;
wire  inst12_O;
wire  inst13_O;
wire  inst14_O;
wire  inst15_O;
And2 inst0 (.I({I1[0],I0[0]}), .O(inst0_O));
And2 inst1 (.I({I1[1],I0[1]}), .O(inst1_O));
And2 inst2 (.I({I1[2],I0[2]}), .O(inst2_O));
And2 inst3 (.I({I1[3],I0[3]}), .O(inst3_O));
And2 inst4 (.I({I1[4],I0[4]}), .O(inst4_O));
And2 inst5 (.I({I1[5],I0[5]}), .O(inst5_O));
And2 inst6 (.I({I1[6],I0[6]}), .O(inst6_O));
And2 inst7 (.I({I1[7],I0[7]}), .O(inst7_O));
And2 inst8 (.I({I1[8],I0[8]}), .O(inst8_O));
And2 inst9 (.I({I1[9],I0[9]}), .O(inst9_O));
And2 inst10 (.I({I1[10],I0[10]}), .O(inst10_O));
And2 inst11 (.I({I1[11],I0[11]}), .O(inst11_O));
And2 inst12 (.I({I1[12],I0[12]}), .O(inst12_O));
And2 inst13 (.I({I1[13],I0[13]}), .O(inst13_O));
And2 inst14 (.I({I1[14],I0[14]}), .O(inst14_O));
And2 inst15 (.I({I1[15],I0[15]}), .O(inst15_O));
assign O = {inst15_O,inst14_O,inst13_O,inst12_O,inst11_O,inst10_O,inst9_O,inst8_O,inst7_O,inst6_O,inst5_O,inst4_O,inst3_O,inst2_O,inst1_O,inst0_O};
endmodule

module FixedLSR16_5 (input [15:0] I, output [15:0] O);
assign O = {1'b0,1'b0,1'b0,1'b0,1'b0,I[15],I[14],I[13],I[12],I[11],I[10],I[9],I[8],I[7],I[6],I[5]};
endmodule

module Register9CE (input [8:0] I, output [8:0] O, input  CLK, input  CE);
wire  inst0_Q;
wire  inst1_Q;
wire  inst2_Q;
wire  inst3_Q;
wire  inst4_Q;
wire  inst5_Q;
wire  inst6_Q;
wire  inst7_Q;
wire  inst8_Q;
SB_DFFE inst0 (.C(CLK), .E(CE), .D(I[0]), .Q(inst0_Q));
SB_DFFE inst1 (.C(CLK), .E(CE), .D(I[1]), .Q(inst1_Q));
SB_DFFE inst2 (.C(CLK), .E(CE), .D(I[2]), .Q(inst2_Q));
SB_DFFE inst3 (.C(CLK), .E(CE), .D(I[3]), .Q(inst3_Q));
SB_DFFE inst4 (.C(CLK), .E(CE), .D(I[4]), .Q(inst4_Q));
SB_DFFE inst5 (.C(CLK), .E(CE), .D(I[5]), .Q(inst5_Q));
SB_DFFE inst6 (.C(CLK), .E(CE), .D(I[6]), .Q(inst6_Q));
SB_DFFE inst7 (.C(CLK), .E(CE), .D(I[7]), .Q(inst7_Q));
SB_DFFE inst8 (.C(CLK), .E(CE), .D(I[8]), .Q(inst8_Q));
assign O = {inst8_Q,inst7_Q,inst6_Q,inst5_Q,inst4_Q,inst3_Q,inst2_Q,inst1_Q,inst0_Q};
endmodule

module PISO9CE (input  SI, input [8:0] PI, input  LOAD, output  O, input  CLK, input  CE);
wire  inst0_O;
wire  inst1_O;
wire  inst2_O;
wire  inst3_O;
wire  inst4_O;
wire  inst5_O;
wire  inst6_O;
wire  inst7_O;
wire  inst8_O;
wire [8:0] inst9_O;
Mux2 inst0 (.I({PI[0],SI}), .S(LOAD), .O(inst0_O));
Mux2 inst1 (.I({PI[1],inst9_O[0]}), .S(LOAD), .O(inst1_O));
Mux2 inst2 (.I({PI[2],inst9_O[1]}), .S(LOAD), .O(inst2_O));
Mux2 inst3 (.I({PI[3],inst9_O[2]}), .S(LOAD), .O(inst3_O));
Mux2 inst4 (.I({PI[4],inst9_O[3]}), .S(LOAD), .O(inst4_O));
Mux2 inst5 (.I({PI[5],inst9_O[4]}), .S(LOAD), .O(inst5_O));
Mux2 inst6 (.I({PI[6],inst9_O[5]}), .S(LOAD), .O(inst6_O));
Mux2 inst7 (.I({PI[7],inst9_O[6]}), .S(LOAD), .O(inst7_O));
Mux2 inst8 (.I({PI[8],inst9_O[7]}), .S(LOAD), .O(inst8_O));
Register9CE inst9 (.I({inst8_O,inst7_O,inst6_O,inst5_O,inst4_O,inst3_O,inst2_O,inst1_O,inst0_O}), .O(inst9_O), .CLK(CLK), .CE(CE));
assign O = inst9_O[8];
endmodule

module main (output [4:0] J3, input  CLKIN);
wire [4:0] inst0_O;
wire  inst0_COUT;
wire [7:0] inst1_O;
wire [7:0] inst2_O;
wire [7:0] inst3_O;
wire [7:0] inst4_O;
wire [7:0] inst5_O;
wire [7:0] inst6_O;
wire [7:0] inst7_O;
wire [7:0] inst8_O;
wire [7:0] inst9_O;
wire [7:0] inst10_O;
wire [7:0] inst11_O;
wire [7:0] inst12_O;
wire [7:0] inst13_O;
wire [7:0] inst14_O;
wire [7:0] inst15_O;
wire [7:0] inst16_O;
wire [7:0] inst17_O;
wire [7:0] inst18_O;
wire [7:0] inst19_O;
wire [7:0] inst20_O;
wire [7:0] inst21_O;
wire [7:0] inst22_O;
wire [7:0] inst23_O;
wire [7:0] inst24_O;
wire [7:0] inst25_O;
wire [7:0] inst26_O;
wire [7:0] inst27_O;
wire [7:0] inst28_O;
wire [7:0] inst29_O;
wire [7:0] inst30_O;
wire [7:0] inst31_O;
wire [7:0] inst32_O;
wire  inst32_COUT;
wire [3:0] inst33_O;
wire  inst33_COUT;
wire  inst34_O;
wire  inst35_O;
wire [7:0] inst36_O;
wire [7:0] inst37_O;
wire  inst38_O;
wire  inst39_O;
wire [15:0] inst40_O;
wire [15:0] inst41_O;
wire [15:0] inst42_O;
wire [15:0] inst43_O;
wire [15:0] inst44_O;
wire [15:0] inst45_O;
wire [15:0] inst46_O;
wire [15:0] inst47_O;
wire [15:0] inst48_O;
wire [7:0] inst49_O;
wire  inst49_V;
wire  inst49_CLKOut;
wire  inst50_O;
wire  inst51_O;
Counter5CE inst0 (.O(inst0_O), .COUT(inst0_COUT), .CLK(CLKIN), .CE(inst39_O));
Mux2x8 inst1 (.I0({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}), .I1({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}), .S(inst0_O[0]), .O(inst1_O));
Mux2x8 inst2 (.I0({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0}), .I1({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1}), .S(inst0_O[0]), .O(inst2_O));
Mux2x8 inst3 (.I0({1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0}), .I1({1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}), .S(inst0_O[0]), .O(inst3_O));
Mux2x8 inst4 (.I0({1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0}), .I1({1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1}), .S(inst0_O[0]), .O(inst4_O));
Mux2x8 inst5 (.I0({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0}), .I1({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b1}), .S(inst0_O[0]), .O(inst5_O));
Mux2x8 inst6 (.I0({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1,1'b0}), .I1({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1,1'b1}), .S(inst0_O[0]), .O(inst6_O));
Mux2x8 inst7 (.I0({1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0}), .I1({1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b1}), .S(inst0_O[0]), .O(inst7_O));
Mux2x8 inst8 (.I0({1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b0}), .I1({1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1}), .S(inst0_O[0]), .O(inst8_O));
Mux2x8 inst9 (.I0({1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0,1'b0}), .I1({1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0,1'b1}), .S(inst0_O[0]), .O(inst9_O));
Mux2x8 inst10 (.I0({1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b1,1'b0}), .I1({1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b1,1'b1}), .S(inst0_O[0]), .O(inst10_O));
Mux2x8 inst11 (.I0({1'b0,1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b0}), .I1({1'b0,1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}), .S(inst0_O[0]), .O(inst11_O));
Mux2x8 inst12 (.I0({1'b0,1'b0,1'b0,1'b1,1'b0,1'b1,1'b1,1'b0}), .I1({1'b0,1'b0,1'b0,1'b1,1'b0,1'b1,1'b1,1'b1}), .S(inst0_O[0]), .O(inst12_O));
Mux2x8 inst13 (.I0({1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,1'b0}), .I1({1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b0,1'b1}), .S(inst0_O[0]), .O(inst13_O));
Mux2x8 inst14 (.I0({1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b1,1'b0}), .I1({1'b0,1'b0,1'b0,1'b1,1'b1,1'b0,1'b1,1'b1}), .S(inst0_O[0]), .O(inst14_O));
Mux2x8 inst15 (.I0({1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b0,1'b0}), .I1({1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b0,1'b1}), .S(inst0_O[0]), .O(inst15_O));
Mux2x8 inst16 (.I0({1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b0}), .I1({1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1}), .S(inst0_O[0]), .O(inst16_O));
Mux2x8 inst17 (.I0(inst1_O), .I1(inst2_O), .S(inst0_O[1]), .O(inst17_O));
Mux2x8 inst18 (.I0(inst3_O), .I1(inst4_O), .S(inst0_O[1]), .O(inst18_O));
Mux2x8 inst19 (.I0(inst5_O), .I1(inst6_O), .S(inst0_O[1]), .O(inst19_O));
Mux2x8 inst20 (.I0(inst7_O), .I1(inst8_O), .S(inst0_O[1]), .O(inst20_O));
Mux2x8 inst21 (.I0(inst9_O), .I1(inst10_O), .S(inst0_O[1]), .O(inst21_O));
Mux2x8 inst22 (.I0(inst11_O), .I1(inst12_O), .S(inst0_O[1]), .O(inst22_O));
Mux2x8 inst23 (.I0(inst13_O), .I1(inst14_O), .S(inst0_O[1]), .O(inst23_O));
Mux2x8 inst24 (.I0(inst15_O), .I1(inst16_O), .S(inst0_O[1]), .O(inst24_O));
Mux2x8 inst25 (.I0(inst17_O), .I1(inst18_O), .S(inst0_O[2]), .O(inst25_O));
Mux2x8 inst26 (.I0(inst19_O), .I1(inst20_O), .S(inst0_O[2]), .O(inst26_O));
Mux2x8 inst27 (.I0(inst21_O), .I1(inst22_O), .S(inst0_O[2]), .O(inst27_O));
Mux2x8 inst28 (.I0(inst23_O), .I1(inst24_O), .S(inst0_O[2]), .O(inst28_O));
Mux2x8 inst29 (.I0(inst25_O), .I1(inst26_O), .S(inst0_O[3]), .O(inst29_O));
Mux2x8 inst30 (.I0(inst27_O), .I1(inst28_O), .S(inst0_O[3]), .O(inst30_O));
Mux2x8 inst31 (.I0(inst29_O), .I1(inst30_O), .S(inst0_O[4]), .O(inst31_O));
Counter8Mod103COUT inst32 (.O(inst32_O), .COUT(inst32_COUT), .CLK(CLKIN));
Counter4CE inst33 (.O(inst33_O), .COUT(inst33_COUT), .CLK(CLKIN), .CE(inst32_COUT));
SB_LUT4 #(.LUT_INIT(16'h0001)) inst34 (.I0(inst33_O[0]), .I1(inst33_O[1]), .I2(inst33_O[2]), .I3(inst33_O[3]), .O(inst34_O));
SB_LUT4 #(.LUT_INIT(16'h0100)) inst35 (.I0(inst33_O[0]), .I1(inst33_O[1]), .I2(inst33_O[2]), .I3(inst33_O[3]), .O(inst35_O));
PIPO8CE inst36 (.SI(1'b0), .PI(inst31_O), .LOAD(inst34_O), .O(inst36_O), .CLK(CLKIN), .CE(inst34_O));
PIPO8CE inst37 (.SI(1'b0), .PI(inst31_O), .LOAD(inst35_O), .O(inst37_O), .CLK(CLKIN), .CE(inst35_O));
Or2 inst38 (.I({inst35_O,inst34_O}), .O(inst38_O));
And2 inst39 (.I({inst32_COUT,inst38_O}), .O(inst39_O));
FixedLSL16_8 inst40 (.I({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,inst37_O[7],inst37_O[6],inst37_O[5],inst37_O[4],inst37_O[3],inst37_O[2],inst37_O[1],inst37_O[0]}), .O(inst40_O));
Add16 inst41 (.I0(inst40_O), .I1({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,inst36_O[7],inst36_O[6],inst36_O[5],inst36_O[4],inst36_O[3],inst36_O[2],inst36_O[1],inst36_O[0]}), .O(inst41_O));
FixedLSR16_11 inst42 (.I(inst43_O), .O(inst42_O));
And2x16 inst43 (.I0(inst41_O), .I1({1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}), .O(inst43_O));
FixedLSR16_5 inst44 (.I(inst45_O), .O(inst44_O));
And2x16 inst45 (.I0(inst41_O), .I1({1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0}), .O(inst45_O));
And2x16 inst46 (.I0(inst41_O), .I1({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1}), .O(inst46_O));
Add16 inst47 (.I0(inst42_O), .I1(inst44_O), .O(inst47_O));
Add16 inst48 (.I0(inst47_O), .I1(inst46_O), .O(inst48_O));
STEN inst49 (.I_0_0({{{inst48_O[7],inst48_O[6],inst48_O[5],inst48_O[4],inst48_O[3],inst48_O[2],inst48_O[1],inst48_O[0]}}}), .O(inst49_O), .V(inst49_V), .CLK(CLKIN), .CLKOut(inst49_CLKOut));
PISO9CE inst50 (.SI(1'b1), .PI({1'b0,inst49_O[0],inst49_O[1],inst49_O[2],inst49_O[3],inst49_O[4],inst49_O[5],inst49_O[6],inst49_O[7]}), .LOAD(inst35_O), .O(inst50_O), .CLK(CLKIN), .CE(inst32_COUT));
And2 inst51 (.I({inst49_V,inst35_O}), .O(inst51_O));
assign J3 = {inst50_O,inst49_CLKOut,inst35_O,inst34_O,inst32_COUT};
endmodule

//Module: Add8 defined externally
//Module: pullresistor defined externally


module corebit_ibuf (
  inout in,
  output out
);
  assign out = in;

endmodule //corebit_ibuf

module bitopn_U18 (
  input [0:0] in,
  output  out
);
  //All the connections
  assign out = in[0];

endmodule //bitopn_U18

module coreir_const #(parameter value=1, parameter width=1) (
  output [width-1:0] out
);
  assign out = value;

endmodule //coreir_const

module corebit_and (
  input in0,
  input in1,
  output out
);
  assign out = in0 & in1;

endmodule //corebit_and

module bitopn_U17 (
  input [1:0] in,
  output  out
);
  //Wire declarations for instance 'join' (Module corebit_and)
  wire  join__in0;
  wire  join__in1;
  wire  join__out;
  corebit_and join(
    .in0(join__in0),
    .in1(join__in1),
    .out(join__out)
  );

  //All the connections
  assign join__in0 = in[0];
  assign out = join__out;
  assign join__in1 = in[1];

endmodule //bitopn_U17

module bitopn_U8 (
  input [2:0] in,
  output  out
);
  //Wire declarations for instance 'join' (Module corebit_and)
  wire  join__in0;
  wire  join__in1;
  wire  join__out;
  corebit_and join(
    .in0(join__in0),
    .in1(join__in1),
    .out(join__out)
  );

  //Wire declarations for instance 'opN_0' (Module bitopn_U17)
  wire [1:0] opN_0__in;
  wire  opN_0__out;
  bitopn_U17 opN_0(
    .in(opN_0__in),
    .out(opN_0__out)
  );

  //Wire declarations for instance 'opN_1' (Module bitopn_U18)
  wire [0:0] opN_1__in;
  wire  opN_1__out;
  bitopn_U18 opN_1(
    .in(opN_1__in),
    .out(opN_1__out)
  );

  //All the connections
  assign out = join__out;
  assign join__in0 = opN_0__out;
  assign opN_0__in[1] = in[1];
  assign opN_0__in[0] = in[0];
  assign join__in1 = opN_1__out;
  assign opN_1__in[0] = in[2];

endmodule //bitopn_U8

module corebit_concat (
  input in0,
  input in1,
  output [1:0] out
);
  assign out = {in0, in1};

endmodule //corebit_concat

module coreir_mux #(parameter width=1) (
  input [width-1:0] in0,
  input [width-1:0] in1,
  input sel,
  output [width-1:0] out
);
  assign out = sel ? in1 : in0;

endmodule //coreir_mux

module corebit_const #(parameter value=1) (
  output out
);
  assign out = value;

endmodule //corebit_const

module corebit_mux (
  input in0,
  input in1,
  input sel,
  output out
);
  assign out = sel ? in1 : in0;

endmodule //corebit_mux

module corebit_not (
  input in,
  output out
);
  assign out = ~in;

endmodule //corebit_not

module corebit_or (
  input in0,
  input in1,
  output out
);
  assign out = in0 | in1;

endmodule //corebit_or

module coreir_ule #(parameter width=1) (
  input [width-1:0] in0,
  input [width-1:0] in1,
  output out
);
  assign out = in0 <= in1;

endmodule //coreir_ule

module corebit_reg #(parameter clk_posedge=1, parameter init=1) (
  input clk,
  input in,
  output out
);
reg outReg = init;
always @(posedge clk) begin
  outReg <= in;
end
assign out = outReg;

endmodule //corebit_reg

module corebit_reg_arst #(parameter arst_posedge=1, parameter clk_posedge=1, parameter init=1) (
  input clk,
  input in,
  input arst,
  output out
);
reg outReg;
wire real_rst;
assign real_rst = arst_posedge ? arst : ~arst;
wire real_clk;
assign real_clk = clk_posedge ? clk : ~clk;
always @(posedge real_clk, posedge real_rst) begin
  if (real_rst) outReg <= init;
  else outReg <= in;
end
assign out = outReg;

endmodule //corebit_reg_arst

module coreir_zext #(parameter width_in=1, parameter width_out=1) (
  input [width_in-1:0] in,
  output [width_out-1:0] out
);
  assign out = {{(width_out-width_in){1'b0}},in};

endmodule //coreir_zext

module corebit_term (
  input in
);


endmodule //corebit_term

module corebit_tribuf (
  input in,
  input en,
  inout out
);
  assign out = en ? in : 1'bz;

endmodule //corebit_tribuf

module coreir_mem #(parameter depth=1, parameter has_init=1, parameter width=1) (
  input clk,
  input [width-1:0] wdata,
  input [$clog2(depth)-1:0] waddr,
  input wen,
  output reg [width-1:0] rdata,
  input [$clog2(depth)-1:0] raddr
);
  reg [width-1:0] data[depth-1:0];
  always @(posedge clk) begin
    if (wen) begin
      data[waddr] <= wdata;
    end
    rdata <= data[raddr];
  end


endmodule //coreir_mem

module corebit_wire (
  input in,
  output out
);
  assign out = in;

endmodule //corebit_wire

module corebit_xor (
  input in0,
  input in1,
  output out
);
  assign out = in0 ^ in1;

endmodule //corebit_xor

module coreir_add #(parameter width=1) (
  input [width-1:0] in0,
  input [width-1:0] in1,
  output [width-1:0] out
);
  assign out = in0 + in1;

endmodule //coreir_add

module coreir_eq #(parameter width=1) (
  input [width-1:0] in0,
  input [width-1:0] in1,
  output out
);
  assign out = in0 == in1;

endmodule //coreir_eq

module coreir_ult #(parameter width=1) (
  input [width-1:0] in0,
  input [width-1:0] in1,
  output out
);
  assign out = in0 < in1;

endmodule //coreir_ult

module coreir_reg #(parameter clk_posedge=1, parameter init=1, parameter width=1) (
  input clk,
  input [width-1:0] in,
  output [width-1:0] out
);
reg [width-1:0] outReg=init;
wire real_clk;
assign real_clk = clk_posedge ? clk : ~clk;
always @(posedge real_clk) begin
  outReg <= in;
end
assign out = outReg;

endmodule //coreir_reg

module coreir_const80 (
  output [7:0] out
);
  //Wire declarations for instance 'bit_const_GND' (Module corebit_const)
  wire  bit_const_GND__out;
  corebit_const #(.value(0)) bit_const_GND(
    .out(bit_const_GND__out)
  );

  //All the connections
  assign out[0] = bit_const_GND__out;
  assign out[1] = bit_const_GND__out;
  assign out[2] = bit_const_GND__out;
  assign out[3] = bit_const_GND__out;
  assign out[4] = bit_const_GND__out;
  assign out[5] = bit_const_GND__out;
  assign out[6] = bit_const_GND__out;
  assign out[7] = bit_const_GND__out;

endmodule //coreir_const80

module coreir_or #(parameter width=1) (
  input [width-1:0] in0,
  input [width-1:0] in1,
  output [width-1:0] out
);
  assign out = in0 | in1;

endmodule //coreir_or

module linebuffer_U3 (
  input  clk,
  input [7:0] in_0,
  output [7:0] out_0,
  output [7:0] out_1,
  output  valid,
  output  valid_chain,
  input  wen
);
  //Wire declarations for instance 'reg_1' (Module coreir_reg)
  wire  reg_1__clk;
  wire [7:0] reg_1__in;
  wire [7:0] reg_1__out;
  coreir_reg #(.clk_posedge(1),.init(8'bxxxxxxxx),.width(8)) reg_1(
    .clk(reg_1__clk),
    .in(reg_1__in),
    .out(reg_1__out)
  );

  //All the connections
  assign reg_1__in[7:0] = in_0[7:0];
  assign out_0[7:0] = reg_1__out[7:0];
  assign valid = wen;
  assign valid_chain = wen;
  assign reg_1__clk = clk;
  assign out_1[7:0] = in_0[7:0];

endmodule //linebuffer_U3

module reg_U11 #(parameter init=1) (
  input  clk,
  input  clr,
  input  en,
  input [4:0] in,
  output [4:0] out
);
  //Wire declarations for instance 'c0' (Module coreir_const)
  wire [4:0] c0__out;
  coreir_const #(.value(5'b00000),.width(5)) c0(
    .out(c0__out)
  );

  //Wire declarations for instance 'clrMux' (Module coreir_mux)
  wire [4:0] clrMux__in0;
  wire [4:0] clrMux__in1;
  wire [4:0] clrMux__out;
  wire  clrMux__sel;
  coreir_mux #(.width(5)) clrMux(
    .in0(clrMux__in0),
    .in1(clrMux__in1),
    .out(clrMux__out),
    .sel(clrMux__sel)
  );

  //Wire declarations for instance 'enMux' (Module coreir_mux)
  wire [4:0] enMux__in0;
  wire [4:0] enMux__in1;
  wire [4:0] enMux__out;
  wire  enMux__sel;
  coreir_mux #(.width(5)) enMux(
    .in0(enMux__in0),
    .in1(enMux__in1),
    .out(enMux__out),
    .sel(enMux__sel)
  );

  //Wire declarations for instance 'reg0' (Module coreir_reg)
  wire  reg0__clk;
  wire [4:0] reg0__in;
  wire [4:0] reg0__out;
  coreir_reg #(.clk_posedge(1),.init(init),.width(5)) reg0(
    .clk(reg0__clk),
    .in(reg0__in),
    .out(reg0__out)
  );

  //All the connections
  assign reg0__in[4:0] = enMux__out[4:0];
  assign out[4:0] = reg0__out[4:0];
  assign enMux__in0[4:0] = reg0__out[4:0];
  assign reg0__clk = clk;
  assign enMux__sel = en;
  assign enMux__in1[4:0] = clrMux__out[4:0];
  assign clrMux__in1[4:0] = c0__out[4:0];
  assign clrMux__sel = clr;
  assign clrMux__in0[4:0] = in[4:0];

endmodule //reg_U11

module reg_U12 #(parameter init=1) (
  input  clk,
  input  clr,
  input  en,
  input [0:0] in,
  output [0:0] out
);
  //Wire declarations for instance 'c0' (Module coreir_const)
  wire [0:0] c0__out;
  coreir_const #(.value(1'b0),.width(1)) c0(
    .out(c0__out)
  );

  //Wire declarations for instance 'clrMux' (Module coreir_mux)
  wire [0:0] clrMux__in0;
  wire [0:0] clrMux__in1;
  wire [0:0] clrMux__out;
  wire  clrMux__sel;
  coreir_mux #(.width(1)) clrMux(
    .in0(clrMux__in0),
    .in1(clrMux__in1),
    .out(clrMux__out),
    .sel(clrMux__sel)
  );

  //Wire declarations for instance 'enMux' (Module coreir_mux)
  wire [0:0] enMux__in0;
  wire [0:0] enMux__in1;
  wire [0:0] enMux__out;
  wire  enMux__sel;
  coreir_mux #(.width(1)) enMux(
    .in0(enMux__in0),
    .in1(enMux__in1),
    .out(enMux__out),
    .sel(enMux__sel)
  );

  //Wire declarations for instance 'reg0' (Module coreir_reg)
  wire  reg0__clk;
  wire [0:0] reg0__in;
  wire [0:0] reg0__out;
  coreir_reg #(.clk_posedge(1),.init(init),.width(1)) reg0(
    .clk(reg0__clk),
    .in(reg0__in),
    .out(reg0__out)
  );

  //All the connections
  assign reg0__in[0:0] = enMux__out[0:0];
  assign out[0:0] = reg0__out[0:0];
  assign enMux__in0[0:0] = reg0__out[0:0];
  assign reg0__clk = clk;
  assign enMux__sel = en;
  assign enMux__in1[0:0] = clrMux__out[0:0];
  assign clrMux__in1[0:0] = c0__out[0:0];
  assign clrMux__sel = clr;
  assign clrMux__in0[0:0] = in[0:0];

endmodule //reg_U12

module renamedForReduce_opAdd8_I0_In_Bits_8___I1_In_Bits_8___O_Out_Bits_8___ (
  input [7:0] in0,
  input [7:0] in1,
  output [7:0] out
);
  //Wire declarations for instance 'inst0' (Module Add8)
  wire [7:0] inst0__I0;
  wire [7:0] inst0__I1;
  wire [7:0] inst0__O;
  Add8 inst0(
    .I0(inst0__I0),
    .I1(inst0__I1),
    .O(inst0__O)
  );

  //All the connections
  assign inst0__I0[7:0] = in0[7:0];
  assign inst0__I1[7:0] = in1[7:0];
  assign out[7:0] = inst0__O[7:0];

endmodule //renamedForReduce_opAdd8_I0_In_Bits_8___I1_In_Bits_8___O_Out_Bits_8___

module reduceParallelPower2Inputs_U2 (
  input [7:0] in_0,
  input [7:0] in_1,
  input [7:0] in_2,
  input [7:0] in_3,
  output [7:0] out
);
  //Wire declarations for instance 'op_0_0' (Module renamedForReduce_opAdd8_I0_In_Bits_8___I1_In_Bits_8___O_Out_Bits_8___)
  wire [7:0] op_0_0__in0;
  wire [7:0] op_0_0__in1;
  wire [7:0] op_0_0__out;
  renamedForReduce_opAdd8_I0_In_Bits_8___I1_In_Bits_8___O_Out_Bits_8___ op_0_0(
    .in0(op_0_0__in0),
    .in1(op_0_0__in1),
    .out(op_0_0__out)
  );

  //Wire declarations for instance 'op_1_0' (Module renamedForReduce_opAdd8_I0_In_Bits_8___I1_In_Bits_8___O_Out_Bits_8___)
  wire [7:0] op_1_0__in0;
  wire [7:0] op_1_0__in1;
  wire [7:0] op_1_0__out;
  renamedForReduce_opAdd8_I0_In_Bits_8___I1_In_Bits_8___O_Out_Bits_8___ op_1_0(
    .in0(op_1_0__in0),
    .in1(op_1_0__in1),
    .out(op_1_0__out)
  );

  //Wire declarations for instance 'op_1_1' (Module renamedForReduce_opAdd8_I0_In_Bits_8___I1_In_Bits_8___O_Out_Bits_8___)
  wire [7:0] op_1_1__in0;
  wire [7:0] op_1_1__in1;
  wire [7:0] op_1_1__out;
  renamedForReduce_opAdd8_I0_In_Bits_8___I1_In_Bits_8___O_Out_Bits_8___ op_1_1(
    .in0(op_1_1__in0),
    .in1(op_1_1__in1),
    .out(op_1_1__out)
  );

  //All the connections
  assign op_1_0__in1[7:0] = in_1[7:0];
  assign out[7:0] = op_0_0__out[7:0];
  assign op_1_0__in0[7:0] = in_0[7:0];
  assign op_0_0__in0[7:0] = op_1_0__out[7:0];
  assign op_1_1__in0[7:0] = in_2[7:0];
  assign op_1_1__in1[7:0] = in_3[7:0];
  assign op_0_0__in1[7:0] = op_1_1__out[7:0];

endmodule //reduceParallelPower2Inputs_U2

module reduceParallel_U1 (
  input [7:0] in_data_0,
  input [7:0] in_data_1,
  input [7:0] in_data_2,
  input [7:0] in_data_3,
  input [7:0] in_identity,
  output [7:0] out
);
  //Wire declarations for instance 'reducer' (Module reduceParallelPower2Inputs_U2)
  wire [7:0] reducer__in_0;
  wire [7:0] reducer__in_1;
  wire [7:0] reducer__in_2;
  wire [7:0] reducer__in_3;
  wire [7:0] reducer__out;
  reduceParallelPower2Inputs_U2 reducer(
    .in_0(reducer__in_0),
    .in_1(reducer__in_1),
    .in_2(reducer__in_2),
    .in_3(reducer__in_3),
    .out(reducer__out)
  );

  //All the connections
  assign out[7:0] = reducer__out[7:0];
  assign reducer__in_1[7:0] = in_data_1[7:0];
  assign reducer__in_0[7:0] = in_data_0[7:0];
  assign reducer__in_2[7:0] = in_data_2[7:0];
  assign reducer__in_3[7:0] = in_data_3[7:0];

endmodule //reduceParallel_U1

module reg_U19 #(parameter init=1) (
  input  clk,
  input  clr,
  input  en,
  input [7:0] in,
  output [7:0] out
);
  //Wire declarations for instance 'c0' (Module coreir_const)
  wire [7:0] c0__out;
  coreir_const #(.value(8'b00000000),.width(8)) c0(
    .out(c0__out)
  );

  //Wire declarations for instance 'clrMux' (Module coreir_mux)
  wire [7:0] clrMux__in0;
  wire [7:0] clrMux__in1;
  wire [7:0] clrMux__out;
  wire  clrMux__sel;
  coreir_mux #(.width(8)) clrMux(
    .in0(clrMux__in0),
    .in1(clrMux__in1),
    .out(clrMux__out),
    .sel(clrMux__sel)
  );

  //Wire declarations for instance 'enMux' (Module coreir_mux)
  wire [7:0] enMux__in0;
  wire [7:0] enMux__in1;
  wire [7:0] enMux__out;
  wire  enMux__sel;
  coreir_mux #(.width(8)) enMux(
    .in0(enMux__in0),
    .in1(enMux__in1),
    .out(enMux__out),
    .sel(enMux__sel)
  );

  //Wire declarations for instance 'reg0' (Module coreir_reg)
  wire  reg0__clk;
  wire [7:0] reg0__in;
  wire [7:0] reg0__out;
  coreir_reg #(.clk_posedge(1),.init(init),.width(8)) reg0(
    .clk(reg0__clk),
    .in(reg0__in),
    .out(reg0__out)
  );

  //All the connections
  assign reg0__in[7:0] = enMux__out[7:0];
  assign out[7:0] = reg0__out[7:0];
  assign enMux__in0[7:0] = reg0__out[7:0];
  assign reg0__clk = clk;
  assign enMux__sel = en;
  assign enMux__in1[7:0] = clrMux__out[7:0];
  assign clrMux__in1[7:0] = c0__out[7:0];
  assign clrMux__sel = clr;
  assign clrMux__in0[7:0] = in[7:0];

endmodule //reg_U19

module counter_U7 (
  input  clk,
  input  en,
  output [7:0] out,
  output  overflow,
  input  reset
);
  //Wire declarations for instance 'add' (Module coreir_add)
  wire [7:0] add__in0;
  wire [7:0] add__in1;
  wire [7:0] add__out;
  coreir_add #(.width(8)) add(
    .in0(add__in0),
    .in1(add__in1),
    .out(add__out)
  );

  //Wire declarations for instance 'count' (Module reg_U19)
  wire  count__clk;
  wire  count__clr;
  wire  count__en;
  wire [7:0] count__in;
  wire [7:0] count__out;
  reg_U19 #(.init(8'b00000000)) count(
    .clk(count__clk),
    .clr(count__clr),
    .en(count__en),
    .in(count__in),
    .out(count__out)
  );

  //Wire declarations for instance 'inc' (Module coreir_const)
  wire [7:0] inc__out;
  coreir_const #(.value(8'b00000001),.width(8)) inc(
    .out(inc__out)
  );

  //Wire declarations for instance 'max' (Module coreir_const)
  wire [7:0] max__out;
  coreir_const #(.value(8'b00001111),.width(8)) max(
    .out(max__out)
  );

  //Wire declarations for instance 'resetOr' (Module coreir_or)
  wire [0:0] resetOr__in0;
  wire [0:0] resetOr__in1;
  wire [0:0] resetOr__out;
  coreir_or #(.width(1)) resetOr(
    .in0(resetOr__in0),
    .in1(resetOr__in1),
    .out(resetOr__out)
  );

  //Wire declarations for instance 'ult' (Module coreir_ult)
  wire [7:0] ult__in0;
  wire [7:0] ult__in1;
  wire  ult__out;
  coreir_ult #(.width(8)) ult(
    .in0(ult__in0),
    .in1(ult__in1),
    .out(ult__out)
  );

  //All the connections
  assign add__in0[7:0] = count__out[7:0];
  assign out[7:0] = count__out[7:0];
  assign add__in1[7:0] = inc__out[7:0];
  assign count__en = en;
  assign count__in[7:0] = add__out[7:0];
  assign ult__in1[7:0] = add__out[7:0];
  assign ult__in0[7:0] = max__out[7:0];
  assign resetOr__in0[0] = ult__out;
  assign overflow = ult__out;
  assign count__clr = resetOr__out[0];
  assign resetOr__in1[0] = reset;
  assign count__clk = clk;

endmodule //counter_U7

module reg_U24 #(parameter init=1) (
  input  clk,
  input  clr,
  input  en,
  input [3:0] in,
  output [3:0] out
);
  //Wire declarations for instance 'c0' (Module coreir_const)
  wire [3:0] c0__out;
  coreir_const #(.value(4'b0000),.width(4)) c0(
    .out(c0__out)
  );

  //Wire declarations for instance 'clrMux' (Module coreir_mux)
  wire [3:0] clrMux__in0;
  wire [3:0] clrMux__in1;
  wire [3:0] clrMux__out;
  wire  clrMux__sel;
  coreir_mux #(.width(4)) clrMux(
    .in0(clrMux__in0),
    .in1(clrMux__in1),
    .out(clrMux__out),
    .sel(clrMux__sel)
  );

  //Wire declarations for instance 'enMux' (Module coreir_mux)
  wire [3:0] enMux__in0;
  wire [3:0] enMux__in1;
  wire [3:0] enMux__out;
  wire  enMux__sel;
  coreir_mux #(.width(4)) enMux(
    .in0(enMux__in0),
    .in1(enMux__in1),
    .out(enMux__out),
    .sel(enMux__sel)
  );

  //Wire declarations for instance 'reg0' (Module coreir_reg)
  wire  reg0__clk;
  wire [3:0] reg0__in;
  wire [3:0] reg0__out;
  coreir_reg #(.clk_posedge(1),.init(init),.width(4)) reg0(
    .clk(reg0__clk),
    .in(reg0__in),
    .out(reg0__out)
  );

  //All the connections
  assign reg0__in[3:0] = enMux__out[3:0];
  assign out[3:0] = reg0__out[3:0];
  assign enMux__in0[3:0] = reg0__out[3:0];
  assign reg0__clk = clk;
  assign enMux__sel = en;
  assign enMux__in1[3:0] = clrMux__out[3:0];
  assign clrMux__in1[3:0] = c0__out[3:0];
  assign clrMux__sel = clr;
  assign clrMux__in0[3:0] = in[3:0];

endmodule //reg_U24

module counter_U10 #(parameter init=1, parameter max=1) (
  input  clk,
  input  en,
  output [3:0] out,
  input  srst
);
  //Wire declarations for instance 'add' (Module coreir_add)
  wire [3:0] add__in0;
  wire [3:0] add__in1;
  wire [3:0] add__out;
  coreir_add #(.width(4)) add(
    .in0(add__in0),
    .in1(add__in1),
    .out(add__out)
  );

  //Wire declarations for instance 'c0' (Module coreir_const)
  wire [3:0] c0__out;
  coreir_const #(.value(4'b0000),.width(4)) c0(
    .out(c0__out)
  );

  //Wire declarations for instance 'c1' (Module coreir_const)
  wire [3:0] c1__out;
  coreir_const #(.value(4'b0001),.width(4)) c1(
    .out(c1__out)
  );

  //Wire declarations for instance 'eq' (Module coreir_eq)
  wire [3:0] eq__in0;
  wire [3:0] eq__in1;
  wire  eq__out;
  coreir_eq #(.width(4)) eq(
    .in0(eq__in0),
    .in1(eq__in1),
    .out(eq__out)
  );

  //Wire declarations for instance 'maxval' (Module coreir_const)
  wire [3:0] maxval__out;
  coreir_const #(.value(max),.width(4)) maxval(
    .out(maxval__out)
  );

  //Wire declarations for instance 'mux' (Module coreir_mux)
  wire [3:0] mux__in0;
  wire [3:0] mux__in1;
  wire [3:0] mux__out;
  wire  mux__sel;
  coreir_mux #(.width(4)) mux(
    .in0(mux__in0),
    .in1(mux__in1),
    .out(mux__out),
    .sel(mux__sel)
  );

  //Wire declarations for instance 'r' (Module reg_U24)
  wire  r__clk;
  wire  r__clr;
  wire  r__en;
  wire [3:0] r__in;
  wire [3:0] r__out;
  reg_U24 #(.init(init)) r(
    .clk(r__clk),
    .clr(r__clr),
    .en(r__en),
    .in(r__in),
    .out(r__out)
  );

  //All the connections
  assign r__clk = clk;
  assign r__en = en;
  assign r__clr = srst;
  assign add__in1[3:0] = c1__out[3:0];
  assign add__in0[3:0] = r__out[3:0];
  assign out[3:0] = r__out[3:0];
  assign eq__in0[3:0] = r__out[3:0];
  assign mux__sel = eq__out;
  assign eq__in1[3:0] = maxval__out[3:0];
  assign mux__in0[3:0] = add__out[3:0];
  assign mux__in1[3:0] = c0__out[3:0];
  assign r__in[3:0] = mux__out[3:0];

endmodule //counter_U10

module rowbuffer_U4 (
  input  clk,
  input  flush,
  output [7:0] rdata,
  output  valid,
  input [7:0] wdata,
  input  wen
);
  //Wire declarations for instance 'add_wen' (Module coreir_add)
  wire [4:0] add_wen__in0;
  wire [4:0] add_wen__in1;
  wire [4:0] add_wen__out;
  coreir_add #(.width(5)) add_wen(
    .in0(add_wen__in0),
    .in1(add_wen__in1),
    .out(add_wen__out)
  );

  //Wire declarations for instance 'c1' (Module corebit_const)
  wire  c1__out;
  corebit_const #(.value(1)) c1(
    .out(c1__out)
  );

  //Wire declarations for instance 'cnt' (Module reg_U11)
  wire  cnt__clk;
  wire  cnt__clr;
  wire  cnt__en;
  wire [4:0] cnt__in;
  wire [4:0] cnt__out;
  reg_U11 #(.init(5'b00000)) cnt(
    .clk(cnt__clk),
    .clr(cnt__clr),
    .en(cnt__en),
    .in(cnt__in),
    .out(cnt__out)
  );

  //Wire declarations for instance 'depth_m1' (Module coreir_const)
  wire [4:0] depth_m1__out;
  coreir_const #(.value(5'b10000),.width(5)) depth_m1(
    .out(depth_m1__out)
  );

  //Wire declarations for instance 'eq_depth' (Module coreir_eq)
  wire [4:0] eq_depth__in0;
  wire [4:0] eq_depth__in1;
  wire  eq_depth__out;
  coreir_eq #(.width(5)) eq_depth(
    .in0(eq_depth__in0),
    .in1(eq_depth__in1),
    .out(eq_depth__out)
  );

  //Wire declarations for instance 'mem' (Module coreir_mem)
  wire  mem__clk;
  wire [3:0] mem__raddr;
  wire [7:0] mem__rdata;
  wire [3:0] mem__waddr;
  wire [7:0] mem__wdata;
  wire  mem__wen;
  coreir_mem #(.depth(16),.has_init(0),.width(8)) mem(
    .clk(mem__clk),
    .raddr(mem__raddr),
    .rdata(mem__rdata),
    .waddr(mem__waddr),
    .wdata(mem__wdata),
    .wen(mem__wen)
  );

  //Wire declarations for instance 'out_and_wen' (Module corebit_and)
  wire  out_and_wen__in0;
  wire  out_and_wen__in1;
  wire  out_and_wen__out;
  corebit_and out_and_wen(
    .in0(out_and_wen__in0),
    .in1(out_and_wen__in1),
    .out(out_and_wen__out)
  );

  //Wire declarations for instance 'raddr' (Module counter_U10)
  wire  raddr__clk;
  wire  raddr__en;
  wire [3:0] raddr__out;
  wire  raddr__srst;
  counter_U10 #(.init(4'b0000),.max(4'b1111)) raddr(
    .clk(raddr__clk),
    .en(raddr__en),
    .out(raddr__out),
    .srst(raddr__srst)
  );

  //Wire declarations for instance 'state' (Module reg_U12)
  wire  state__clk;
  wire  state__clr;
  wire  state__en;
  wire [0:0] state__in;
  wire [0:0] state__out;
  reg_U12 #(.init(1'b0)) state(
    .clk(state__clk),
    .clr(state__clr),
    .en(state__en),
    .in(state__in),
    .out(state__out)
  );

  //Wire declarations for instance 'state0' (Module corebit_not)
  wire  state0__in;
  wire  state0__out;
  corebit_not state0(
    .in(state0__in),
    .out(state0__out)
  );

  //Wire declarations for instance 'waddr' (Module counter_U10)
  wire  waddr__clk;
  wire  waddr__en;
  wire [3:0] waddr__out;
  wire  waddr__srst;
  counter_U10 #(.init(4'b0000),.max(4'b1111)) waddr(
    .clk(waddr__clk),
    .en(waddr__en),
    .out(waddr__out),
    .srst(waddr__srst)
  );

  //Wire declarations for instance 'wen_ext' (Module coreir_zext)
  wire [0:0] wen_ext__in;
  wire [4:0] wen_ext__out;
  coreir_zext #(.width_in(1),.width_out(5)) wen_ext(
    .in(wen_ext__in),
    .out(wen_ext__out)
  );

  //All the connections
  assign cnt__clk = clk;
  assign mem__clk = clk;
  assign raddr__clk = clk;
  assign waddr__clk = clk;
  assign state__clk = clk;
  assign mem__raddr[3:0] = raddr__out[3:0];
  assign mem__waddr[3:0] = waddr__out[3:0];
  assign rdata[7:0] = mem__rdata[7:0];
  assign mem__wdata[7:0] = wdata[7:0];
  assign mem__wen = wen;
  assign valid = out_and_wen__out;
  assign raddr__en = out_and_wen__out;
  assign out_and_wen__in1 = wen;
  assign waddr__en = wen;
  assign wen_ext__in[0] = wen;
  assign out_and_wen__in0 = state__out[0];
  assign state0__in = state__out[0];
  assign raddr__srst = flush;
  assign waddr__srst = flush;
  assign cnt__clr = flush;
  assign state__clr = flush;
  assign cnt__en = state0__out;
  assign add_wen__in0[4:0] = wen_ext__out[4:0];
  assign add_wen__in1[4:0] = cnt__out[4:0];
  assign cnt__in[4:0] = add_wen__out[4:0];
  assign eq_depth__in1[4:0] = add_wen__out[4:0];
  assign eq_depth__in0[4:0] = depth_m1__out[4:0];
  assign state__en = eq_depth__out;
  assign state__in[0] = c1__out;

endmodule //rowbuffer_U4

module linebuffer_U0 (
  input  clk,
  input [7:0] in_0_0,
  output [7:0] out_0_0,
  output [7:0] out_0_1,
  output [7:0] out_1_0,
  output [7:0] out_1_1,
  output  valid,
  output  valid_chain,
  input  wen
);
  //Wire declarations for instance 'const_stencil0' (Module coreir_const)
  wire [7:0] const_stencil0__out;
  coreir_const #(.value(8'b00000001),.width(8)) const_stencil0(
    .out(const_stencil0__out)
  );

  //Wire declarations for instance 'const_stencil1' (Module coreir_const)
  wire [7:0] const_stencil1__out;
  coreir_const #(.value(8'b00000001),.width(8)) const_stencil1(
    .out(const_stencil1__out)
  );

  //Wire declarations for instance 'lb1d_0' (Module linebuffer_U3)
  wire  lb1d_0__clk;
  wire [7:0] lb1d_0__in_0;
  wire [7:0] lb1d_0__out_0;
  wire [7:0] lb1d_0__out_1;
  wire  lb1d_0__valid;
  wire  lb1d_0__valid_chain;
  wire  lb1d_0__wen;
  linebuffer_U3 lb1d_0(
    .clk(lb1d_0__clk),
    .in_0(lb1d_0__in_0),
    .out_0(lb1d_0__out_0),
    .out_1(lb1d_0__out_1),
    .valid(lb1d_0__valid),
    .valid_chain(lb1d_0__valid_chain),
    .wen(lb1d_0__wen)
  );

  //Wire declarations for instance 'lb1d_1' (Module linebuffer_U3)
  wire  lb1d_1__clk;
  wire [7:0] lb1d_1__in_0;
  wire [7:0] lb1d_1__out_0;
  wire [7:0] lb1d_1__out_1;
  wire  lb1d_1__valid;
  wire  lb1d_1__valid_chain;
  wire  lb1d_1__wen;
  linebuffer_U3 lb1d_1(
    .clk(lb1d_1__clk),
    .in_0(lb1d_1__in_0),
    .out_0(lb1d_1__out_0),
    .out_1(lb1d_1__out_1),
    .valid(lb1d_1__valid),
    .valid_chain(lb1d_1__valid_chain),
    .wen(lb1d_1__wen)
  );

  //Wire declarations for instance 'lbmem_1_0' (Module rowbuffer_U4)
  wire  lbmem_1_0__clk;
  wire  lbmem_1_0__flush;
  wire [7:0] lbmem_1_0__rdata;
  wire  lbmem_1_0__valid;
  wire [7:0] lbmem_1_0__wdata;
  wire  lbmem_1_0__wen;
  rowbuffer_U4 lbmem_1_0(
    .clk(lbmem_1_0__clk),
    .flush(lbmem_1_0__flush),
    .rdata(lbmem_1_0__rdata),
    .valid(lbmem_1_0__valid),
    .wdata(lbmem_1_0__wdata),
    .wen(lbmem_1_0__wen)
  );

  //Wire declarations for instance 'lbmem_1_0_flush' (Module corebit_const)
  wire  lbmem_1_0_flush__out;
  corebit_const #(.value(0)) lbmem_1_0_flush(
    .out(lbmem_1_0_flush__out)
  );

  //Wire declarations for instance 'valcompare_0' (Module coreir_ule)
  wire [7:0] valcompare_0__in0;
  wire [7:0] valcompare_0__in1;
  wire  valcompare_0__out;
  coreir_ule #(.width(8)) valcompare_0(
    .in0(valcompare_0__in0),
    .in1(valcompare_0__in1),
    .out(valcompare_0__out)
  );

  //Wire declarations for instance 'valcompare_1' (Module coreir_ule)
  wire [7:0] valcompare_1__in0;
  wire [7:0] valcompare_1__in1;
  wire  valcompare_1__out;
  coreir_ule #(.width(8)) valcompare_1(
    .in0(valcompare_1__in0),
    .in1(valcompare_1__in1),
    .out(valcompare_1__out)
  );

  //Wire declarations for instance 'valcounter_0' (Module counter_U7)
  wire  valcounter_0__clk;
  wire  valcounter_0__en;
  wire [7:0] valcounter_0__out;
  wire  valcounter_0__overflow;
  wire  valcounter_0__reset;
  counter_U7 valcounter_0(
    .clk(valcounter_0__clk),
    .en(valcounter_0__en),
    .out(valcounter_0__out),
    .overflow(valcounter_0__overflow),
    .reset(valcounter_0__reset)
  );

  //Wire declarations for instance 'valcounter_0_reset' (Module corebit_const)
  wire  valcounter_0_reset__out;
  corebit_const #(.value(0)) valcounter_0_reset(
    .out(valcounter_0_reset__out)
  );

  //Wire declarations for instance 'valcounter_1' (Module counter_U7)
  wire  valcounter_1__clk;
  wire  valcounter_1__en;
  wire [7:0] valcounter_1__out;
  wire  valcounter_1__overflow;
  wire  valcounter_1__reset;
  counter_U7 valcounter_1(
    .clk(valcounter_1__clk),
    .en(valcounter_1__en),
    .out(valcounter_1__out),
    .overflow(valcounter_1__overflow),
    .reset(valcounter_1__reset)
  );

  //Wire declarations for instance 'valcounter_1_reset' (Module corebit_const)
  wire  valcounter_1_reset__out;
  corebit_const #(.value(0)) valcounter_1_reset(
    .out(valcounter_1_reset__out)
  );

  //Wire declarations for instance 'valid_andr' (Module bitopn_U8)
  wire [2:0] valid_andr__in;
  wire  valid_andr__out;
  bitopn_U8 valid_andr(
    .in(valid_andr__in),
    .out(valid_andr__out)
  );

  //All the connections
  assign lb1d_1__in_0[7:0] = lbmem_1_0__rdata[7:0];
  assign valcounter_1__reset = valcounter_1_reset__out;
  assign valcompare_0__in0[7:0] = const_stencil0__out[7:0];
  assign lbmem_1_0__flush = lbmem_1_0_flush__out;
  assign lbmem_1_0__wen = wen;
  assign valid_chain = lbmem_1_0__valid;
  assign valcounter_1__en = valcounter_0__overflow;
  assign valcounter_0__reset = valcounter_0_reset__out;
  assign lbmem_1_0__wdata[7:0] = in_0_0[7:0];
  assign valcompare_0__in1[7:0] = valcounter_0__out[7:0];
  assign valcounter_0__en = wen;
  assign valid_andr__in[0] = wen;
  assign lb1d_0__wen = wen;
  assign lb1d_1__wen = wen;
  assign valid = valid_andr__out;
  assign valcompare_1__in0[7:0] = const_stencil1__out[7:0];
  assign valcompare_1__in1[7:0] = valcounter_1__out[7:0];
  assign valid_andr__in[1] = valcompare_0__out;
  assign valid_andr__in[2] = valcompare_1__out;
  assign lb1d_0__clk = clk;
  assign lb1d_1__clk = clk;
  assign lbmem_1_0__clk = clk;
  assign valcounter_0__clk = clk;
  assign valcounter_1__clk = clk;
  assign out_1_0[7:0] = lb1d_0__out_0[7:0];
  assign out_1_1[7:0] = lb1d_0__out_1[7:0];
  assign lb1d_0__in_0[7:0] = in_0_0[7:0];
  assign out_0_1[7:0] = lb1d_1__out_1[7:0];
  assign out_0_0[7:0] = lb1d_1__out_0[7:0];

endmodule //linebuffer_U0

module STEN (
  input  CE,
  input  CLK,
  output  CLKOut,
  input [7:0] I_0_0,
  output [7:0] O,
  output  V
);
  //Wire declarations for instance 'bit_const_VCC' (Module corebit_const)
  wire  bit_const_VCC__out;
  corebit_const #(.value(1)) bit_const_VCC(
    .out(bit_const_VCC__out)
  );

  //Wire declarations for instance 'inst0' (Module linebuffer_U0)
  wire  inst0__clk;
  wire [7:0] inst0__in_0_0;
  wire [7:0] inst0__out_0_0;
  wire [7:0] inst0__out_0_1;
  wire [7:0] inst0__out_1_0;
  wire [7:0] inst0__out_1_1;
  wire  inst0__valid;
  wire  inst0__valid_chain;
  wire  inst0__wen;
  linebuffer_U0 inst0(
    .clk(inst0__clk),
    .in_0_0(inst0__in_0_0),
    .out_0_0(inst0__out_0_0),
    .out_0_1(inst0__out_0_1),
    .out_1_0(inst0__out_1_0),
    .out_1_1(inst0__out_1_1),
    .valid(inst0__valid),
    .valid_chain(inst0__valid_chain),
    .wen(inst0__wen)
  );

  //Wire declarations for instance 'inst1' (Module reduceParallel_U1)
  wire [7:0] inst1__in_data_0;
  wire [7:0] inst1__in_data_1;
  wire [7:0] inst1__in_data_2;
  wire [7:0] inst1__in_data_3;
  wire [7:0] inst1__in_identity;
  wire [7:0] inst1__out;
  reduceParallel_U1 inst1(
    .in_data_0(inst1__in_data_0),
    .in_data_1(inst1__in_data_1),
    .in_data_2(inst1__in_data_2),
    .in_data_3(inst1__in_data_3),
    .in_identity(inst1__in_identity),
    .out(inst1__out)
  );

  //Wire declarations for instance 'inst2' (Module coreir_const80)
  wire [7:0] inst2__out;
  coreir_const80 inst2(
    .out(inst2__out)
  );

  //All the connections
  assign inst1__in_data_2[7:0] = inst0__out_1_0[7:0];
  assign inst0__wen = bit_const_VCC__out;
  assign inst1__in_data_3[7:0] = inst0__out_1_1[7:0];
  assign V = inst0__valid;
  assign inst1__in_identity[7:0] = inst2__out[7:0];
  assign O[7:0] = inst1__out[7:0];
  assign CLKOut = CLK;
  assign inst0__clk = CLK;
  assign inst1__in_data_0[7:0] = inst0__out_0_0[7:0];
  assign inst1__in_data_1[7:0] = inst0__out_0_1[7:0];
  assign inst0__in_0_0[7:0] = I_0_0[7:0];

endmodule //STEN
