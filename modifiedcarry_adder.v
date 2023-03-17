module modifiedcarry_adder(a,b,sum,cout);
    input [15:0]a;
    input [15:0]b;
    output [15:0]sum;
    output cout;
    wire [15:0]sum0;
    wire [15:0]sum1;
    wire [3:0]c0;
    wire [3:0]c1;
    wire [2:0]c;
    wire cin;
    ripple_carry_adder0 ra0(a[1:0],b[1:0],sum[1:0],cin);
    ripple_carry_adder0 ra1(a[3:2],b[3:2],sum0[3:2],c0[0]);
    bec0 ra2(sum0[3:2],c0[0],sum1[3:2],c1[0]);
    assign sum[3:2] = cin?sum1[3:2]:sum0[3:2];
    assign c[0] = cin?c1[0]:c0[0];
    ripple_carry_adder10 ra3(a[6:4],b[6:4],sum0[6:4],c0[1]);
    bec1 ra4(sum0[6:4],c0[1],sum1[6:4],c1[1]);
    assign sum[6:4] = c[0]?sum1[6:4]:sum0[6:4];
    assign c[1] = c[0]?c1[1]:c0[1];
    ripple_carry_adder20 ra5(a[10:7],b[10:7],sum0[10:7],c0[2]);
    bec2 ra6(sum0[10:7],c0[2],sum1[10:7],c1[2]);
    assign sum[10:7] = c[1]?sum1[10:7]:sum0[10:7];
    assign c[2] = c[1]?c1[2]:c0[2];
    ripple_carry_adder30 ra7(a[15:11],b[15:11],sum0[15:11],c0[3]);
    bec3 ra8(sum0[15:11],c0[3],sum1[15:11],c1[3]);
    assign sum[15:11] = c[2]?sum1[15:11]:sum0[15:11];
    assign cout = c[2]?c1[3]:c0[3];

endmodule


module bec3(in,cin,sum,cout);
    input [4:0]in;
    input cin;
    output [4:0]sum;
    output cout;
    wire [5:0]in1;
    assign in1 ={cin,in[4:0]};
    assign sum[0] = ~in1[0];
    assign sum[1] = in1[0]^in1[1];
    assign sum[2] = in1[2]^(in1[0]&in1[1]);
    assign sum[3] = in1[3]^(in1[0]&in1[1]&in1[2]);
    assign sum[4] = in1[4]^(in1[0]&in1[1]&in1[2]&in1[3]);
    assign cout = in1[5]^(in1[0]&in1[1]&in1[2]&in1[3]&in1[4]);
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

module bec2(in,cin,sum,cout);
    input [3:0]in;
    input cin;
    output [3:0]sum;
    output cout;
    wire [4:0]in1;
    assign in1 ={cin,in[3:0]};
    assign sum[0] = ~in1[0];
    assign sum[1] = in1[0]^in1[1];
    assign sum[2] = in1[2]^(in1[0]&in1[1]);
    assign sum[3] = in1[3]^(in1[0]&in1[1]&in1[2]);
    assign cout = in1[4]^(in1[0]&in1[1]&in1[2]&in1[3]);
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

module bec1(in,cin,sum,cout);
    input [2:0]in;
    input cin;
    output [2:0]sum;
    output cout;
    wire [3:0]in1;
    assign in1 ={cin,in[2:0]};
    assign sum[0] = ~in1[0];
    assign sum[1] = in1[0]^in1[1];
    assign sum[2] = in1[2]^(in1[0]&in1[1]);
    assign cout = in1[3]^(in1[0]&in1[1]&in1[2]);
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

module bec0(in,cin,sum,cout);
    input [1:0]in;
    input cin;
    output [1:0]sum;
    output cout;
    wire [2:0]in1;
    assign in1 ={cin,in[1:0]};
    assign sum[0] = ~in1[0];
    assign sum[1] = in1[0]^in1[1];
    assign cout = in1[2]^(in1[0]&in1[1]);
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