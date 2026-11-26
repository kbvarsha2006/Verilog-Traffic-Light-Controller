`timescale 1ns/1ps

module traffic_light_tb;

reg clk;
reg reset;

wire [1:0] NS_light;
wire [1:0] EW_light;

integer passed = 0;
integer failed = 0;

traffic_light_controller uut (
    .clk(clk),
    .reset(reset),
    .NS_light(NS_light),
    .EW_light(EW_light)
);

always #5 clk = ~clk;

task check_state;
    input [1:0] expected_NS;
    input [1:0] expected_EW;
    input [8*5-1:0] state_name;
    begin
        if (NS_light === expected_NS &&
            EW_light === expected_EW) begin
            $display("PASS: %s | NS=%b EW=%b",
                     state_name, NS_light, EW_light);
            passed = passed + 1;
        end
        else begin
            $display("FAIL: %s | NS=%b EW=%b",
                     state_name, NS_light, EW_light);
            failed = failed + 1;
        end
    end
endtask

initial begin
    $dumpfile("traffic_light.vcd");
    $dumpvars(0, traffic_light_tb);

    clk = 0;
    reset = 1;

    #1;
    check_state(2'b10, 2'b00, "S0");

    #1 reset = 0;

    @(posedge clk); #1;
    check_state(2'b01, 2'b00, "S1");

    @(posedge clk); #1;
    check_state(2'b00, 2'b10, "S2");

    @(posedge clk); #1;
    check_state(2'b00, 2'b01, "S3");

    @(posedge clk); #1;
    check_state(2'b10, 2'b00, "S0");

    reset = 1;
    #1;
    check_state(2'b10, 2'b00, "RESET");

    $display("------------------------------");
    $display("TOTAL PASSED: %0d", passed);
    $display("TOTAL FAILED: %0d", failed);
    $display("------------------------------");

    if (failed == 0)
        $display("TRAFFIC LIGHT VERIFICATION SUCCESSFUL");
    else
        $fatal(1, "TRAFFIC LIGHT VERIFICATION FAILED");

    $finish;
end

endmodule
