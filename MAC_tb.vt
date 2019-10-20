
module MAC_tb;

    reg  clk,reset; //in
    reg [7:0]A_r, B_r;
    
    wire [7:0]W_A, W_B; //out
    wire [15:0]W_C;
    
    MAC #(.data_size(8)) instance1(.out_A(W_A), .out_B(W_B), .out_C(W_C), .in_A(A_r), .in_B(B_r), .clk(clk), .reset(reset));
    
    initial begin
        A_r <= 0;
        B_r <= 0;
        clk = 1;
        reset = 1;
        #10
        reset = 0;
        A_r <= 255;
        B_r <= 1;
        #10
        A_r <= 42;
        B_r <= 20;
        #10
        A_r <= 88;
        B_r <= 50;
        #10
        A_r <= 69;
        B_r <= 420;
        
        
    end
    
    always #5 clk = ~clk;
    
endmodule