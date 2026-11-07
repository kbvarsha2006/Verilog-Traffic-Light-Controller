module traffic_light_controller(
    input clk,
    input reset,
    output reg [1:0] NS_light,
    output reg [1:0] EW_light
);

    // State definitions
    parameter S0 = 2'b00,
              S1 = 2'b01,
              S2 = 2'b10,
              S3 = 2'b11;

    reg [1:0] state;

    // State transition
    always @(posedge clk or posedge reset)
    begin
        if (reset)
            state <= S0;
        else
        begin
            case (state)
                S0: state <= S1;
                S1: state <= S2;
                S2: state <= S3;
                S3: state <= S0;
                default: state <= S0;
            endcase
        end
    end

    // Traffic light outputs
    always @(*)
    begin
        case (state)
            S0: begin
                NS_light = 2'b10; // Green
                EW_light = 2'b00; // Red
            end

            S1: begin
                NS_light = 2'b01; // Yellow
                EW_light = 2'b00; // Red
            end

            S2: begin
                NS_light = 2'b00; // Red
                EW_light = 2'b10; // Green
            end

            S3: begin
                NS_light = 2'b00; // Red
                EW_light = 2'b01; // Yellow
            end

            default: begin
                NS_light = 2'b00;
                EW_light = 2'b00;
            end
        endcase
    end

endmodule