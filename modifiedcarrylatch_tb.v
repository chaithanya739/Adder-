module modifiedcarrylatch_tb;
    reg [15:0]a;
    reg [15:0]b;
    reg enable;
    wire [15:0]sum;
    wire cout;

    modifiedcarrylatch cr0(.a(a),.b(b),.enable(enable),.sum(sum),.cout(cout));

    initial begin
        enable = 1;
    end

    always begin
         #0.5 enable = 0;
         #5 enable = 1;
    end


    initial begin
        a = 16'h0001; b = 16'h0001; #10;
        a = 16'h0002; b = 16'h0002; #10;
        a = 16'h0003; b = 16'h0003; #10;
        a = 16'h0004; b = 16'h0004; #10;
        a = 16'h0005; b = 16'h0005; #10;
        a = 16'h0006; b = 16'h0006; #10;
        a = 16'h0007; b = 16'h0007; #10;
        a = 16'h0008; b = 16'h0008; #10;
        a = 16'h0009; b = 16'h0009; #10;
        a = 16'h000A; b = 16'h000A; #10;
        a = 16'h000B; b = 16'h000B; #10;
        a = 16'h000C; b = 16'h000C; #10;
        a = 16'h000D; b = 16'h000D; #10;
        a = 16'h000E; b = 16'h000E; #10;
        a = 16'h000F; b = 16'h000F; #10;
        a = 16'h0010; b = 16'h0010; #10;
        a = 16'h0020; b = 16'h0020; #10;
        a = 16'h0030; b = 16'h0030; #10;
        a = 16'h0040; b = 16'h0040; #10;
        a = 16'h0050; b = 16'h0050; #10;
        a = 16'h0060; b = 16'h0060; #10;
        a = 16'h0070; b = 16'h0070; #10;
        a = 16'h0080; b = 16'h0080; #10;
        a = 16'h0090; b = 16'h0090; #10;
        a = 16'h00A0; b = 16'h00A0; #10;
        a = 16'h00B0; b = 16'h00B0; #10;
        a = 16'h00C0; b = 16'h00C0; #10;
        a = 16'h00D0; b = 16'h00D0; #10;
        a = 16'h00E0; b = 16'h00E0; #10;
        a = 16'h00F0; b = 16'h00F0; #10;
        a = 16'h0011; b = 16'h0011; #10;
        a = 16'h0012; b = 16'h0012; #10;
        a = 16'h0013; b = 16'h0013; #10;
        a = 16'h0014; b = 16'h0014; #10;
        a = 16'h0015; b = 16'h0015; #10;
        a = 16'h0016; b = 16'h0016; #10;
        a = 16'h0017; b = 16'h0017; #10;
        a = 16'h0018; b = 16'h0018; #10;
        a = 16'h0019; b = 16'h0019; #10;
        a = 16'h001A; b = 16'h001A; #10;
        a = 16'h001B; b = 16'h001B; #10;
        a = 16'h001C; b = 16'h001C; #10;
        a = 16'h001D; b = 16'h001D; #10;
        a = 16'h001E; b = 16'h001E; #10;
        a = 16'hFFFF; b = 16'hFFFF; #10;
        a = 16'hFFEE; b = 16'hFFEE; #10;
        a = 16'hFEEF; b = 16'hFEEF; #10;
        a = 16'hF1EF; b = 16'hF1EF; #10;
        a = 16'h0110; b = 16'h0110; 
    end

    initial begin
        $dumpfile("carrylatch.vcd");
        $dumpvars(1);
        //$monitor($time, ": %b + %b = %b, %b, enable=%b",a,b,sum,cout,enable);
    end

endmodule