//testbench
module bitpar;
  reg B3,B2,B1,B0;
  wire A,B,C,D,E,F,G;
  pargen parity(.b3(B3),.b2(B2),.b1(B1),.b0(B0),.a(A),.b(B),.c(C),.d(D),.e(E),.f(F),.g(G));
  integer i;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,bitpar);
    for(i=0;i<8;i=i+1) begin
      B3=i[3];
      B2=i[2];
      B1=i[1];
      B0=i[0];
      #4;
      $display("TIME=%0t,INPUT VALUES B3=%b,B2=%b,B1=%b,B0=%b, OUTPUT VALUE A=%b,B=%b,C=%b,D=%b, E=%b,F=%b,G=%b",$time,B3,B2,B1,B0,A,B,C,D,E,F,G);
    end
  end
endmodule



//design
module pargen(input b3,b2,b1,b0,output a,b,c,d,e,f,g);
  assign a=b1|b3|(b0~^b2);
  assign b=~b2|b3|(b1~^b0);
  assign c=b3|b2|~b1|b0;
  assign d=b3|(b1&~b0)|(b1&~b2)|(~b2&~b0)|(b2&~b1&b0);
  assign e=(~b2&~b0)|(b1&~b0);
  assign f=b3+(~b1&~b0)|(~b1&b2)|(~b0&b2);
  assign g=b3+(b1&~b0)|(b1^b2);
endmodule
