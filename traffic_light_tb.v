`timescale 1ns/1ps

module traffic_light_tb;

reg clk;
reg reset;

wire [1:0] NS_light;
wire [1:0] EW_light;

traffic_light_controller uut (
    .clk(clk),
    .reset(reset),
    .NS_light(NS_light),
    .EW_light(EW_light)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("traffic_light.vcd");
    $dumpvars(0, traffic_light_tb);

    clk = 0;
    reset = 1;

    #10 reset = 0;

    #1;
    if (NS_light == 2'b10 && EW_light == 2'b00)
        $display("S0 PASS");
    else $display("S0 FAIL");

    #10;
    if (NS_light == 2'b01 && EW_light == 2'b00)
        $display("S1 PASS");
    else $display("S1 FAIL");

    #10;
    if (NS_light == 2'b00 && EW_light == 2'b10)
        $display("S2 PASS");
    else $display("S2 FAIL");

    #10;
    if (NS_light == 2'b00 && EW_light == 2'b01)
        $display("S3 PASS");
    else $display("S3 FAIL");

    #20;
    $finish;
end

initial begin
    $monitor("Time=%0t | NS=%b | EW=%b",
             $time, NS_light, EW_light);
end

endmodule