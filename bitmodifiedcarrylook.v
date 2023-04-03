
module bitmodifiedcarrylook(a,b,sum,cout);
    input [31:0]a;
    input [31:0]b;
    output [31:0]sum;
    output cout;
    wire [9:0]c1;
	wire [9:0]c0;
	wire cin;
	wire [8:0]c;
	wire [31:0]sum0;
	wire [31:0]sum1;
    carrylook0 ra0(a[1:0],b[1:0],sum[1:0],cin);
    carrylook0 ra1(a[3:2],b[3:2],sum0[3:2],c0[0]);
    bec0 ra2(sum0[3:2],c0[0],sum1[3:2],c1[0]);
    assign sum[3:2] = cin?sum1[3:2]:sum0[3:2];
    assign c[0] = cin?c1[0]:c0[0];
    carrylook1 ra3(a[6:4],b[6:4],sum0[6:4],c0[1]);
    bec1 ra4(sum0[6:4],c0[1],sum1[6:4],c1[1]);
    assign sum[6:4] = c[0]?sum1[6:4]:sum0[6:4];
    assign c[1] = c[0]?c1[1]:c0[1];
    carrylook2 ra5(a[10:7],b[10:7],sum0[10:7],c0[2]);
    bec2 ra6(sum0[10:7],c0[2],sum1[10:7],c1[2]);
    assign sum[10:7] = c[1]?sum1[10:7]:sum0[10:7];
    assign c[2] = c[1]?c1[2]:c0[2];
    carrylook2 ra7(a[14:11],b[14:11],sum0[14:11],c0[3]);
    bec2 ra8(sum0[14:11],c0[3],sum1[14:11],c1[3]);
    assign sum[14:11] = c[2]?sum1[14:11]:sum0[14:11];
    assign c[3] = c[2]?c1[3]:c0[3];
    carrylook2 ra9(a[18:15],b[18:15],sum0[18:15],c0[4]);
    bec2 ra10(sum0[18:15],c0[4],sum1[18:15],c1[4]);
    assign sum[18:15] = c[3]?sum1[18:15]:sum0[18:15];
    assign c[4] = c[3]?c1[4]:c0[4];
    carrylook2 ra13(a[22:19],b[22:19],sum0[22:19],c0[5]);
    bec2 ra14(sum0[22:19],c0[5],sum1[22:19],c1[5]);
    assign sum[22:19] = c[4]?sum1[22:19]:sum0[22:19];
    assign c[5] = c[4]?c1[5]:c0[5];
    carrylook2 ra17(a[26:23],b[26:23],sum0[26:23],c0[6]);
    bec2 ra18(sum0[26:23],c0[6],sum1[26:23],c1[6]);
    assign sum[26:23] = c[5]?sum1[26:23]:sum0[26:23];
    assign c[6] = c[5]?c1[7]:c0[7];
    carrylook1 ra19(a[29:27],b[29:27],sum0[29:27],c0[7]);
    bec1 ra20(sum0[29:27],c0[7],sum1[29:27],c1[7]);
    assign sum[29:27] = c[6]?sum1[29:27]:sum0[29:27];
    assign c[7] = c[6]?c1[7]:c0[7];
    carrylook0 ra21(a[31:30],b[31:30],sum0[31:30],c0[8]);
    bec0 ra22(sum0[31:30],c0[8],sum1[31:30],c1[8]);
    assign sum[31:30] = c[7]?sum1[31:30]:sum0[31:30];
    assign cout = c[7]?c1[8]:c0[8];
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


module carrylook2(in0, in1, out, cout);
	input [3:0] in0;
	input [3:0] in1;
	output [3:0] out;
	output cout;
    wire [3:0]G;
    wire [3:0]P;
    wire [3:0]C;
    assign G = in0 & in1; //Generate
    assign P = in0 ^ in1; //Propagate
    assign C[0] = 1'b0;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
    assign cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) |(P[3] & P[2] & P[1] & P[0] & C[0]);
    assign out = P ^ C;
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


module carrylook1(in0, in1, out, cout);
	input [2:0] in0;
	input [2:0] in1;
	output [2:0] out;
	output cout;
    wire [2:0]G;
    wire [2:0]P;
    wire [2:0]C;
    assign G = in0 & in1; //Generate
    assign P = in0 ^ in1; //Propagate
    assign C[0] = 1'b0;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
    assign cout = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
    assign out = P ^ C;
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

module carrylook0(in0, in1, out, cout);
	input [1:0] in0;
	input [1:0] in1;
	output [1:0] out;
	output cout;
    wire [1:0]G;
    wire [1:0]P;
    wire [1:0]C;
    assign G = in0 & in1; //Generate
    assign P = in0 ^ in1; //Propagate
    assign C[0] = 1'b0;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign cout = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
    assign out = P ^ C;
endmodule