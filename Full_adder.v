// testbench
module fullad;
  reg A,B,Ci;
  wire S,C0;
  FUAD ha(.a(A),.b(B),.ci(Ci),.s(S),.c0(C0));
  integer i;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,fullad);
    for(i=0;i<8;i=i+1) begin
      A =i[2];
      B =i[1];
      Ci=i[0];
      #2;
      $display("TIME=%0t,INPUT VALUES a=%b, b=%b, ci=%b, OUTPUT VALUES  s=%b,c0=%b",$time,A,B,Ci,S,C0);
      end 
    end
    endmodule





// design
module FUAD(input a,b,ci,output s,c0);
  wire w0,w1,w2;
  xor(s,a,b,ci);
  and(w0,a,b);
  and(w1,b,ci);  
  and(w2,a,ci);
  or(c0,w0,w1,w2);
endmodule