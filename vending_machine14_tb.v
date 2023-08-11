`timescale 1ns / 1ps
module vending_machine14_tb;
	// Inputs
	reg clk;
	reg reset;                
	reg [1:0] coin;
	reg button1;
	reg button2;
	//reg cancel;
	// Outputs
	wire product1;
	wire product2;
	wire [1:0] coin_out;
	// Instantiate the Unit Under Test (UUT)
	vending_machine uut (
		.clk(clk),           //output signal color is White. 
		.reset(reset),       //output signal color is Green. 
		.coin(coin),         //output signal color is Blue.
		.product1(product1), //output signal color is Yellow.
		.product2(product2), //output signal color is Pink.
		.coin_out(coin_out), //output signal color is Green. 
		.button1(button1),   //output signal color is Yellow.
		.button2(button2));	//output signal color is Pink.
	initial begin
	clk=0;
	forever
	#20 clk=~clk;
	end
	initial begin
		// Initialize Inputs
		reset = 0;coin = 0;button1 = 0;button2 = 0;  
		// Add stimulus here
		#20 reset = 0;coin = 10;#5 button1 = 1;#1 button2 = 1;
		#94 reset = 0;coin = 01;#5 button1 = 1;#1 button2 = 0;
	end    
endmodule

