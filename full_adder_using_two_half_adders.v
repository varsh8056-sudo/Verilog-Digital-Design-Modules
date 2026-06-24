// testbench
module fulluhalfad;
  reg A,B,Ci;
  wire S1,S2,Co1,Co2;
  FAUTHA ha(.a(A),.b(B),.ci(Ci),.s1(S1),.s2(S2),.co1(Co1),.co2(Co2));
  integer i;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,fulluhalfad);
    for(i=0;i<8;i=i+1) begin
      A =i[2];
      B =i[1];
      Ci=i[0];
      #2;
      $display("TIME=%0t,INPUT VALUES a=%b, b=%b ci=%b, OUTPUT VALUES  s1=%b,s2=%b,co1=%b,co2=%b",$time,A,B,Ci,S1,S2,Co1,Co2);
      end 
    end
    endmodule





// design
module FAUTHA(input a,b,ci,output s1,s2,co1,co2);
  wire w0;
  xor(s1,a,b);
  and(co1,a,b);
  xor(s2,s1,ci);
  and(w0,s1,ci);
  or(co2,w0,co1);
endmodule

