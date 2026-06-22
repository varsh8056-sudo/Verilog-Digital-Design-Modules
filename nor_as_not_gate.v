//testbench
module nono;
  reg a1;
  wire y1;
  NOasNO code(.a(a1),.y(y1));
            integer i;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,nono);
    $monitor("TIME=%Ot ,INPUT VALUES a=%b,OUTPUT VALUE y=%b",$time,a1,y1);
    for(i=0;i<2;i=i+1) begin
      a1=i;
      #4;
    end
  end
endmodule


//design
module NOasNO(input a,output y);
  nor(y,a,a);
endmodule
