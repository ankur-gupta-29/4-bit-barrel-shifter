module multiplexer(
  input wire [3:0] i,
  input wire [1:0] s,
  output reg  o
);

  always @(i or s) begin
    case(s)
      2'b00  : o <= i[0] ;
      2'b01  : o <= i[1] ;
      2'b10  : o <= i[2] ;
      2'b11  : o <= i[3] ;
    endcase
  end
    

endmodule
module barrel_shifter(
  input wire [3:0] i,
  input wire [1:0] s,
  output reg [3:0] o
);
  
  multiplexer u0 (.i(i),.s(s),.o(o[0]));
  multiplexer u1 (.i({i[2],i[1],i[0],i[3]}),.s(s),.o(o[1]));
  multiplexer u2 (.i({i[1],i[0],i[3],i[2]}),.s(s),.o(o[1]));
  multiplexer u3 (.i({i[0],i[3],i[2],i[1]}),.s(s),.o(o[1]));
endmodule
