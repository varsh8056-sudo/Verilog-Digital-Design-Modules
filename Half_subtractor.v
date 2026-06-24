// testbench
module halfsu;
  reg A,B;
  wire D,B0;
  HASU ha(.a(A),.b(B),.d(D),.b0(B0));
  integer i;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,halfsu);
    for(i=0;i<4;i=i+1) begin
      A =i[1];
      B =i[0];
      #2;
      $display("TIME=%0t,INPUT VALUES a=%b, b=%b, OUTPUT VALUES  d=%b,b0=%b",$time,A,B,D,B0);
      end 
    end
    endmodule






// design
module HASU(input a,b,output d,b0);
wire a_not;
not(a_not,a);
  xor(d,a,b);
  and(b0,a_not,b);
endmodule