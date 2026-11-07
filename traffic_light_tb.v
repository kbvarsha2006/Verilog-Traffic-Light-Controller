module traffic_light_tb;

reg clk;
reg reset;

wire ns_red, ns_yellow, ns_green;
wire ew_red, ew_yellow, ew_green;

traffic_light uut (
    .clk(clk),
    .reset(reset),
    .ns_red(ns_red),
    .ns_yellow(ns_yellow),
    .ns_green(ns_green),
    .ew_red(ew_red),
    .ew_yellow(ew_yellow),
    .ew_green(ew_green)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("traffic_light.vcd");
    $dumpvars(0, traffic_light_tb);

    $monitor("Time=%0t | NS: R=%b Y=%b G=%b | EW: R=%b Y=%b G=%b",
        $time, ns_red, ns_yellow, ns_green,
        ew_red, ew_yellow, ew_green);

    reset = 1;
    #10;
    reset = 0;

    #350;

    $finish;
end

endmodule