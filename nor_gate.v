// Code your testbench here
// or browse Examples
module ogate;
  reg a1;
  reg b1;
  wire y;
  nor_gate utp(.a(a1),.b(b1),.y(y));
   initial begin
    $dumpfile("dump.vcd");
      $dumpvars(1);
     
 //   $monitor(a1,b1,y);
    a1=1'b0;
    b1=1'b0;
   #1 $display("a1:%b, b1:%b, y1:%b",a1,b1,y);
    #1
    a1=1'b0;
    b1=1'b1;
     #1 $display("a1:%b, b1:%b, y1:%b",a1,b1,y);
    #1
    a1=1'b1;
    b1=1'b0;
     #1 $display("a1:%b, b1:%b, y1:%b",a1,b1,y);
    #1
    a1=1'b1;
    b1=1'b1;
end 
endmodule

// Code your design here
module nor_gate(input a,b,output y);
  nor n1(y,a,b);   //structural modelling
endmodule