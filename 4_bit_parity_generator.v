//testbench
module bitpar;
  reg B3,B2,B1,B0;
  wire P0;
  pargen parity(.b3(B3),.b2(B2),.b1(B1),.b0(B0),.p0(P0));
  integer i;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,bitpar);
    for(i=0;i<16;i=i+1) begin
      B3=i[3];
      B2=i[2];
      B1=i[1];
      B0=i[0];
      #4;
      $display("TIME=%0t,INPUT VALUES B3=%b,B2=%b,B1=%b,B0=%b, OUTPUT VALUE P0=%b",$time,B3,B2,B1,B0,P0);
    end
  end
endmodule



// design
module pargen(input b3,b2,b1,b0,output p0);
  xor(p0,b0,b1,b2,b3);
endmodule
