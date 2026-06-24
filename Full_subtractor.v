// testbench
module fullsu;
  reg A,B,C;
  wire D,B0;
  FUSU ha(.a(A),.b(B),.c(C),.d(D),.b0(B0));
  integer i;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,fullsu);
    for(i=0;i<8;i=i+1) begin
      A =i[2];
      B =i[1];
      C=i[0];
      #2;
      $display("TIME=%0t,INPUT VALUES a=%b, b=%b, c=%b, OUTPUT VALUES  d=%b,b0=%b",$time,A,B,C,D,B0);
      end 
    end
    endmodule




// design
module FUSU(input a,b,c,output d,b0);
  wire w0,w1,w2;
  xor(d,a,b,c);
  and(w0,~a,b);
  and(w1,b,c);  
  and(w2,~a,c);
  or(b0,w0,w1,w2);
endmodule