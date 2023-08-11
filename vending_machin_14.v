module vending_machine(clk,reset,coin,product1,product2,coin_out,button1,button2);
	 
	 input [1:0]coin;  // 01 is for 5 rs. and 10 is for 10 rs.
	 input clk,reset;
	 input button1,button2;  //button1 is for  rs5 product button2 is for rs10 product
	 reg [1:0]p_state,n_state;  //p_state is present state and n_state is next state.
	 output reg product1,product2;   //product 01 price rs5,product 10 price rs10.
	 output reg[1:0]coin_out; // 01 is for 5 rs. , 10 is for 10 rs. and 11 is for 15 rs.
	 
	 parameter s1=2'b00,
				  s2=2'b01,
				  s3=2'b10;
initial
begin
n_state=s1;
end
always@(posedge clk)
begin
	
		if(reset==1 & clk==1)
			begin
			n_state=s1;
			product1=0;
			product2=0;
			coin_out=coin;
			end
		else
			begin
			p_state=n_state;
	
				case(p_state)
					s1:begin
							if(coin==2'b0) 
								begin
								n_state=s1;
								product1=0;
								product2=0;
								coin_out=2'b0;
								end
							else if(coin==2'b01) 
							begin
							#100;
							if( button1==0 & button2==0)
								begin
								n_state=s2;
								product1=0;
								product2=0;
								coin_out=2'b0;
								end
							
							else if( button1==1 & button2==0)
								begin
								n_state=s1;
								product1=1;
								product2=0;
								coin_out=2'b0;
								end
							else if( button1==0 & button2==1)
								begin
								n_state=s1;
								product1=0;
								product2=0;
								coin_out=2'b01;
								end
							else if( button1==1 & button2==1)
								begin
								n_state=s1;
								product1=1;
								product2=0;
								coin_out=2'b01;
								end
							end
							else if(coin==2'b10)
							begin
							#100;
							if(button1==0 & button2==0)
								begin
								n_state=s3;
								product1=0;
								product2=0;
								coin_out=2'b0;
								end
							else if(button1==1 & button2==0)
								begin
								n_state=s1;
								product1=1;
								product2=0;
								coin_out=2'b00;
								end
							else if(button1==0 & button2==1)
								begin
								n_state=s1;
								product1=0;
								product2=1;
								coin_out=2'b0;
								end
							else if(button1==1 & button2==1)
								begin
								n_state=s1;
								product1=0;
								product2=1;
								coin_out=2'b0;
								end
							end	
						end
					s2:begin
							if(coin==2'b0)
							begin 
							#100;
							if( button1==0 & button2==0)
								begin
								n_state=s1;
								product1=0;
								product2=0;
								coin_out=2'b01;
								end
							else if( button1==1 & button2==0)
								begin
								n_state=s1;
								product1=1;
								product2=0;
								coin_out=2'b0;
								end
							else if( button1==0 & button2==1)
								begin
								n_state=s1;
								product1=0;
								product2=0;
								coin_out=2'b01;
								end
							else if( button1==1 & button2==1)
								begin
								n_state=s1;
								product1=1;
								product2=0;
								coin_out=2'b0;
								end
							end
							else if(coin==2'b01)
							begin
							#100;
							if( button1==0 & button2==0)
								begin
								n_state=s3;
								product1=0;
								product2=0;
								coin_out=2'b0;
								end
								
						   else if( button1==1 & button2==0)
								begin
								n_state=s1;
								product1=1;
								product2=0;
								coin_out=2'b01;
								end
							else if( button1==0 & button2==1)
								begin
								n_state=s1;
								product1=0;
								product2=1;
								coin_out=2'b0;
								end
							else if( button1==1 & button2==1)
								begin
								n_state=s1;
								product1=0;
								product2=1;
								coin_out=2'b01;
								end
							end
							else if(coin==2'b10)
							begin
							#100;
							if( button1==1 & button2==1)
								begin
								n_state=s1;
								product1=1;
								product2=1;
								coin_out=2'b0;
								end
							else if( button1==1 & button2==0)
								begin
								n_state=s1;
								product1=1;
								product2=0;
								coin_out=2'b10;
								end
							else if( button1==0 & button2==1)
								begin
								n_state=s1;
								product1=0;
								product2=1;
								coin_out=2'b01;
								end
							else if( button1==0 & button2==0)
								begin
								n_state=s3;
								product1=0;
								product2=0;
								coin_out=2'b01;
								end
							end	
						end
					s3:begin
							if(coin==2'b0)
							begin 
							#100;
							if( button1==0 & button2==0)
								begin
								n_state=s1;
								product1=0;
								product2=0;
								coin_out=2'b10;
								end
							else if(button1==1 & button2==0)
								begin
								n_state=s1;
								product1=1;
								product2=0;
								coin_out=2'b01;
								end
							else if( button1==0 & button2==1)
								begin
								n_state=s1;
								product1=0;
								product2=1;
								coin_out=2'b00;
								end
							else if( button1==1 & button2==1)
								begin
								n_state=s1;
								product1=0;
								product2=1;
								coin_out=2'b00;
								end
							end
							else if(coin==2'b01)
							begin 
							#100;
							if( button1==1 & button2==0)
								begin
								n_state=s1;
								product1=1;
								product2=0;
								coin_out=2'b10;
								end
							else if( button1==0 & button2==1)
								begin
								n_state=s1;
								product1=0;
								product2=1;
								coin_out=2'b01;
								end
							else if( button1==1 & button2==1)
								begin
								n_state=s1;
								product1=1;
								product2=1;
								coin_out=2'b0;
								end
							else if( button1==0 & button2==0)
								begin
								n_state=s2;
								product1=0;
								product2=0;
								coin_out=2'b10;
								end
							end
							else if(coin==2'b10)
							begin 
							#100;
							if( button1==1 & button2==0)
								begin
								n_state=s2;
								product1=1;
								product2=0;
								coin_out=2'b10;
								end
							else if( button1==0 & button2==1)
								begin
								n_state=s1;
								product1=0;
								product2=1;
								coin_out=2'b10;
								end
							else if( button1==1 & button2==1)
								begin
								n_state=s1;
								product1=1;
								product2=1;
								coin_out=2'b01;
								end
							else if( button1==0 & button2==0)
								begin
								n_state=s3;
								product1=0;
								product2=0;
								coin_out=2'b10;
								end
							end
						end
					default:begin
								coin_out=coin;
								n_state=s1;
								end
						
					endcase
			end
	end
endmodule