// key debounce module

module key_debounce(
    clk,
    rst_n,
    key_input,
    key_filter
);

    input clk;
    input rst_n;
    input key_input;
    output key_filter;

    parameter DELAY_TIME = 20'd1000000;  // delay time, default setting is 20ms for 50MHz clk
    parameter DEFAULT_OUTPUT = 1'b1;  // module output just after reset

    wire clk;  // clock
    wire rst_n;  // reset signal, active low
    wire key_input;  // raw key input
    reg key_filter;  // filtered key input

    reg key_d0;  // delayed key signal
    reg key_d1;
    reg [19:0] cnt;

    // sampling key input
    always @(negedge rst_n or posedge clk) begin
        if (~rst_n) begin
            key_d0 <= 1'b0;
            key_d1 <= 1'b1;
        end
        else begin
            key_d0 <= key_input;
            key_d1 <= key_d0;
        end
    end

    // key input delaying
    always @(negedge rst_n or posedge clk) begin
        if (~rst_n)
            cnt <= 20'b0;
        else if (key_d0 != key_d1)
            cnt <= 20'b0;
        else begin
            if (cnt < DELAY_TIME)
                cnt <= cnt + 1'b1;
            else
                cnt <= cnt;
        end
    end

    // output filtered key signal
    always @(negedge rst_n or posedge clk) begin
        if (~rst_n)
            key_filter <= DEFAULT_OUTPUT;
        else if (cnt == DELAY_TIME - 1'b1)
            key_filter <= key_d1;
        else
            key_filter <= key_filter;
    end

endmodule
