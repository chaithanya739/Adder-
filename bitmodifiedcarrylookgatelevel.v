
module bitmodifiedcarrylookgatelevel(a,b,sum,cout);
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
    mux m1(sum0[2],sum1[2],cin,sum[2]);
	mux m2(sum0[3],sum1[3],cin,sum[3]);
	mux m3(c0[0],c1[0],cin,c[0]);
    carrylook1 ra3(a[6:4],b[6:4],sum0[6:4],c0[1]);
    bec1 ra4(sum0[6:4],c0[1],sum1[6:4],c1[1]);
	mux m4(sum0[4],sum1[4],c[0],sum[4]);
	mux m5(sum0[5],sum1[5],c[0],sum[5]);
	mux m6(sum0[6],sum1[6],c[0],sum[6]);
	mux m7(c0[1],c1[1],c[0],c[1]);
    carrylook2 ra5(a[10:7],b[10:7],sum0[10:7],c0[2]);
    bec2 ra6(sum0[10:7],c0[2],sum1[10:7],c1[2]);
	mux m8(sum0[7],sum1[7],c[1],sum[7]);
	mux m9(sum0[8],sum1[8],c[1],sum[8]);
	mux m10(sum0[9],sum1[9],c[1],sum[9]);
	mux m11(sum0[10],sum1[10],c[1],sum[10]);
	mux m12(c0[2],c1[2],c[1],c[2]);
    carrylook2 ra7(a[14:11],b[14:11],sum0[14:11],c0[3]);
    bec2 ra8(sum0[14:11],c0[3],sum1[14:11],c1[3]);
	mux m13(sum0[11],sum1[11],c[2],sum[11]);
	mux m14(sum0[12],sum1[12],c[2],sum[12]);
	mux m15(sum0[13],sum1[13],c[2],sum[13]);
	mux m16(sum0[14],sum1[14],c[2],sum[14]);
	mux m17(c0[3],c1[3],c[2],c[3]);
    carrylook2 ra9(a[18:15],b[18:15],sum0[18:15],c0[4]);
    bec2 ra10(sum0[18:15],c0[4],sum1[18:15],c1[4]);
	mux m18(sum0[15],sum1[15],c[3],sum[15]);
	mux m19(sum0[16],sum1[16],c[3],sum[16]);
	mux m20(sum0[17],sum1[17],c[3],sum[17]);
	mux m21(sum0[18],sum1[18],c[3],sum[18]);
	mux m22(c0[4],c1[4],c[3],c[4]);
    carrylook2 ra13(a[22:19],b[22:19],sum0[22:19],c0[5]);
    bec2 ra14(sum0[22:19],c0[5],sum1[22:19],c1[5]);
	mux m23(sum0[19],sum1[19],c[4],sum[19]);
	mux m24(sum0[20],sum1[20],c[4],sum[20]);
	mux m25(sum0[21],sum1[21],c[4],sum[21]);
	mux m26(sum0[22],sum1[22],c[4],sum[22]);
	mux m27(c0[5],c1[5],c[4],c[5]);
    carrylook2 ra17(a[26:23],b[26:23],sum0[26:23],c0[6]);
    bec2 ra18(sum0[26:23],c0[6],sum1[26:23],c1[6]);
	mux m28(sum0[23],sum1[23],c[5],sum[23]);
	mux m29(sum0[24],sum1[24],c[5],sum[24]);
	mux m30(sum0[25],sum1[25],c[5],sum[25]);
	mux m31(sum0[26],sum1[26],c[5],sum[26]);
	mux m32(c0[6],c1[6],c[5],c[6]);
    carrylook1 ra19(a[29:27],b[29:27],sum0[29:27],c0[7]);
    bec1 ra20(sum0[29:27],c0[7],sum1[29:27],c1[7]);
	mux m34(sum0[27],sum1[27],c[6],sum[27]);
	mux m35(sum0[28],sum1[28],c[6],sum[28]);
	mux m36(sum0[29],sum1[29],c[6],sum[29]);
	mux m37(c0[7],c1[7],c[6],c[7]);
    carrylook0 ra21(a[31:30],b[31:30],sum0[31:30],c0[8]);
    bec0 ra22(sum0[31:30],c0[8],sum1[31:30],c1[8]);
    mux m38(sum0[30],sum1[30],c[7],sum[30]);
	mux m39(sum0[31],sum1[31],c[7],sum[31]);
	mux m40(c0[8],c1[8],c[7],cout);
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


module carrylook2(in0, in1, out, cout);
	input [3:0] in0;
	input [3:0] in1;
	output [3:0] out;
	output cout;
    wire [3:0]G;
    wire [3:0]P;
    wire [3:0]C;
    wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16;
    and a1(G[0],in0[0],in1[0]);
    and a2(G[1],in0[1],in1[1]);
    and as(G[2],in0[2],in1[2]);
    and as1(G[3],in0[3],in1[3]);
    xor x1(P[0],in0[0],in1[0]);
    xor x2(P[1],in0[1],in1[1]);
    xor x3(P[2],in0[2],in1[2]);
    xor x8(P[3],in0[3],in1[3]);
    assign C[0] = 1'b0;
    and a3(w1,P[0],C[0]);
    or o1(C[1],G[0],w1);
    and a4(w2,w1,P[1]);
    and a5(w3,P[1],G[0]);
    or o2(w4,w2,w3);
    or o3(C[2],G[1],w4);
    and a6(w5,P[2],w2);
    and a7(w6,w3,P[2]);
    and a8(w7,P[2],G[1]);
    or o4(w8,w5,w6);
    or o5(w9,w7,w8);
    or o6(C[3],G[2],w9);
    and a9(w10,w5,P[3]);
    and a10(w11,w6,P[3]);
    and a11(w12,w7,P[3]);
    and a12(w13,P[3],G[2]);
    or o7(w14,G[3],w13);
    or o8(w15,w14,w12);
    or o9(w16,w15,w11);
    or o10(cout,w16,w10);
    xor x4(out[0],P[0],C[0]);
    xor x5(out[1],P[1],C[1]);
    xor x6(out[2],P[2],C[2]);
    xor x7(out[3],P[3],C[3]);
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


module carrylook1(in0, in1, out, cout);
	input [2:0] in0;
	input [2:0] in1;
	output [2:0] out;
	output cout;
    wire [2:0]G;
    wire [2:0]P;
    wire [2:0]C;
    wire w1,w2,w3,w4,w5,w6,w7,w8,w9;
    and a1(G[0],in0[0],in1[0]);
    and a2(G[1],in0[1],in1[1]);
    and as(G[2],in0[2],in1[2]);
    xor x1(P[0],in0[0],in1[0]);
    xor x2(P[1],in0[1],in1[1]);
    xor x3(P[2],in0[2],in1[2]);
    assign C[0] = 1'b0;
    and a3(w1,P[0],C[0]);
    or o1(C[1],G[0],w1);
    and a4(w2,w1,P[1]);
    and a5(w3,P[1],G[0]);
    or o2(w4,w2,w3);
    or o3(C[2],G[1],w4);
    and a6(w5,P[2],w2);
    and a7(w6,w3,P[2]);
    and a8(w7,P[2],G[1]);
    or o4(w8,w5,w6);
    or o5(w9,w7,w8);
    or o6(cout,G[2],w9);
    xor x5(out[0],P[0],C[0]);
    xor x6(out[1],P[1],C[1]);
    xor x7(out[2],P[2],C[2]);
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

module carrylook0(in0, in1, out, cout);
	input [1:0] in0;
	input [1:0] in1;
	output [1:0] out;
	output cout;
    wire [1:0]G;
    wire [1:0]P;
    wire [1:0]C;
    wire w1,w2,w3,w4;
    and a1(G[0],in0[0],in1[0]);
    and a2(G[1],in0[1],in1[1]);
    xor x1(P[0],in0[0],in1[0]);
    xor x2(P[1],in0[1],in1[1]);
    assign C[0] = 1'b0;
    and a3(w1,P[0],C[0]);
    or o1(C[1],G[0],w1);
    and a4(w2,w1,P[1]);
    and a5(w3,P[1],G[0]);
    or o2(w4,w2,w3);
    or o3(cout,G[1],w4);
    xor x3(out[0],P[0],C[0]);
    xor x4(out[1],P[1],C[1]);
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