
module addercheck(a,b,check,checkcout);
    input [31:0] a;
    input [31:0] b;
    output [31:0] check;
    output checkcout;
    wire [31:0] sum1;
    wire [31:0] sum2;
    wire cout1;
    wire cout2;
    bitBKadder b1(a[31:0],b[31:0],sum1[31:0],cout1);
    bitcarryselect b2(a[31:0],b[31:0],sum2[31:0],cout2);
    assign check = sum1^sum2;
    assign checkcout = cout1^cout2;
endmodule 


module bitBKadder(a,b,sum,cout);
    input [31:0] a;
    input [31:0] b;
    output [31:0] sum;
    output cout;
    wire [31:0]G;
    wire [31:0]P;
    wire [31:0]C;
    carrygenandpropall c1(a[31:0],b[31:0],G[31:0],P[31:0]);
    PGlogic P1(G[31:0],P[31:0],1'b0,C[31:0]);
    sumlogic s1(C[31:0],P[31:0],G[31],sum[31:0],cout);
endmodule


module sumlogic(C,P,G,sum,cout);
    input [31:0]C;
    input [31:0]P;
    input G;
    output [31:0]sum;
    output cout;
    wire w1;
    xor x1(sum[0],C[0],P[0]);
    xor x2(sum[1],C[1],P[1]);
    xor x3(sum[2],C[2],P[2]);
    xor x4(sum[3],C[3],P[3]);
    xor x5(sum[4],C[4],P[4]);
    xor x6(sum[5],C[5],P[5]);
    xor x7(sum[6],C[6],P[6]);
    xor x8(sum[7],C[7],P[7]);
    xor x9(sum[8],C[8],P[8]);
    xor x10(sum[9],C[9],P[9]);
    xor x11(sum[10],C[10],P[10]);
    xor x12(sum[11],C[11],P[11]);
    xor x13(sum[12],C[12],P[12]);
    xor x14(sum[13],C[13],P[13]);
    xor x15(sum[14],C[14],P[14]);
    xor x16(sum[15],C[15],P[15]);
    xor x17(sum[16],C[16],P[16]);
    xor x18(sum[17],C[17],P[17]);
    xor x19(sum[18],C[18],P[18]);
    xor x20(sum[19],C[19],P[19]);
    xor x21(sum[20],C[20],P[20]);
    xor x22(sum[21],C[21],P[21]);
    xor x23(sum[22],C[22],P[22]);
    xor x24(sum[23],C[23],P[23]);
    xor x25(sum[24],C[24],P[24]);
    xor x26(sum[25],C[25],P[25]);
    xor x27(sum[26],C[26],P[26]);
    xor x28(sum[27],C[27],P[27]);
    xor x29(sum[28],C[28],P[28]);
    xor x30(sum[29],C[29],P[29]);
    xor x31(sum[30],C[30],P[30]);
    xor x32(sum[31],C[31],P[31]);
    and a1(w1,P[31],C[31]);
    or o1(cout,G,w1);
endmodule



module PGlogic(G,P,cin,C);
    input [31:0]G;
    input [31:0]P;
    input cin;
    output [31:0]C; 
    wire G10,G32,P32,G76,P76,G98,P98,G1110,P1110,G1312,P1312,G1514,P1514,G74,P74,G118,P118,G1512,P1512,G30,G158,P158,G150,G70,G110;
    wire G50,G60,G90,G130,G20,G40,G80,G100,G120,G140;
    wire G1716,P1716,G1918,P1918,G2120,P2120,G2322,P2322,G2524,P2524,G2726,P2726,G2928,P2928,G3130,P3130;
    wire G1916,P1916,G2320,P2320,G2724,P2724,G3128,P3128;
    wire G2316,P2316,G3124,P3124;
    wire G3116,P3116,G310,G230,G190,G270,G170,G210,G250,G290,G160,G180,G200,G220,G240,G260,G280,G300,G320;
    //level1
    graycell g1(G[1],P[1],G[0],G10);
    blackcell b1(G[3],P[3],G[2],P[2],G32,P32);
    blackcell b2(G[5],P[5],G[4],P[4],G54,P54);
    blackcell b3(G[7],P[7],G[6],P[6],G76,P76);
    blackcell b4(G[9],P[9],G[8],P[8],G98,P98);
    blackcell b5(G[11],P[11],G[10],P[10],G1110,P1110);
    blackcell b6(G[13],P[13],G[12],P[12],G1312,P1312);
    blackcell b7(G[15],P[15],G[14],P[14],G1514,P1514);
    blackcell b8(G[17],P[17],G[16],P[16],G1716,P1716);
    blackcell b9(G[19],P[19],G[18],P[18],G1918,P1918);
    blackcell b10(G[21],P[21],G[20],P[20],G2120,P2120);
    blackcell b11(G[23],P[23],G[22],P[22],G2322,P2322);
    blackcell b12(G[25],P[25],G[24],P[24],G2524,P2524);
    blackcell b13(G[27],P[27],G[26],P[26],G2726,P2726);
    blackcell b14(G[29],P[29],G[28],P[28],G2928,P2928);
    blackcell b15(G[31],P[31],G[30],P[30],G3130,P3130);
    //level 2
    graycell g2(G32,P32,G10,G30);
    blackcell b16(G76,P76,G54,P54,G74,P74);
    blackcell b17(G1110,P1110,G98,P98,G118,P118);
    blackcell b18(G1514,P1514,G1312,P1312,G1512,P1512);
    blackcell b19(G1514,P1514,G1312,P1312,G1512,P1512);
    blackcell b20(G1918,P1918,G1716,P1716,G1916,P1916);
    blackcell b21(G2322,P2322,G2120,P2120,G2320,P2320);
    blackcell b22(G2726,P2726,G2524,P2524,G2724,P2724);
    blackcell b23(G3130,P3130,G2928,P2928,G3128,P3128);
    //level 3
    graycell g3(G74,P74,G30,G70);
    blackcell b24(G1512,P1512,G118,P118,G158,P158);
    blackcell b25(G2320,P2320,G1916,P1916,G2316,P2316);
    blackcell b26(G3128,P3128,G2724,P2724,G3124,P3124);
    //level 4
    graycell g4(G158,P158,G70,G150);
    blackcell b27(G3124,P3124,G2316,P2316,G3116,P3116);
    graycell g5(G3116,P3116,G150,G310);
    //level 5
    graycell g6(G118,P118,G70,G110);
    graycell g7(G54,P54,G30,G50);
    graycell g8(G98,P98,G70,G90);
    graycell g9(G1312,P1312,G110,G130);
    graycell g10(G[2],P[2],G10,G20);
    graycell g11(G[4],P[4],G30,G40);
    graycell g12(G[6],P[6],G50,G60);
    graycell g13(G[8],P[8],G70,G80);
    graycell g14(G[10],P[10],G90,G100);
    graycell g15(G[12],P[12],G110,G120);
    graycell g16(G[14],P[14],G130,G140);
    graycell g17(G2316,P2316,G150,G230);
    graycell g18(G1916,P1916,G150,G190);
    graycell g19(G2724,P2724,G230,G270);
    graycell g20(G1716,P1716,G150,G170);
    graycell g21(G2120,P2120,G190,G210);
    graycell g22(G2524,P2524,G230,G250);
    graycell g23(G2928,P2928,G270,G290);
    graycell g24(G[16],P[16],G150,G160);
    graycell g25(G[18],P[18],G170,G180);
    graycell g26(G[20],P[20],G190,G200);
    graycell g27(G[22],P[22],G210,G220);
    graycell g28(G[24],P[24],G230,G240);
    graycell g29(G[26],P[26],G250,G260);
    graycell g30(G[28],P[28],G270,G280);
    graycell g31(G[30],P[30],G290,G300);
    graycell g32(G[32],P[32],G310,G320);

    assign C[0] = cin;
    assign C[1] = G[0];
    assign C[2] = G10;
    assign C[3] = G20;
    assign C[4] = G30;
    assign C[5] = G40;
    assign C[6] = G50;
    assign C[7] = G60;
    assign C[8] = G70;
    assign C[9] = G80;
    assign C[10] = G90;
    assign C[11] = G100;
    assign C[12] = G110;
    assign C[13] = G120;
    assign C[14] = G130;
    assign C[15] = G140;
    assign C[16] = G150;
    assign C[17] = G160;
    assign C[18] = G170;
    assign C[19] = G180;
    assign C[20] = G190;
    assign C[21] = G200;
    assign C[22] = G210;
    assign C[23] = G220;
    assign C[15] = G140;
    assign C[16] = G150;
    assign C[17] = G160;
    assign C[18] = G170;
    assign C[19] = G180;
    assign C[20] = G190;
    assign C[21] = G200;
    assign C[22] = G210;
    assign C[23] = G220;
    assign C[24] = G230;
    assign C[25] = G240;
    assign C[26] = G250;
    assign C[27] = G260;
    assign C[28] = G270;
    assign C[29] = G280;
    assign C[30] = G290;
    assign C[31] = G300;
endmodule




module carrygenandpropall(in0,in1,G,P);
    input [31:0] in0;
    input [31:0] in1;
    output [31:0] G;
    output [31:0] P;
    carrygenandprop1 c1(in0[0],in1[0],G[0],P[0]);
    carrygenandprop1 c2(in0[1],in1[1],G[1],P[1]);
    carrygenandprop1 c3(in0[2],in1[2],G[2],P[2]);
    carrygenandprop1 c4(in0[3],in1[3],G[3],P[3]);
    carrygenandprop1 c5(in0[4],in1[4],G[4],P[4]);
    carrygenandprop1 c6(in0[5],in1[5],G[5],P[5]);
    carrygenandprop1 c7(in0[6],in1[6],G[6],P[6]);
    carrygenandprop1 c8(in0[7],in1[7],G[7],P[7]);
    carrygenandprop1 c9(in0[8],in1[8],G[8],P[8]);
    carrygenandprop1 c10(in0[9],in1[9],G[9],P[9]);
    carrygenandprop1 c11(in0[10],in1[10],G[10],P[10]);
    carrygenandprop1 c12(in0[11],in1[11],G[11],P[11]);
    carrygenandprop1 c13(in0[12],in1[12],G[12],P[12]);
    carrygenandprop1 c14(in0[13],in1[13],G[13],P[13]);
    carrygenandprop1 c15(in0[14],in1[14],G[14],P[14]);
    carrygenandprop1 c16(in0[15],in1[15],G[15],P[15]);
    carrygenandprop1 c17(in0[16],in1[16],G[16],P[16]);
    carrygenandprop1 c18(in0[17],in1[17],G[17],P[17]);
    carrygenandprop1 c19(in0[18],in1[18],G[18],P[18]);
    carrygenandprop1 c20(in0[19],in1[19],G[19],P[19]);
    carrygenandprop1 c21(in0[20],in1[20],G[20],P[20]);
    carrygenandprop1 c22(in0[21],in1[21],G[21],P[21]);
    carrygenandprop1 c23(in0[22],in1[22],G[22],P[22]);
    carrygenandprop1 c24(in0[23],in1[23],G[23],P[23]);
    carrygenandprop1 c25(in0[24],in1[24],G[24],P[24]);
    carrygenandprop1 c26(in0[25],in1[25],G[25],P[25]);
    carrygenandprop1 c27(in0[26],in1[26],G[26],P[26]);
    carrygenandprop1 c28(in0[27],in1[27],G[27],P[27]);
    carrygenandprop1 c29(in0[28],in1[28],G[28],P[28]);
    carrygenandprop1 c30(in0[29],in1[29],G[29],P[29]);
    carrygenandprop1 c31(in0[30],in1[30],G[30],P[30]);
    carrygenandprop1 c32(in0[31],in1[31],G[31],P[31]);
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