//testbench
module nonan;
  reg a1,b1;
  wire y1;
  NOasNAN code(.a(a1),.b(b1),.y(y1));
            integer i;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,nonan);
    $monitor("TIME=%Ot ,INPUT VALUES a=%b b=%b,OUTPUT VALUE y=%b",$time,a1,b1,y1);
    for(i=0;i<4;i=i+1) begin
      a1=~a1;
      b1=~b1;
      a1=i[1];
      b1=i[0];
      #4;
    end
  end
endmodule


// design
module NOasNAN(input a,b,output y);
  wire w1,w2,w3;
  nor(w1,a); 
  nor(w2,b);
  nor(w3,w1,w2);
  nor(y,w3);
endmodule