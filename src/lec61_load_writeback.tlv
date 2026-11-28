\m4_TLV_version 1d: tl-x.org
\SV
   m4_makerchip_module
\TLV
   // Independent fixed-latency word-load writeback demonstration.
   |cpu
      @0
         $reset = *reset;
         $slot[3:0] = ($reset || >>1$reset) ? 4'd0 :
                      (>>1$slot == 4'd7) ? 4'd7 : >>1$slot + 4'd1;
         $valid = !$reset && ($slot != 4'd2) && ($slot != 4'd3);
         $is_load = $slot == 4'd1;
         $valid_load = $valid && $is_load;
         $rd[4:0] = $is_load ? 5'd5 : 5'd6;
         $src1_value[31:0] = 32'd100;
         $imm[31:0] = 32'd4;
         $result[31:0] = $src1_value + $imm;
         // Illustrative memory: word at byte address 104 contains 42.
         $ld_data[31:0] = ($result == 32'd104) ? 32'd42 : 32'd0;
         $normal_wr_en = $valid && ($slot == 4'd4);
         $load_wr_en = !$reset && >>2$valid_load && (>>2$rd != 5'd0);
         $rf_wr_en = $normal_wr_en || $load_wr_en;
         $rf_wr_index[4:0] = $load_wr_en ? >>2$rd : $rd;
         $rf_wr_data[31:0] = $load_wr_en ? >>2$ld_data : 32'd7;
         // Two modeled architectural registers, with synchronous updates.
         $x5[31:0] = $reset ? 32'd0 :
                     ($rf_wr_en && ($rf_wr_index == 5'd5)) ?
                     $rf_wr_data : >>1$x5;
         $x6[31:0] = $reset ? 32'd0 :
                     ($rf_wr_en && ($rf_wr_index == 5'd6)) ?
                     $rf_wr_data : >>1$x6;
         $collision = $normal_wr_en && $load_wr_en;
         $error_seen = $reset ? 1'b0 : >>1$error_seen || $collision;
         *passed = !$reset && ($slot == 4'd6) &&
                   ($x5 == 32'd42) && ($x6 == 32'd7) && !$error_seen;
         *failed = !$reset && $error_seen;
\SV
   endmodule
