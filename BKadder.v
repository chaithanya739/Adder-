module BKadder(a,b,sum,cout);
    input [15:0] a;
    input [15:0] b;
    output [15:0] sum;
    output cout;
    wire [15:0]G;
    wire [15:0]P;
    wire [15:0]C;
    carrygenandpropall c1(a[15:0],b[15:0],G[15:0],P[15:0]);
    PGlogic P1(G[15:0],P[15:0],1'b0,C[15:0]);
    sumlogic s1(C[15:0],P[15:0],sum[15:0],cout);
endmodule


module sumlogic(C,P,sum,cout);
    input [15:0]C;
    input [15:0]P;
    output [15:0]sum;
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
    and a1(w1,P[15],C[14]);
    or o1(cout,C[15],w1);
endmodule



module PGlogic(G,P,cin,C);
    input [15:0]G;
    input [15:0]P;
    input cin;
    output [15:0]C; 
    wire G10,G32,P32,G76,P76,G98,P98,G1110,P1110,G1312,P1312,G1514,P1514,G74,P74,G118,P118,G1512,P1512,G30,G158,P158,G150,G70,G110;
    wire G50,G60,G90,G130,G20,G40,G80,G100,G120,G140;
    graycell g1(G[1],P[1],G[0],G10);
    blackcell b1(G[3],P[3],G[2],P[2],G32,P32);
    blackcell b2(G[5],P[5],G[4],P[4],G54,P54);
    blackcell b3(G[7],P[7],G[6],P[6],G76,P76);
    blackcell b4(G[9],P[9],G[8],P[8],G98,P98);
    blackcell b5(G[11],P[11],G[10],P[10],G1110,P1110);
    blackcell b6(G[13],P[13],G[12],P[12],G1312,P1312);
    blackcell b7(G[15],P[15],G[14],P[14],G1514,P1514);
    graycell g2(G32,P32,G10,G30);
    blackcell b8(G54,P54,G76,P76,G74,P74);
    blackcell b9(G1110,P1110,G98,P98,G118,P118);
    blackcell b10(G1514,P1514,G1312,P1312,G1512,P1512);
    graycell g3(G74,P74,G30,G70);
    blackcell b11(G1512,P1512,G118,P118,G158,P158);
    graycell g4(G158,P158,G70,G150);
    graycell g5(G118,P118,G70,G110);
    graycell g6(G54,P54,G30,G50);
    graycell g7(G98,P98,G70,G90);
    graycell g8(G1312,P1312,G110,G130);
    graycell g9(G[2],P[2],G10,G20);
    graycell g10(G[4],P[4],G30,G40);
    graycell g11(G[6],P[6],G50,G60);
    graycell g12(G[8],P[8],G70,G80);
    graycell g13(G[10],P[10],G90,G100);
    graycell g14(G[12],P[12],G110,G120);
    graycell g15(G[14],P[14],G130,G140);
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
endmodule




module carrygenandpropall(in0,in1,G,P);
    input [15:0] in0;
    input [15:0] in1;
    output [15:0] G;
    output [15:0] P;
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