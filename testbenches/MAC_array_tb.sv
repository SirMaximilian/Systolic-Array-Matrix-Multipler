
module MAC_array_tb;
    
    //in
    reg  clk,reset; 
    reg [7:0] A_r[2:0], B_r[2:0];
    
    //out
    wire [15:0] W_C [2:0][2:0];
    
    MAC_array #(.array_size(3), .data_size(8)) MAC_array_unit(.W_matrix_C(W_C), .A_IN(A_r), .B_IN(B_r), .clk(clk), .rst(reset));
    //MAC #(.data_size(8)) instance1(.out_A(W_A), .out_B(W_B), .out_C(W_C), .in_A(A_r), .in_B(B_r), .clk(clk), .reset(reset));
    
	/*
	A = [2 1 3
	     3 2 1
	     1 3 2]
		 
	B = [5 4 6
	     6 5 6
		 4 6 5]
    
	A * B = C
	
	C = [28 31 31
	     31 28 31
		 31 31 28]	 
	*/
	
    initial begin
        A_r[0] <= 0;A_r[1] <= 0;A_r[2] <= 0;//0 start
        B_r[0] <= 0;B_r[1] <= 0;B_r[2] <= 0;
        clk = 1;
        reset = 1;
        #10
        reset = 0;
        A_r[0] <= 2;A_r[1] <= 0;A_r[2] <= 0;//1
        B_r[0] <= 5;B_r[1] <= 0;B_r[2] <= 0;
        #10
        A_r[0] <= 3;A_r[1] <= 1;A_r[2] <= 0;//2
        B_r[0] <= 4;B_r[1] <= 6;B_r[2] <= 0;
        #10
        A_r[0] <= 1;A_r[1] <= 2;A_r[2] <= 3;//3
        B_r[0] <= 6;B_r[1] <= 5;B_r[2] <= 4;
        #10
        A_r[0] <= 0;A_r[1] <= 3;A_r[2] <= 1;//4
        B_r[0] <= 0;B_r[1] <= 4;B_r[2] <= 6;
        #10
        A_r[0] <= 0;A_r[1] <= 0;A_r[2] <= 2;//5
        B_r[0] <= 0;B_r[1] <= 0;B_r[2] <= 5;
		#10
		A_r[0] <= 0;A_r[1] <= 0;A_r[2] <= 0;//6 end
        B_r[0] <= 0;B_r[1] <= 0;B_r[2] <= 0;
    end
    
    always #5 clk = ~clk;
    
endmodule