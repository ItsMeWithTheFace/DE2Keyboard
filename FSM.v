module FSM(clk, state, layer_out, out_state);
    input clk;
    input [2:0] state;
    output reg [2:0] out_state;
    output reg [2:0] layer_out;

    reg [4:0] current_state, next_state;

    localparam LAYER_1  = 4'd0,
               LAYER_2  = 4'd1,
               LAYER_3  = 4'd2;


    // State table
    always@(*)
    begin: state_table
        case (current_state)
            LAYER_1: next_state = state == 3'b010 ? LAYER_2 : (state == 3'b100 ? LAYER_3 : LAYER_1);
            LAYER_2: next_state = state == 3'b100 ? LAYER_3 : (state == 3'b001 ? LAYER_1 : LAYER_2);
            LAYER_3: next_state = state == 3'b001 ? LAYER_1 : (state == 3'b010 ? LAYER_2 : LAYER_3);
            default: next_state = LAYER_1;
        endcase
    end // state_table

    // Output logic
    always@(*)
    begin: enable_signals
        // By default make output signals 0
        out_state = 3'b000;
        layer_out = 3'b000;

        case(current_state)
            LAYER_1: begin
                out_state = 3'b001;
                layer_out = 3'b001;
            end
            LAYER_2: begin
                out_state = 3'b010;
                layer_out = 3'b010;
            end
            LAYER_3: begin
                out_state = 3'b100;
                layer_out = 3'b100;
            end
        endcase
    end // enable_signals

    // current_state registers
    always@(posedge clk)
    begin: state_FFs
        current_state = next_state;
    end // state_FFs

endmodule
