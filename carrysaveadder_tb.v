module carrysaveadder_tb;
    reg [0:3]A;
    reg [0:3]B;
    reg [0:3]C;
    wire [0:4]S;
    wire Cout;

    carrysaveadder carry(.A(A),.B(B),.C(C),.S(S),.Cout(Cout));

    initial begin
        A = 4'b0000; B = 4'b0000; C = 4'b0000; #10
		A = 4'b0000; B = 4'b0001; C = 4'b0001; #10
		A = 4'b0000; B = 4'b0010; C = 4'b1000; #10
		A = 4'b0000; B = 4'b0011; C = 4'b1001; #10
		A = 4'b0000; B = 4'b0100; C = 4'b1010; #10
		A = 4'b1100; B = 4'b0101; C = 4'b1100; #10
		A = 4'b1100; B = 4'b0110; C = 4'b0011; #10
		A = 4'b1100; B = 4'b0111; C = 4'b1010; #10
		A = 4'b1100; B = 4'b1000; C = 4'b1001; #10
		A = 4'b1100; B = 4'b1001; C = 4'b1010; #10
		A = 4'b1100; B = 4'b1010; C = 4'b1110; #10
		A = 4'b1111; B = 4'b1100; C = 4'b1111; #10
		A = 4'b1111; B = 4'b1101; C = 4'b0111; #10
		A = 4'b1111; B = 4'b1110; C = 4'b1100; #10
		A = 4'b1111; B = 4'b1111; C = 4'b0111;
    end
    
    initial begin
        $dumpfile("carrysave.vcd");
        $dumpvars(1);
        $monitor($time," :%b + %b + %b= %b, %b ",A,B,C,S,Cout);
    end
endmodule