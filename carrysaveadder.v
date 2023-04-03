module carrysaveadder
        (   input [3:0] A,B,C,
            output [4:0]S,
            output Cout
            );
            
wire [3:0] c1,s1,c2;

full_adder fa_inst10(A[0],B[0],C[0],s1[0],c1[0]);
full_adder fa_inst11(A[1],B[1],C[1],s1[1],c1[1]);
full_adder fa_inst12(A[2],B[2],C[2],s1[2],c1[2]);
full_adder fa_inst13(A[3],B[3],C[3],s1[3],c1[3]); 

full_adder fa_inst20(s1[1],c1[0],1'b0,S[1],c2[1]);
full_adder fa_inst21(s1[2],c1[1],c2[1],S[2],c2[2]);
full_adder fa_inst22(s1[3],c1[2],c2[2],S[3],c2[3]);
full_adder fa_inst23(1'b0,c1[3],c2[3],S[4],Cout); 

assign S[0] = s1[0];

endmodule



module full_adder(in0, in1,in2, out, cout);
	input in0, in1, in2;
	output out, cout;

	assign out = in0 ^ in1 ^ in2;
	assign cout = (in0&in1)|(in1&in2)|(in0&in2);
endmodule



