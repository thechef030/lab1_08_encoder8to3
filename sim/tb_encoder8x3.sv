`timescale 1ns/1ps
module tb_encoder8x3;
  reg [7:0] i; wire [2:0] a; integer k; encoder8x3 dut(i,a);
  integer n,checked=0;
  reg [2:0] expected;
  initial begin
    $dumpfile("wave.vcd"); $dumpvars(0,tb_encoder8x3);

    for(n=0;n<256;n=n+1) begin
      i=n;
      expected=0;
      for(k=0;k<8;k=k+1) if(n==(128>>k)) expected=k;
      #10;
      if (a !== expected)
        $fatal(1,"FAIL encoder8x3 vector=%0d expected=%h actual=%h",n,expected,a);
      checked=checked+1;
    end
    if(checked!=256) $fatal(1,"Incomplete test");
    $display("LAB1_PASS encoder8x3 cases=%0d",checked);
    $finish;
  end
  initial begin #100000; $fatal(1,"Watchdog"); end
endmodule