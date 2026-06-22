//testbench
module nanor;
  reg a1,b1;
  wire y1;
  NAasNOR code(.a(a1),.b(b1),.y(y1));
            integer i;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,nanor);
    $monitor("TIME=%Ot ,INPUT VALUES a=%b, b=%b ,OUTPUT VALUE y=%b",$time,a1,b1,y1);
    for(i=0;i<4;i=i+1) begin
      a1=~a1;
      b1=~b1;
      a1=i[1];
      b1=i[0];
      #4;
    end
  end
endmodule

//design
module NAasNOR(input a,b,output y);
  wire w;
  nand(w,a,b);
  nand(y,w);
  endmodule