module encoder8x3(input wire [7:0] i, output reg [2:0] a);
  // One-hot only. Zero and multi-hot inputs return 000 (not a priority encoder).
  always @* begin
    case (i)
      8'h80: a=0; 8'h40: a=1; 8'h20: a=2; 8'h10: a=3;
      8'h08: a=4; 8'h04: a=5; 8'h02: a=6; 8'h01: a=7;
      default: a=0;
    endcase
  end
endmodule
