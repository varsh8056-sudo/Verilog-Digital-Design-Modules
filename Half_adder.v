// testbench
module halfad;
  reg A,B;
  wire S,C0;
  HAAD ha(.a(A),.b(B),.s(S),.c0(C0));
  integer i;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,halfad);
    for(i=0;i<4;i=i+1) begin
      A =i[1];
      B =i[0];
      #2;
      $display("TIME=%0t,INPUT VALUES a=%b, b=%b, OUTPUT VALUES  s=%b,c0=%b",$time,A,B,S,C0);
      end 
    end
    endmodule



// design
module HAAD(input a,b,output s,c0);
  xor(s,a,b);
  and(c0,a,b);
endmodule
