\m4_TLV_version 1d: tl-x.org
\SV
   m4_makerchip_module
\TLV
   // Standalone jump-control demonstration.
   |cpu
      @0
         $reset = *reset;
         $pc[31:0] = ($reset || >>1$reset) ? 32'd0 :
                     >>3$valid_jump ? >>3$target :
                     >>1$pc + 32'd4;
      @1
         // JAL x5,16 at PC 4; JALR x6,1(x1) at PC 20.
         $instr[31:0] = ($pc == 32'd4) ? 32'h010002ef :
                        ($pc == 32'd20) ? 32'h00108367 :
                        32'h00000013;
         $opcode[6:0] = $instr[6:0];
         $is_jal = $opcode == 7'h6f;
         $is_jalr = ($opcode == 7'h67) && ($instr[14:12] == 3'b000);
         $rd[4:0] = $instr[11:7];
         $imm[31:0] = $is_jal ?
            {{12{$instr[31]}}, $instr[19:12], $instr[20], $instr[30:21], 1'b0} :
            {{21{$instr[31]}}, $instr[30:20]};
      @2
         // Illustrative forwarded source register x1 = 32.
         $src1_value[31:0] = 32'd32;
         $jal_target[31:0] = $pc + $imm;
         $jalr_sum[31:0] = $src1_value + $imm;
         $jalr_target[31:0] = {$jalr_sum[31:1], 1'b0};
         $target[31:0] = $is_jalr ? $jalr_target : $jal_target;
         $link[31:0] = $pc + 32'd4;
      @3
         $shadow1 = >>1$valid_jump;
         $shadow2 = >>2$valid_jump;
         $valid = !$reset && !$shadow1 && !$shadow2;
         $valid_jump = $valid && ($is_jal || $is_jalr);
         $rf_wr_en = $valid_jump && ($rd != 5'd0);
         $x5[31:0] = $reset ? 32'd0 :
                     ($rf_wr_en && ($rd == 5'd5)) ? $link : >>1$x5;
         $x6[31:0] = $reset ? 32'd0 :
                     ($rf_wr_en && ($rd == 5'd6)) ? $link : >>1$x6;
         $jump_count[31:0] = $reset ? 32'd0 :
                           >>1$jump_count + {31'b0, $valid_jump};
         $shadow_count[31:0] = $reset ? 32'd0 :
                             >>1$shadow_count + {31'b0, (!$reset && ($shadow1 || $shadow2))};
         *passed = $valid && ($pc == 32'd32) &&
                   ($x5 == 32'd8) && ($x6 == 32'd24) &&
                   ($jump_count == 32'd2) && ($shadow_count == 32'd4);
   *failed = 1'b0;
\SV
   endmodule
