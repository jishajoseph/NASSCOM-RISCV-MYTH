\m4_TLV_version 1d: tl-x.org
\SV
   m4_makerchip_module
\TLV
   |cpu
      @0
         $reset = *reset;
         $pc[31:0] = ($reset || >>1$reset) ? 32'd0 :
                     >>3$valid_load ? >>3$replay_pc :
                     >>1$pc + 32'd4;
      @1
         $instr[31:0] = ($pc == 32'd4) ? 32'h0000A283 :
                        ($pc == 32'd8) ? 32'h00228333 :
                        ($pc == 32'd12) ? 32'h403303B3 :
                        32'h00000013;
         $is_load = $instr[6:0] == 7'b0000011;
      @2
         $replay_pc[31:0] = $pc + 32'd4;
      @3
         $shadow1 = >>1$valid_load;
         $shadow2 = >>2$valid_load;
         $valid = !$reset && !$shadow1 && !$shadow2;
         $valid_load = $valid && $is_load;
         $load_count[31:0] = $reset ? 32'd0 :
                            >>1$load_count + {31'b0, $valid_load};
         $shadow_count[31:0] = $reset ? 32'd0 :
                              >>1$shadow_count + {31'b0, ($shadow1 || $shadow2)};
         *passed = $valid && ($pc == 32'd8) &&
                   ($load_count == 32'd1) &&
                   ($shadow_count == 32'd2);
   *failed = 1'b0;
\SV
   endmodule
