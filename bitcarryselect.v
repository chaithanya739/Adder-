
module bitcarryselect(a,b,sum,cout);
    input [31:0]a;
    input [31:0]b;
    output [31:0]sum;
    output cout;
    wire [6:0]c1;
	wire [6:0]c0;
	wire cin;
	wire [5:0]c;
	wire [31:0]sum0;
	wire [31:0]sum1;
    ripple_carry_adder0 ra0(a[1:0],b[1:0],sum[1:0],cin);
    ripple_carry_adder0 ra1(a[3:2],b[3:2],sum0[3:2],c0[0]);
    ripple_carry_adder1 ra2(a[3:2],b[3:2],sum1[3:2],c1[0]);
    assign sum[3:2] = cin?sum1[3:2]:sum0[3:2];
    assign c[0] = cin?c1[0]:c0[0];
    ripple_carry_adder10 ra3(a[6:4],b[6:4],sum0[6:4],c0[1]);
    ripple_carry_adder11 ra4(a[6:4],b[6:4],sum1[6:4],c1[1]);
    assign sum[6:4] = c[0]?sum1[6:4]:sum0[6:4];
    assign c[1] = c[0]?c1[1]:c0[1];
    ripple_carry_adder20 ra5(a[10:7],b[10:7],sum0[10:7],c0[2]);
    ripple_carry_adder21 ra6(a[10:7],b[10:7],sum1[10:7],c1[2]);
    assign sum[10:7] = c[1]?sum1[10:7]:sum0[10:7];
    assign c[2] = c[1]?c1[2]:c0[2];
    ripple_carry_adder30 ra7(a[15:11],b[15:11],sum0[15:11],c0[3]);
    ripple_carry_adder31 ra8(a[15:11],b[15:11],sum1[15:11],c1[3]);
    assign sum[15:11] = c[2]?sum1[15:11]:sum0[15:11];
    assign c[3] = c[2]?c1[3]:c0[3];
    ripple_carry_adder40 ra9(a[21:16],b[21:16],sum0[21:16],c0[4]);
    ripple_carry_adder41 ra10(a[21:16],b[21:16],sum1[21:16],c1[4]);
    assign sum[21:16] = c[3]?sum1[21:16]:sum0[21:16];
    assign c[4] = c[3]?c1[4]:c0[4];
    ripple_carry_adder50 ra11(a[28:22],b[28:22],sum0[28:22],c0[5]);
    ripple_carry_adder51 ra12(a[28:22],b[28:22],sum1[28:22],c1[5]);
    assign sum[28:22] = c[4]?sum1[28:22]:sum0[28:22];
    assign c[5] = c[4]?c1[5]:c0[5];
    ripple_carry_adder10 ra13(a[31:29],b[31:29],sum0[31:29],c0[6]);
    ripple_carry_adder11 ra14(a[31:29],b[31:29],sum1[31:29],c1[6]);
    assign sum[31:29] = c[5]?sum1[31:29]:sum0[31:29];
    assign cout = c[5]?c1[6]:c0[6];
endmodule


module ripple_carry_adder51(in0, in1, out, cout);
	input [6:0] in0;
	input [6:0] in1;
	output [6:0] out;
	output cout;

	wire c1,c2,c3,c4,c5,c6;
	full_adder fa0(in0[0], in1[0], 1'b1, out[0], c1);
	full_adder fa1(in0[1], in1[1], c1, out[1], c2);
    full_adder fa2(in0[2], in1[2], c2, out[2], c3);
    full_adder fa3(in0[3], in1[3], c3, out[3], c4);
    full_adder fa4(in0[4], in1[4], c4, out[4], c5);
	full_adder fa5(in0[5], in1[5], c5, out[5], c6);
	full_adder fa6(in0[6], in1[6], c6, out[6], cout);

endmodule


module ripple_carry_adder50(in0, in1, out, cout);
	input [6:0] in0;
	input [6:0] in1;
	output [6:0] out;
	output cout;

	wire c1,c2,c3,c4,c5,c6;
	full_adder fa0(in0[0], in1[0], 1'b0, out[0], c1);
	full_adder fa1(in0[1], in1[1], c1, out[1], c2);
    full_adder fa2(in0[2], in1[2], c2, out[2], c3);
    full_adder fa3(in0[3], in1[3], c3, out[3], c4);
    full_adder fa4(in0[4], in1[4], c4, out[4], c5);
	full_adder fa5(in0[5], in1[5], c5, out[5], c6);
	full_adder fa6(in0[6], in1[6], c6, out[6], cout);

endmodule


module ripple_carry_adder41(in0, in1, out, cout);
	input [5:0] in0;
	input [5:0] in1;
	output [5:0] out;
	output cout;

	wire c1,c2,c3,c4,c5;
	full_adder fa0(in0[0], in1[0], 1'b1, out[0], c1);
	full_adder fa1(in0[1], in1[1], c1, out[1], c2);
    full_adder fa2(in0[2], in1[2], c2, out[2], c3);
    full_adder fa3(in0[3], in1[3], c3, out[3], c4);
    full_adder fa4(in0[4], in1[4], c4, out[4], c5);
	full_adder fa5(in0[5], in1[5], c5, out[5], cout);

endmodule

module ripple_carry_adder40(in0, in1, out, cout);
	input [5:0] in0;
	input [5:0] in1;
	output [5:0] out;
	output cout;

	wire c1,c2,c3,c4,c5;
	full_adder fa0(in0[0], in1[0], 1'b0, out[0], c1);
	full_adder fa1(in0[1], in1[1], c1, out[1], c2);
    full_adder fa2(in0[2], in1[2], c2, out[2], c3);
    full_adder fa3(in0[3], in1[3], c3, out[3], c4);
    full_adder fa4(in0[4], in1[4], c4, out[4], c5);
	full_adder fa5(in0[5], in1[5], c5, out[5], cout);

endmodule

module ripple_carry_adder31(in0, in1, out, cout);
	input [4:0] in0;
	input [4:0] in1;
	output [4:0] out;
	output cout;

	wire c1,c2,c3,c4;
	full_adder fa0(in0[0], in1[0], 1'b1, out[0], c1);
	full_adder fa1(in0[1], in1[1], c1, out[1], c2);
    full_adder fa2(in0[2], in1[2], c2, out[2], c3);
    full_adder fa3(in0[3], in1[3], c3, out[3], c4);
    full_adder fa4(in0[4], in1[4], c4, out[4], cout);

endmodule

module ripple_carry_adder30(in0, in1, out, cout);
	input [4:0] in0;
	input [4:0] in1;
	output [4:0] out;
	output cout;

	wire c1,c2,c3,c4;
	full_adder fa0(in0[0], in1[0], 1'b0, out[0], c1);
	full_adder fa1(in0[1], in1[1], c1, out[1], c2);
    full_adder fa2(in0[2], in1[2], c2, out[2], c3);
    full_adder fa3(in0[3], in1[3], c3, out[3], c4);
    full_adder fa4(in0[4], in1[4], c4, out[4], cout);

endmodule

    

module ripple_carry_adder21(in0, in1, out, cout);
	input [3:0] in0;
	input [3:0] in1;
	output [3:0] out;
	output cout;

	wire c1,c2,c3;
	full_adder fa0(in0[0], in1[0], 1'b1, out[0], c1);
	full_adder fa1(in0[1], in1[1], c1, out[1], c2);
    full_adder fa2(in0[2], in1[2], c2, out[2], c3);
    full_adder fa3(in0[3], in1[3], c3, out[3], cout);

endmodule


module ripple_carry_adder20(in0, in1, out, cout);
	input [3:0] in0;
	input [3:0] in1;
	output [3:0] out;
	output cout;

	wire c1,c2,c3;
	full_adder fa0(in0[0], in1[0], 1'b0, out[0], c1);
	full_adder fa1(in0[1], in1[1], c1, out[1], c2);
    full_adder fa2(in0[2], in1[2], c2, out[2], c3);
    full_adder fa3(in0[3], in1[3], c3, out[3], cout);

endmodule

module ripple_carry_adder11(in0, in1, out, cout);
	input [2:0] in0;
	input [2:0] in1;
	output [2:0] out;
	output cout;

	wire c1,c2;
	full_adder fa0(in0[0], in1[0], 1'b1, out[0], c1);
	full_adder fa1(in0[1], in1[1], c1, out[1], c2);
    full_adder fa2(in0[2], in1[2], c2, out[2], cout);

endmodule

module ripple_carry_adder10(in0, in1, out, cout);
	input [2:0] in0;
	input [2:0] in1;
	output [2:0] out;
	output cout;

	wire c1,c2;
	full_adder fa0(in0[0], in1[0], 1'b0, out[0], c1);
	full_adder fa1(in0[1], in1[1], c1, out[1], c2);
    full_adder fa2(in0[2], in1[2], c2, out[2], cout);

endmodule

module ripple_carry_adder1(in0, in1, out, cout);
	input [1:0] in0;
	input [1:0] in1;
	output [1:0] out;
	output cout;

	wire c1;
	full_adder fa0(in0[0], in1[0], 1'b1, out[0], c1);
	full_adder fa1(in0[1], in1[1], c1, out[1], cout);

endmodule

module ripple_carry_adder0(in0, in1, out, cout);
	input [1:0] in0;
	input [1:0] in1;
	output [1:0] out;
	output cout;

	wire c1;
	full_adder fa0(in0[0], in1[0], 1'b0, out[0], c1);
	full_adder fa1(in0[1], in1[1], c1, out[1], cout);

endmodule

module full_adder(in0, in1, cin, out, cout);
	input in0, in1, cin;
	output out, cout;

	assign out = in0 ^ in1 ^ cin;
	assign cout = ((in0 ^ in1) & cin) | (in0 & in1);
endmodule