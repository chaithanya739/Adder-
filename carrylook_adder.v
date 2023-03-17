module carrylook_adder(a,b,sum,cout);
    input [3:0]a;
    input [3:0]b;
    output [3:0]sum;
    output cout;
    wire c1,c2,c3;
    carrylook1 cl1(a[0],b[0],1'b0,sum[0],c1);
    carrylook1 cl2(a[1],b[1],c1,sum[1],c2);
    carrylook1 cl3(a[2],b[2],c2,sum[2],c3);
    carrylook1 cl4(a[3],b[3],c3,sum[3],cout);
endmodule


module carrylook1(a,b,cin,sum,cout);
    input a;
    input b;
    input cin;
    output sum;
    output cout;
    wire P;
    wire G;
    assign P = a^b;
    assign G = a&b;
    assign cout = (G | P&cin);
    assign sum = (P^(G | P&cin));
endmodule


