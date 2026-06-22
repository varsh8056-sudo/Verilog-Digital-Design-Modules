//testbench
module noor;
  reg a1,b1;
  wire y1;
  NOasOR code(.a(a1),.b(b1),.y(y1));
            integer i;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,noor);
    $monitor("TIME=%Ot ,INPUT VALUES a=%b b=%b,OUTPUT VALUE y=%b",$time,a1,b1,y1);
    for(i=0;i<4;i=i+1) begin
      a1=i[1];
      b1=i[0];
      #4;
    end
  end
endmodule


// design
module NOasOR(input a,b,output y);
  wire w1;
  nor(w1,a,b); 
  nor(y,w1);
endmodule