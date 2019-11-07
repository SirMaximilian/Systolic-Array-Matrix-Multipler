
module MAC_array #(parameter array_size = 3, data_size = 8)
    (output [2*data_size-1:0] W_matrix_C [array_size-1:0][array_size-1:0],
     input [data_size-1:0] A_IN [array_size-1:0],
     input [data_size-1:0] B_IN [array_size-1:0],
     input clk,
     input rst);
    
    
    
    wire [data_size-1:0] W_matrix_A [array_size:0][array_size:0];
    wire [data_size-1:0] W_matrix_B [array_size:0][array_size:0];
    //wire [2*data_size-1:0] W_matrix_C [array_size-1:0][array_size-1:0];
    
    //assign W_matrix_A [0][0] = A_IN[0]; <-works
    //assign B_IN = W_matrix_B[0][array_size-1:0];
    
    genvar i, j;
    generate
        for(i = 0;i < array_size;i = i + 1)begin
            for(j = 0; j < array_size; j = j + 1)begin
                MAC #(.data_size(8)) MAC_unit (.out_A(W_matrix_A[i][j+1]), .out_B(W_matrix_B[i+1][j]), .out_C(W_matrix_C[i][j]), .in_A(W_matrix_A[i][j]), .in_B(W_matrix_B[i][j]), .clk(clk), .reset(rst));
            end
        end
        for(i = 0;i < array_size;i = i + 1)begin
            assign W_matrix_A[i][0] = A_IN[i];
            assign W_matrix_B[0][i] = B_IN[i];
        end
    endgenerate
    
endmodule
