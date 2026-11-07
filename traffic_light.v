module traffic_light(
    input clk,
    input reset,
    output reg ns_red,
    output reg ns_yellow,
    output reg ns_green,
    output reg ew_red,
    output reg ew_yellow,
    output reg ew_green
);

reg [1:0] state;
reg [31:0] count;

parameter GREEN_TIME = 10;
parameter YELLOW_TIME = 3;

always @(posedge clk or posedge reset)
begin
    if (reset) begin
        state <= 0;
        count <= 0;
    end
    else begin
        case(state)

            0: begin
                if(count == GREEN_TIME-1) begin
                    state <= 1;
                    count <= 0;
                end
                else count <= count + 1;
            end

            1: begin
                if(count == YELLOW_TIME-1) begin
                    state <= 2;
                    count <= 0;
                end
                else count <= count + 1;
            end

            2: begin
                if(count == GREEN_TIME-1) begin
                    state <= 3;
                    count <= 0;
                end
                else count <= count + 1;
            end

            3: begin
                if(count == YELLOW_TIME-1) begin
                    state <= 0;
                    count <= 0;
                end
                else count <= count + 1;
            end

        endcase
    end
end

always @(*) begin
    ns_red = 0;
    ns_yellow = 0;
    ns_green = 0;
    ew_red = 0;
    ew_yellow = 0;
    ew_green = 0;

    case(state)
        0: begin ns_green = 1; ew_red = 1; end
        1: begin ns_yellow = 1; ew_red = 1; end
        2: begin ns_red = 1; ew_green = 1; end
        3: begin ns_red = 1; ew_yellow = 1; end
    endcase
end

endmodule