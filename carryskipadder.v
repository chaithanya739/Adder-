module carryskipadder(a,b,sum,cout);
    input [15:0]a;
    input [15:0]b;
    output [15:0]sum;
    output cout;
    wire [2:0]cin;
    carryskip1 cs1(a[3:0],b[3:0],1'b0,sum[3:0],cin[0]);
    carryskip1 cs2(a[7:4],b[7:4],cin[0],sum[7:4],cin[1]);
    carryskip1 cs3(a[11:8],b[11:8],cin[1],sum[11:8],cin[2]);
    carryskip1 cs4(a[15:12],b[15:12],cin[2],sum[15:12],cout);
endmodule

module carryskip1(in0,in1,cin,sum,cout);
    input [3:0] in0;
    input [3:0] in1;
    input cin;
    output [3:0] sum;
    output cout;    
    wire [3:0] P;
    wire [3:0] C;
    wire P_in;
    full_adder f1(in0[0],in1[0],cin,sum[0],C[0]);
    PG P1(in0[0],in1[0],P[0]);
    full_adder f2(in0[1],in1[1],C[0],sum[1],C[1]);
    PG P2(in0[1],in1[1],P[1]);
    full_adder f3(in0[2],in1[2],C[1],sum[2],C[2]);
    PG P3(in0[2],in1[2],P[2]);
    full_adder f4(in0[3],in1[3],C[2],sum[3],C[3]);
    PG P4(in0[3],in1[3],P[3]);
    assign P_in = P[0]&P[1]&P[2]&P[3];
    assign cout = P_in?cin:C[3];
endmodule

module full_adder(in0, in1,cin, out, cout);
	input in0, in1, cin;
	output out, cout;

	assign out = in0 ^ in1 ^ cin;
	assign cout = (in0&in1)|(in1&cin)|(in0&cin);
endmodule

module PG(in0,in1,P);
    input in0;
    input in1;
    output P;
    assign P = in0^in1;
endmodule

