//test bench
module naxo;
  reg a1,b1;
  wire y1;
  NAasXO code(.a(a1),.b(b1),.y(y1));
            integer i;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,naxo);
    $monitor("TIME=%Ot ,INPUT VALUES a=%b, b=%b ,OUTPUT VALUE y=%b",$time,a1,b1,y1);
    for(i=0;i<4;i=i+1) begin
      a1=a1;
      b1=~b1;
      a1=~a1;
      b1=b1;
      a1=i[1];
      b1=i[0];
      #4;
    end
  end
endmodule


// design
module NAasXO(input a,b,output y);
  wire w1,w2,w3,w4;
  nor(w1,a,b);
  nor(w2,w1,a);
  nor(w3,w1,b);
  nor(w4,w2,w3);
  nor(y,w4);
  endmodule