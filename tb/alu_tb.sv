module alu_tb;

  parameter BW = 16; // bitwidth

  logic signed [BW-1:0] in_a;
  logic signed [BW-1:0] in_b;
  logic             [2:0] opcode;
  logic signed [BW-1:0] out;
  logic             [2:0] flags; // {overflow, negative, zero}

  // Instantiate the ALU
  alu #(BW) dut (
    .in_a(in_a),
    .in_b(in_b),
    .opcode(opcode),
    .out(out),
    .flags(flags)
  );

  // Generate stimuli to test the ALU
  initial begin
    in_a = '0;
    in_b = '0;
    opcode = '0;
    #10ns;

    // Complete your testbench code here
    $display("Time\tin_a\tin_b\topcode\tout\toverflow|neg|zero");
    $display("-----------------------------------------------------");

    // Test all opcodes
    for (int i = 0; i < 8; i++) begin
      opcode = i;
      for (int j = 0; j < 10; j++) begin
        in_a = $urandom_range(0, 2**BW-1);
        in_b = $urandom_range(0, 2**BW-1);
        #1ns;
        $display("%0t\t%0d\t%0d\t%03b\t%0d\t%01b\t%01b\t%01b", $time, in_a, in_b, opcode, out, flags[0], flags[1], flags[2]);
      end
      in_a = 0;
      in_b = 0;
      #1ns;
      $display("%0t\t%0d\t%0d\t%03b\t%0d\t%01b\t%01b\t%01b", $time, in_a, in_b, opcode, out, flags[0], flags[1], flags[2]);
    end
  
    $finish;
  end

endmodule
