
module MAC #(parameter data_size = 8)(output reg [data_size-1:0]out_A, out_B, output reg [2*data_size-1:0]out_C, input [data_size-1:0]in_A, in_B, input clk, reset);
    
    wire [2*data_size-1:0]mul_AB;
    //reg [2*data_size-1:0]mac_reg;
    
    assign mul_AB = out_A * out_B;
    
    always @(posedge clk) begin
        //mac_reg <= mul_AB + mac_reg;
        if (reset) begin
            out_C <= 0;
            out_A <= 0;
            out_B <= 0;
        end
        else begin
            out_C <= mul_AB + out_C;
            out_A <= in_A;
            out_B <= in_B;
        end
    end
    
endmodule