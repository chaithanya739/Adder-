module withoutmuxcarrylook(a,b,sum,cout);
    input [15:0]a;
    input [15:0]b;
    output [15:0]sum;
    output cout;
    wire [4:0]carry;
    wire [15:0]sum_inter;
    wire [3:0]carry_comb;
    carrylook0 s0(a[1:0],b[1:0],sum_inter[1:0],carry[0]);
    combinational1 s1(1'b0,sum_inter[1:0],carry[0],sum[1:0],carry_comb[0]);
    carrylook0 s2(a[3:2],b[3:2],sum_inter[3:2],carry[1]);
    combinational1 s3(carry_comb[0],sum_inter[3:2],carry[1],sum[3:2],carry_comb[1]);
    carrylook1 s4(a[6:4],b[6:4],sum_inter[6:4],carry[2]);
    combinational2 s5(carry_comb[1],sum_inter[6:4],carry[2],sum[6:4],carry_comb[2]);
    carrylook2 s6(a[10:7],b[10:7],sum_inter[10:7],carry[3]);
    combinational3 s7(carry_comb[2],sum_inter[10:7],carry[3],sum[10:7],carry_comb[3]);
    carrylook3 s8(a[15:11],b[15:11],sum_inter[15:11],carry[4]);
    combinational4 s9(carry_comb[3],sum_inter[15:11],carry[4],sum[15:11],cout);
endmodule

module combinational4(cin,sum_in,cripple,sumr,cout);
    input cin;
    input cripple;
    input [4:0]sum_in;
    output [4:0]sumr;
    output cout;
    wire [4:0]cp;
    combinational c0(cin,sum_in[0],sumr[0],cp[0]);
    combinational c1(cp[0],sum_in[1],sumr[1],cp[1]);
    combinational c2(cp[1],sum_in[2],sumr[2],cp[2]);
    combinational c3(cp[2],sum_in[3],sumr[3],cp[3]);
    combinational c4(cp[3],sum_in[4],sumr[4],cp[4]);
    assign cout = cp[4]^cripple;
endmodule

module combinational3(cin,sum_in,cripple,sumr,cout);
    input cin;
    input cripple;
    input [3:0]sum_in;
    output [3:0]sumr;
    output cout;
    wire [3:0]cp;
    combinational c0(cin,sum_in[0],sumr[0],cp[0]);
    combinational c1(cp[0],sum_in[1],sumr[1],cp[1]);
    combinational c2(cp[1],sum_in[2],sumr[2],cp[2]);
    combinational c3(cp[2],sum_in[3],sumr[3],cp[3]);
    assign cout = cp[3]^cripple;
endmodule

module carrylook3(in0, in1, out, cout);
	input [4:0] in0;
	input [4:0] in1;
	output [4:0] out;
	output cout;
    wire [4:0]G;
    wire [4:0]P;
    wire [4:0]C;
    assign G = in0 & in1; //Generate
    assign P = in0 ^ in1; //Propagate
    assign C[0] = 1'b0;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
    assign C[4] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) |(P[3] & P[2] & P[1] & P[0] & C[0]);
    assign cout = G[4] | (P[4] & G[3]) | (P[4] & P[3] & G[2]) | (P[4] & P[3] & P[2] & G[1]) |(P[4] & P[3] & P[2] & P[1] & G[0])|(P[4] & P[3] & P[2] & P[1] & P[0]& C[0]);
    assign out = P ^ C;
endmodule

module combinational2(cin,sum_in,cripple,sumr,cout);
    input cin;
    input cripple;
    input [2:0]sum_in;
    output [2:0]sumr;
    output cout;
    wire [2:0]cp;
    combinational c0(cin,sum_in[0],sumr[0],cp[0]);
    combinational c1(cp[0],sum_in[1],sumr[1],cp[1]);
    combinational c2(cp[1],sum_in[2],sumr[2],cp[2]);
    assign cout = cp[2]^cripple;
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

module combinational1(cin,sum_in,cripple,sumr,cout);
    input cin;
    input cripple;
    input [1:0]sum_in;
    output [1:0]sumr;
    output cout;
    wire [1:0]cp;
    combinational c0(cin,sum_in[0],sumr[0],cp[0]);
    combinational c1(cp[0],sum_in[1],sumr[1],cp[1]);
    assign cout = cp[1]^cripple;
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

module combinational(cin,sum_in,sumr,cind);
    input cin;
    input sum_in;
    output sumr;
    output cind;
    assign sumr = cin^sum_in;
    assign cind = cin&sum_in;
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

module full_adder(in0, in1, cin, out, cout);
	input in0, in1, cin;
	output out, cout;

	assign out = in0 ^ in1 ^ cin;
	assign cout = ((in0 ^ in1) & cin) | (in0 & in1);
endmodule
