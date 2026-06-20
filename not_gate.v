// Code your testbench here
// or browse Examples
module ngate;
  reg a1;
  wire y;
  not_gate utp(.a(a1),.y(y));
   initial begin
    $dumpfile("dump.vcd");
      $dumpvars(1);
    a=0;
    #2 $finish;
always #1 a=~a;
always@(y)
   $display("a1:%b, y1:%b",a1,y);

end
endmodule

// Code your design here
module not_gate(input a,output y);
  not (y,a);
endmodule