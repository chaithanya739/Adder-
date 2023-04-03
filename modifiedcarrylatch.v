module modifiedcarrylatch(a,b,enable,sum,cout);
    input [15:0]a;
    input [15:0]b;
    input enable;
    output [15:0]sum;
    output cout;
    wire [3:0]c1;
	wire [3:0]c0;
	wire cin;
	wire [2:0]c;
	wire [31:0]sum0;
	wire [31:0]sum1;
    ripple_carry_adderfirst ra0(a[1:0],b[1:0],sum[1:0],cin);
    ripple_carry_adder0 ra1(a[3:2],b[3:2],enable,sum0[3:2],c0[0]);
    dlatch1 ra2(sum0[3:2],enable,c0[0],sum1[3:2],c1[0]);
    assign sum[3:2] = cin?sum1[3:2]:sum0[3:2];
    assign c[0] = cin?c1[0]:c0[0];
    ripple_carry_adder10 ra3(a[6:4],b[6:4],enable,sum0[6:4],c0[1]);
    dlatch2   ra4(sum0[6:4],enable,c0[1],sum1[6:4],c1[1]);
    assign sum[6:4] = c[0]?sum1[6:4]:sum0[6:4];
    assign c[1] = c[0]?c1[1]:c0[1];
    ripple_carry_adder20 ra5(a[10:7],b[10:7],enable,sum0[10:7],c0[2]);
    dlatch3  ra6(sum0[10:7],enable,c0[2],sum1[10:7],c1[2]);
    assign sum[10:7] = c[1]?sum1[10:7]:sum0[10:7];
    assign c[2] = c[1]?c1[2]:c0[2];
    ripple_carry_adder30 ra7(a[15:11],b[15:11],enable,sum0[15:11],c0[3]);
    dlatch4   ra8(sum0[15:11],enable,c0[3],sum1[15:11],c1[3]);
    assign sum[15:11] = c[2]?sum1[15:11]:sum0[15:11];
    assign cout = c[2]?c1[3]:c0[3];
endmodule


module dlatch4(d_in,enable,cin,q_out,cout);
    input [4:0] d_in;
    input cin;
    output  cout;
    output   [4:0]q_out;
    input enable;
    dlatch d1(d_in[0],enable,1'b0,q_out[0]);
    dlatch d2(d_in[1],enable,1'b0,q_out[1]);
    dlatch d3(d_in[2],enable,1'b0,q_out[2]);
    dlatch d4(d_in[3],enable,1'b0,q_out[3]);
    dlatch d5(d_in[4],enable,1'b0,q_out[4]);
    dlatch d6(cin,enable,1'b0,cout);
endmodule


module ripple_carry_adder30(in0, in1,enable, out, cout);
	input [4:0] in0;
	input [4:0] in1;
    input enable;
	output [4:0] out;
	output cout;

	wire c1,c2,c3,c4;
	full_adder fa0(in0[0], in1[0], enable, out[0], c1);
	full_adder fa1(in0[1], in1[1], c1, out[1], c2);
    full_adder fa2(in0[2], in1[2], c2, out[2], c3);
    full_adder fa3(in0[3], in1[3], c3, out[3], c4);
    full_adder fa4(in0[4], in1[4], c4, out[4], cout);

endmodule

    

module dlatch3(d_in,enable,cin,q_out,cout);
    input [3:0] d_in;
    input cin;
    output  cout;
    output   [3:0]q_out;
    input enable;
    dlatch d1(d_in[0],enable,1'b0,q_out[0]);
    dlatch d2(d_in[1],enable,1'b0,q_out[1]);
    dlatch d3(d_in[2],enable,1'b0,q_out[2]);
    dlatch d4(d_in[3],enable,1'b0,q_out[3]);
    dlatch d5(cin,enable,1'b0,cout);
endmodule


module ripple_carry_adder20(in0, in1, enable, out, cout);
	input [3:0] in0;
	input [3:0] in1;
    input enable;
	output [3:0] out;
	output cout;

	wire c1,c2,c3;
	full_adder fa0(in0[0], in1[0], enable, out[0], c1);
	full_adder fa1(in0[1], in1[1], c1, out[1], c2);
    full_adder fa2(in0[2], in1[2], c2, out[2], c3);
    full_adder fa3(in0[3], in1[3], c3, out[3], cout);

endmodule

module dlatch2(d_in,enable,cin,q_out,cout);
    input [2:0] d_in;
    input cin;
    output  cout;
    output   [2:0]q_out;
    input enable;
    dlatch d1(d_in[0],enable,1'b0,q_out[0]);
    dlatch d2(d_in[1],enable,1'b0,q_out[1]);
    dlatch d3(d_in[2],enable,1'b0,q_out[2]);
    dlatch d4(cin,enable,1'b0,cout);
endmodule


module ripple_carry_adder10(in0, in1, enable, out, cout);
	input [2:0] in0;
	input [2:0] in1;
    input enable;
	output [2:0] out;
	output cout;

	wire c1,c2;
	full_adder fa0(in0[0], in1[0], enable, out[0], c1);
	full_adder fa1(in0[1], in1[1], c1, out[1], c2);
    full_adder fa2(in0[2], in1[2], c2, out[2], cout);

endmodule

module dlatch1(d_in,enable,cin,q_out,cout);
    input [1:0] d_in;
    input cin;
    output cout;
    output  [1:0]q_out;
    input enable;
    dlatch d1(d_in[0],enable,1'b0,q_out[0]);
    dlatch d2(d_in[1],enable,1'b0,q_out[1]);
    dlatch d3(cin,enable,1'b0,cout);
endmodule



module ripple_carry_adder0(in0, in1, enable, out, cout);
	input [1:0] in0;
	input [1:0] in1;
    input enable;
	output [1:0] out;
	output cout;

	wire c1;
	full_adder fa0(in0[0], in1[0], enable, out[0], c1);
	full_adder fa1(in0[1], in1[1], c1, out[1], cout);

endmodule

module ripple_carry_adderfirst(in0, in1, out, cout);
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

module dlatch(d,enable,reset,q);
    input d;
    input enable;
    input reset;
    output reg q;

    always @(enable or reset or q) begin
        if(reset == 1'b1) begin
            q <= 0;
        end
        else begin
            if(enable) begin
                q <= d;
            end
        end
    end
endmodule