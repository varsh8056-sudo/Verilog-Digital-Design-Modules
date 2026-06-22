// Code your testbench here
// or browse Examples
module BGcode;
  reg B3,B2,B1,B0;
  wire G3,G2,G1,G0;
  BtoG code(.b3(B3),.b2(B2),.b1(B1),.b0(B0),.g3(G3),.g2(G2),.g1(G1),.g0(G0));
            integer i;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,BGcode);
    $monitor("TIME=%Ot  | BINARY=%b %b %b %b--> GRAY= %b %b %b %b ",$time,B3,B2,B1,B0,G3,G2,G1,G0);
    for(i=0;i<16;i=i+1) begin
      B3=i[3];
      B2=i[2];
      B1=i[1];
      B0=i[0];
      #4;
    end
  end
endmodule


// Code your design here
module BtoG(input b3,b2,b1,b0,output g3,g2,g1,g0);
 assign g3=b3;
  xor(g2,b2,b3);
  xor(g1,b1,b2);
  xor(g0,b0,b1);
  endmodule