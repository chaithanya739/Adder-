module bitcarryselect_tb;
    reg [31:0]a;
    reg [31:0]b;
    wire [31:0]sum;
    wire cout;

    bitcarryselect b0(.a(a),.b(b),.sum(sum),.cout(cout));
    initial begin
        a = 32'h00000001; b = 32'h00000001; #10;
        a = 32'h11110002; b = 32'h11110002; #10;
        a = 32'h12340003; b = 32'h12340003; #10;
        a = 32'hAAAA0004; b = 32'hABCD0004; #10;
        a = 32'hADEF0005; b = 32'hADEF0005; #10;
        a = 32'hFFFF0006; b = 32'h12560006; #10;
        a = 32'h18970007; b = 32'hFFFF0007; #10;
        a = 32'h34980008; b = 32'h98760008; #10;
        a = 32'h67580009; b = 32'h45690009; #10;
        a = 32'hABCD000A; b = 32'hABCD000A; #10;
        a = 32'h1234000B; b = 32'h7896000B; #10;
        a = 32'h3456000C; b = 32'h34FD000C; #10;
        a = 32'hDCDE000D; b = 32'hADCD000D; #10;
        a = 32'h9856000E; b = 32'h4566000E; #10;
        a = 32'h12FE000F; b = 32'hEEEF000F; #10;
        a = 32'h00000010; b = 32'h66660010; #10;
        a = 32'hFEDE0020; b = 32'hEDAC0020; #10;
        a = 32'hFEDA0030; b = 32'hDAFE0030; #10;
        a = 32'hFFFD0040; b = 32'hDDED0040; #10;
        a = 32'h11110050; b = 32'h01110050; #10;
        a = 32'h20340060; b = 32'h43210060; #10;
        a = 32'h23670070; b = 32'h87650070; #10;
        a = 32'hFEEE0080; b = 32'hEEEF0080; #10;
        a = 32'h12560090; b = 32'h78650090; #10;
        a = 32'h897600A0; b = 32'h875600A0; #10;
        a = 32'h986700B0; b = 32'hFFFF00B0; #10;
        a = 32'hED3400C0; b = 32'h175400C0; #10;
        a = 32'h734500D0; b = 32'hADE300D0; #10;
        a = 32'h458900E0; b = 32'h348900E0; #10;
        a = 32'h666600F0; b = 32'hF00000F0; #10;
        a = 32'hD4320011; b = 32'hE3240011; #10;
        a = 32'hE3450012; b = 32'hD5670012; #10;
        a = 32'h56660013; b = 32'hEDDD0013; #10;
        a = 32'hDEFD0014; b = 32'hFFFF0014; #10;
        a = 32'h18880015; b = 32'h19990015; #10;
        a = 32'hFE230032; b = 32'hEF230032; #10;
        a = 32'h12FF0017; b = 32'h21EE0017; #10;
        a = 32'hFE430018; b = 32'h43FE0018; #10;
        a = 32'hEDED0019; b = 32'hDEDE0019; #10;
        a = 32'h12DE001A; b = 32'hDDDD001A; #10;
        a = 32'hEEE1001B; b = 32'h1EEE001B; #10;
        a = 32'h22CC001C; b = 32'hCC22001C; #10;
        a = 32'hFEDE001D; b = 32'hDFED001D; #10;
        a = 32'h1890001E; b = 32'h1909001E; #10;
        a = 32'hDEDCFFFF; b = 32'hFEDCFFFF; #10;
        a = 32'hFEDEFFEE; b = 32'hFFFFFFEE; #10;
        a = 32'h0909FEEF; b = 32'hFEDFFEEF; #10;
        a = 32'hFEFEF1EF; b = 32'hFEFEF1EF; #10;
        a = 32'h00110110; b = 32'h11000110; 
    end

    initial begin
        $dumpfile("bitcarryselect.vcd");
        $dumpvars(1);
        $monitor($time, ": %b + %b = %b, %b",a,b,sum,cout);
    end

endmodule