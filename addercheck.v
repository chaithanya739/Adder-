
module addercheck(a,b,check,checkcout);
    input [31:0] a;
    input [31:0] b;
    output [31:0] check;
    output checkcout;
    wire [31:0] sum1;
    wire [31:0] sum2;
    wire cout1;
    wire cout2;
    BKadderwithcarryselect b1(a[31:0],b[31:0],sum1[31:0],cout1);
    bitcarryselect b2(a[31:0],b[31:0],sum2[31:0],cout2);
    assign check = sum1^sum2;
    assign checkcout = cout1^cout2;
endmodule 



module BKadderwithcarryselect(a,b,sum,cout);
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
    BKadder0 ra0(a[1:0],b[1:0],sum[1:0],cin);
    BKadder0 ra1(a[3:2],b[3:2],sum0[3:2],c0[0]);
    bec0 ra2(sum0[3:2],c0[0],sum1[3:2],c1[0]);
    mux m1(sum0[2],sum1[2],cin,sum[2]);
	mux m2(sum0[3],sum1[3],cin,sum[3]);
	mux m3(c0[0],c1[0],cin,c[0]);
    BKadder1 ra3(a[6:4],b[6:4],sum0[6:4],c0[1]);
    bec1 ra4(sum0[6:4],c0[1],sum1[6:4],c1[1]);
	mux m4(sum0[4],sum1[4],c[0],sum[4]);
	mux m5(sum0[5],sum1[5],c[0],sum[5]);
	mux m6(sum0[6],sum1[6],c[0],sum[6]);
	mux m7(c0[1],c1[1],c[0],c[1]);
    BKadder2 ra5(a[10:7],b[10:7],sum0[10:7],c0[2]);
    bec2 ra6(sum0[10:7],c0[2],sum1[10:7],c1[2]);
	mux m8(sum0[7],sum1[7],c[1],sum[7]);
	mux m9(sum0[8],sum1[8],c[1],sum[8]);
	mux m10(sum0[9],sum1[9],c[1],sum[9]);
	mux m11(sum0[10],sum1[10],c[1],sum[10]);
	mux m12(c0[2],c1[2],c[1],c[2]);
    BKadder3 ra7(a[15:11],b[15:11],sum0[15:11],c0[3]);
    bec3 ra8(sum0[15:11],c0[3],sum1[15:11],c1[3]);
	mux m13(sum0[11],sum1[11],c[2],sum[11]);
	mux m14(sum0[12],sum1[12],c[2],sum[12]);
	mux m15(sum0[13],sum1[13],c[2],sum[13]);
	mux m16(sum0[14],sum1[14],c[2],sum[14]);
	mux m17(sum0[15],sum1[15],c[2],sum[15]);
	mux m18(c0[3],c1[3],c[2],c[3]);
    BKadder4 ra9(a[21:16],b[21:16],sum0[21:16],c0[4]);
    bec4 ra10(sum0[21:16],c0[4],sum1[21:16],c1[4]);
	mux m19(sum0[16],sum1[16],c[3],sum[16]);
	mux m20(sum0[17],sum1[17],c[3],sum[17]);
	mux m21(sum0[18],sum1[18],c[3],sum[18]);
	mux m22(sum0[19],sum1[19],c[3],sum[19]);
	mux m23(sum0[20],sum1[20],c[3],sum[20]);
	mux m24(sum0[21],sum1[21],c[3],sum[21]);
	mux m25(c0[4],c1[4],c[3],c[4]);
    BKadder5 ra11(a[28:22],b[28:22],sum0[28:22],c0[5]);
    bec5 ra12(sum0[28:22],c0[5],sum1[28:22],c1[5]);
	mux m26(sum0[22],sum1[22],c[4],sum[22]);
	mux m27(sum0[23],sum1[23],c[4],sum[23]);
	mux m28(sum0[24],sum1[24],c[4],sum[24]);
	mux m29(sum0[25],sum1[25],c[4],sum[25]);
	mux m30(sum0[26],sum1[26],c[4],sum[26]);
	mux m31(sum0[27],sum1[27],c[4],sum[27]);
	mux m32(sum0[28],sum1[28],c[4],sum[28]);
	mux m33(c0[5],c1[5],c[4],c[5]);
    BKadder1 ra13(a[31:29],b[31:29],sum0[31:29],c0[6]);
    bec1 ra14(sum0[31:29],c0[6],sum1[31:29],c1[6]);
	mux m34(sum0[29],sum1[29],c[5],sum[29]);
	mux m35(sum0[30],sum1[30],c[5],sum[30]);
	mux m36(sum0[31],sum1[31],c[5],sum[31]);
	mux m37(c0[6],c1[6],c[5],cout);
endmodule

module BKadder5(a,b,sum,cout);
    input [6:0] a;
    input [6:0] b;
    output [6:0] sum;
    wire G10,G32,P32,G54,P54,G30,G20,G40,G50,G60;
    output cout;
    wire [6:0]G;
    wire [6:0]P;
    carrygenandprop1 c1(a[0],b[0],G[0],P[0]);
    carrygenandprop1 c2(a[1],b[1],G[1],P[1]);
    carrygenandprop1 c3(a[2],b[2],G[2],P[2]);
    carrygenandprop1 c4(a[3],b[3],G[3],P[3]);
    carrygenandprop1 c5(a[4],b[4],G[4],P[4]);
    carrygenandprop1 c6(a[5],b[5],G[5],P[5]);
    carrygenandprop1 c7(a[6],b[6],G[6],P[6]);
    graycell g1(G[1],P[1],G[0],G10);
    blackcell b1(G[3],P[3],G[2],P[2],G32,P32);
    blackcell b2(G[5],P[5],G[4],P[4],G54,P54);
    graycell g2(G32,P32,G10,G30);
    graycell g3(G[2],P[2],G10,G20);
    graycell g4(G[4],P[4],G30,G40);
    graycell g5(G54,P54,G30,G50);
    graycell g6(G[6],P[6],G50,G60);
    xor x1(sum[0],1'b0,P[0]);
    xor x2(sum[1],G[0],P[1]);
    xor x3(sum[2],G10,P[2]);
    xor x4(sum[3],G20,P[3]);
    xor x5(sum[4],G30,P[4]);
    xor x6(sum[5],G40,P[5]);
    xor x7(sum[6],G50,P[6]);
    assign cout = G60;
endmodule

module bec5(in,cin,sum,cout);
    input [6:0]in;
    input cin;
    output [6:0]sum;
    output cout;
    wire [7:0]in1;
    wire w1,w2,w3,w4,w5,w6;
    assign in1[0] = in[0];
    assign in1[1] = in[1];
    assign in1[2] = in[2];
    assign in1[3] = in[3];
    assign in1[4] = in[4];
    assign in1[5] = in[5];
    assign in1[6] = in[6];
    assign in1[7] = cin;
    not n1(sum[0],in1[0]);
    xor x1(sum[1],in1[0],in1[1]);
    and a1(w1,in1[0],in1[1]);
    xor x2(sum[2],in1[2],w1);
    and a2(w2,w1,in1[2]);
    xor x3(sum[3],in1[3],w2);
    and a3(w3,w2,in1[3]);
    xor x4(sum[4],w3,in1[4]);
    and a4(w4,w3,in1[4]);
    xor x5(sum[5],w4,in1[5]);
    and a5(w5,in1[5],w4);
    xor x6(sum[6],w5,in1[6]);
    and a6(w6,w5,in1[6]);
    xor x7(cout,in1[7],w6);
endmodule

module BKadder4(a,b,sum,cout);
    input [5:0] a;
    input [5:0] b;
    output [5:0] sum;
    output cout;
    wire G10,G32,P32,G54,P54,G30,G20,G40,G50;
    wire [5:0] G;
    wire [5:0] P;
    carrygenandprop1 c1(a[0],b[0],G[0],P[0]);
    carrygenandprop1 c2(a[1],b[1],G[1],P[1]);
    carrygenandprop1 c3(a[2],b[2],G[2],P[2]);
    carrygenandprop1 c4(a[3],b[3],G[3],P[3]);
    carrygenandprop1 c5(a[4],b[4],G[4],P[4]);
    carrygenandprop1 c6(a[5],b[5],G[5],P[5]);
    graycell g1(G[1],P[1],G[0],G10);
    blackcell b1(G[3],P[3],G[2],P[2],G32,P32);
    blackcell b2(G[5],P[5],G[4],P[4],G54,P54);
    graycell g2(G32,P32,G10,G30);
    graycell g3(G[2],P[2],G10,G20);
    graycell g4(G[4],P[4],G30,G40);
    graycell g5(G54,P54,G30,G50);
    xor x1(sum[0],1'b0,P[0]);
    xor x2(sum[1],G[0],P[1]);
    xor x3(sum[2],G10,P[2]);
    xor x4(sum[3],G20,P[3]);
    xor x5(sum[4],G30,P[4]);
    xor x6(sum[5],G40,P[5]);
    assign cout = G50;
endmodule



module bec4(in,cin,sum,cout);
    input [5:0]in;
    input cin;
    output [5:0]sum;
    output cout;
    wire [6:0]in1;
    wire w1,w2,w3,w4,w5;
    assign in1[0] = in[0];
    assign in1[1] = in[1];
    assign in1[2] = in[2];
    assign in1[3] = in[3];
    assign in1[4] = in[4];
    assign in1[5] = in[5];
    assign in1[6] = cin;
    not n1(sum[0],in1[0]);
    xor x1(sum[1],in1[0],in1[1]);
    and a1(w1,in1[0],in1[1]);
    xor x2(sum[2],in1[2],w1);
    and a2(w2,w1,in1[2]);
    xor x3(sum[3],in1[3],w2);
    and a3(w3,w2,in1[3]);
    xor x4(sum[4],w3,in1[4]);
    and a4(w4,w3,in1[4]);
    xor x5(sum[5],w4,in1[5]);
    and a5(w5,in1[5],w4);
    xor x6(cout,w5,in1[6]);
endmodule

module BKadder3(a,b,sum,cout);
    input [4:0] a;
    input [4:0] b;
    output [4:0] sum;
    output cout;
    wire G10,G32,P32,G30,G20,G40;
    wire [4:0]G;
    wire [4:0]P;
    carrygenandprop1 c1(a[0],b[0],G[0],P[0]);
    carrygenandprop1 c2(a[1],b[1],G[1],P[1]);
    carrygenandprop1 c3(a[2],b[2],G[2],P[2]);
    carrygenandprop1 c4(a[3],b[3],G[3],P[3]);
    carrygenandprop1 c5(a[4],b[4],G[4],P[4]);
    graycell g1(G[1],P[1],G[0],G10);
    blackcell b1(G[3],P[3],G[2],P[2],G32,P32);
    graycell g2(G32,P32,G10,G30);
    graycell g3(G[2],P[2],G10,G20);
    graycell g4(G[4],P[4],G30,G40);
    xor x1(sum[0],1'b0,P[0]);
    xor x2(sum[1],G[0],P[1]);
    xor x3(sum[2],G10,P[2]);
    xor x4(sum[3],G20,P[3]);
    xor x5(sum[4],G30,P[4]);
    assign cout = G40;
endmodule

module bec3(in,cin,sum,cout);
    input [4:0]in;
    input cin;
    output [4:0]sum;
    output cout;
    wire [5:0]in1;
    wire w1,w2,w3,w4;
    assign in1[0] = in[0];
    assign in1[1] = in[1];
    assign in1[2] = in[2];
    assign in1[3] = in[3];
    assign in1[4] = in[4];
    assign in1[5] = cin;
    not n1(sum[0],in1[0]);
    xor x1(sum[1],in1[0],in1[1]);
    and a1(w1,in1[0],in1[1]);
    xor x2(sum[2],in1[2],w1);
    and a2(w2,w1,in1[2]);
    xor x3(sum[3],in1[3],w2);
    and a3(w3,w2,in1[3]);
    xor x4(sum[4],w3,in1[4]);
    and a4(w4,w3,in1[4]);
    xor x5(cout,w4,in1[5]);
endmodule

module BKadder2(a,b,sum,cout);
    input [3:0] a;
    input [3:0] b;
    output [3:0] sum;
    output cout;
    wire G10,G32,P32,G30,G20;
    wire [3:0]G;
    wire [3:0]P;
    carrygenandprop1 c1(a[0],b[0],G[0],P[0]);
    carrygenandprop1 c2(a[1],b[1],G[1],P[1]);
    carrygenandprop1 c3(a[2],b[2],G[2],P[2]);
    carrygenandprop1 c4(a[3],b[3],G[3],P[3]);
    graycell g1(G[1],P[1],G[0],G10);
    blackcell b1(G[3],P[3],G[2],P[2],G32,P32);
    graycell g2(G32,P32,G10,G30);
    graycell g3(G[2],P[2],G10,G20);
    xor x1(sum[0],1'b0,P[0]);
    xor x2(sum[1],G[0],P[1]);
    xor x3(sum[2],G10,P[2]);
    xor x4(sum[3],G20,P[3]);
    assign cout = G30;
endmodule

    

module bec2(in,cin,sum,cout);
    input [3:0]in;
    input cin;
    output [3:0]sum;
    output cout;
    wire [4:0]in1;
    wire w1,w2,w3;
    assign in1[0] = in[0];
    assign in1[1] = in[1];
    assign in1[2] = in[2];
    assign in1[3] = in[3];
    assign in1[4] = cin;
    not n1(sum[0],in1[0]);
    xor x1(sum[1],in1[0],in1[1]);
    and a1(w1,in1[0],in1[1]);
    xor x2(sum[2],in1[2],w1);
    and a2(w2,w1,in1[2]);
    xor x3(sum[3],in1[3],w2);
    and a3(w3,w2,in1[3]);
    xor x4(cout,w3,in1[4]);
endmodule

module BKadder1(a,b,sum,cout);
    input [2:0] a;
    input [2:0] b;
    output [2:0] sum;
    output cout;
    wire [2:0]G;
    wire [2:0]P;
    wire G10,G20;
    carrygenandprop1 c1(a[0],b[0],G[0],P[0]);
    carrygenandprop1 c2(a[1],b[1],G[1],P[1]);
    carrygenandprop1 c3(a[2],b[2],G[2],P[2]);
    graycell g1(G[1],P[1],G[0],G10);
    graycell g2(G[2],P[2],G10,G20);
    xor x1(sum[0],1'b0,P[0]);
    xor x2(sum[1],G[0],P[1]);
    xor x3(sum[2],G10,P[2]);
    assign cout = G20;
endmodule


module bec1(in,cin,sum,cout);
    input [2:0]in;
    input cin;
    output [2:0]sum;
    output cout;
    wire [3:0]in1;
    wire w1,w2;
    assign in1[0] = in[0];
    assign in1[1] = in[1];
    assign in1[2] = in[2];
    assign in1[3] = cin;
    not n1(sum[0],in1[0]);
    xor x1(sum[1],in1[0],in1[1]);
    and a1(w1,in1[0],in1[1]);
    xor x2(sum[2],in1[2],w1);
    and a2(w2,w1,in1[2]);
    xor x3(cout,in1[3],w2);
endmodule

module BKadder0(a,b,sum,cout);
    input [1:0] a;
    input [1:0] b;
    output [1:0] sum;
    output cout;
    wire [1:0]G;
    wire [1:0]P;
    wire G10;
    carrygenandprop1 c1(a[0],b[0],G[0],P[0]);
    carrygenandprop1 c2(a[1],b[1],G[1],P[1]);
    graycell g1(G[1],P[1],G[0],G10);
    xor x1(sum[0],1'b0,P[0]);
    xor x2(sum[1],G[0],P[1]);
    assign cout = G10;
endmodule


module bec0(in,cin,sum,cout);
    input [1:0]in;
    input cin;
    output [1:0]sum;
    output cout;
    wire [2:0]in1;
    wire w1;
    assign in1[0] = in[0];
    assign in1[1] = in[1];
    assign in1[2] = cin;
    not n1(sum[0],in1[0]);
    xor x1(sum[1],in1[0],in1[1]);
    and a1(w1,in1[0],in1[1]);
    xor x2(cout,in1[2],w1);
endmodule




module graycell(G,P,Gi,GG);
    input G;
    input P;
    input Gi;
    output GG;
    wire w1;
    and a1(w1,P,Gi);
    or o1(GG,w1,G);
endmodule

module blackcell(G,P,Gi,Pi,GB,PB);
    input  G;
    input  P;
    input  Gi;
    input  Pi;
    output GB;
    output PB;
    wire w1;
    and a1(w1,P,Gi);
    or o1(GB,G,w1);
    and a2(PB,P,Pi);
endmodule

module carrygenandprop1(in0,in1,G,P);
    input in0;
    input in1;
    output G;
    output P;
    and a1(G,in0,in1);
    xor x1(P,in0,in1);
endmodule


module mux(in0,in1,carryin,out);
	output out;
	input in0,in1,carryin;
	wire w1,w2,w3;
	not no1(w1,carryin);
	and a0(w2,in0,w1);
	and a1(w3,in1,carryin);
	or o1(out,w2,w3);
endmodule



//carryselectadder
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