\m4_TLV_version 1d: tl-x.org
\SV
   m4_makerchip_module
\TLV
   // Standalone decoder/ALU exercise; no architectural register file.
   |cpu
      @0
         $reset = *reset;
         $test_id[5:0] = ($reset || >>1$reset) ? 6'd0 :
                         (>>1$test_id == 6'd22) ? 6'd22 :
                         >>1$test_id + 6'd1;
         $pc[31:0] = {24'b0, $test_id, 2'b00};
         $instr[31:0] =
            ($test_id == 6'd0) ? 32'h002081b3 : // ADD
            ($test_id == 6'd1) ? 32'h402081b3 : // SUB
            ($test_id == 6'd2) ? 32'h0020f1b3 : // AND
            ($test_id == 6'd3) ? 32'h0020e1b3 : // OR
            ($test_id == 6'd4) ? 32'h0020c1b3 : // XOR
            ($test_id == 6'd5) ? 32'h002091b3 : // SLL
            ($test_id == 6'd6) ? 32'h0020d1b3 : // SRL
            ($test_id == 6'd7) ? 32'h4020d1b3 : // SRA
            ($test_id == 6'd8) ? 32'h0020a1b3 : // SLT
            ($test_id == 6'd9) ? 32'h0020b1b3 : // SLTU
            ($test_id == 6'd10) ? 32'h00508193 : // ADDI
            ($test_id == 6'd11) ? 32'h0050f193 : // ANDI
            ($test_id == 6'd12) ? 32'h0050e193 : // ORI
            ($test_id == 6'd13) ? 32'h0050c193 : // XORI
            ($test_id == 6'd14) ? 32'h00209193 : // SLLI
            ($test_id == 6'd15) ? 32'h0020d193 : // SRLI
            ($test_id == 6'd16) ? 32'h4020d193 : // SRAI
            ($test_id == 6'd17) ? 32'h0050a193 : // SLTI
            ($test_id == 6'd18) ? 32'h0050b193 : // SLTIU
            ($test_id == 6'd19) ? 32'h123451b7 : // LUI
            ($test_id == 6'd20) ? 32'h00001197 : // AUIPC
            ($test_id == 6'd21) ? 32'h008001ef : // JAL
            ($test_id == 6'd22) ? 32'h004081e7 : // JALR
            32'd0;
      @1
         $opcode[6:0] = $instr[6:0];
         $funct3[2:0] = $instr[14:12];
         $funct7[6:0] = $instr[31:25];
         $dec_bits[10:0] = {$funct7[5], $funct3, $opcode};
         $is_i = ($opcode == 7'h13) || ($opcode == 7'h03) || ($opcode == 7'h67);
         $is_s = $opcode == 7'h23;
         $is_b = $opcode == 7'h63;
         $is_u = ($opcode == 7'h37) || ($opcode == 7'h17);
         $is_j = $opcode == 7'h6f;
         $imm[31:0] = $is_i ? {{21{$instr[31]}}, $instr[30:20]} :
                      $is_s ? {{21{$instr[31]}}, $instr[30:25], $instr[11:7]} :
                      $is_b ? {{20{$instr[31]}}, $instr[7], $instr[30:25], $instr[11:8], 1'b0} :
                      $is_u ? {$instr[31:12], 12'b0} :
                      $is_j ? {{12{$instr[31]}}, $instr[19:12], $instr[20], $instr[30:21], 1'b0} : 32'd0;
         $is_add = $dec_bits ==? 11'b0_000_0110011;
         $is_sub = $dec_bits ==? 11'b1_000_0110011;
         $is_and = $dec_bits ==? 11'b0_111_0110011;
         $is_or = $dec_bits ==? 11'b0_110_0110011;
         $is_xor = $dec_bits ==? 11'b0_100_0110011;
         $is_sll = $dec_bits ==? 11'b0_001_0110011;
         $is_srl = $dec_bits ==? 11'b0_101_0110011;
         $is_sra = $dec_bits ==? 11'b1_101_0110011;
         $is_slt = $dec_bits ==? 11'b0_010_0110011;
         $is_sltu = $dec_bits ==? 11'b0_011_0110011;
         $is_addi = $dec_bits ==? 11'bx_000_0010011;
         $is_andi = $dec_bits ==? 11'bx_111_0010011;
         $is_ori = $dec_bits ==? 11'bx_110_0010011;
         $is_xori = $dec_bits ==? 11'bx_100_0010011;
         $is_slli = $dec_bits ==? 11'b0_001_0010011;
         $is_srli = $dec_bits ==? 11'b0_101_0010011;
         $is_srai = $dec_bits ==? 11'b1_101_0010011;
         $is_slti = $dec_bits ==? 11'bx_010_0010011;
         $is_sltiu = $dec_bits ==? 11'bx_011_0010011;
         $is_lui = $dec_bits ==? 11'bx_xxx_0110111;
         $is_auipc = $dec_bits ==? 11'bx_xxx_0010111;
         $is_jal = $dec_bits ==? 11'bx_xxx_1101111;
         $is_jalr = $dec_bits ==? 11'bx_000_1100111;
         $is_load = $opcode == 7'h03;
         $is_sb = $dec_bits ==? 11'bx_000_0100011;
         $is_sh = $dec_bits ==? 11'bx_001_0100011;
         $is_sw = $dec_bits ==? 11'bx_010_0100011;
         $is_beq = $dec_bits ==? 11'bx_000_1100011;
         $is_bne = $dec_bits ==? 11'bx_001_1100011;
         $is_blt = $dec_bits ==? 11'bx_100_1100011;
         $is_bge = $dec_bits ==? 11'bx_101_1100011;
         $is_bltu = $dec_bits ==? 11'bx_110_1100011;
         $is_bgeu = $dec_bits ==? 11'bx_111_1100011;
      @2
         $a[31:0] =
            ($test_id == 6'd0) ? 32'h0000000c : // ADD
            ($test_id == 6'd1) ? 32'h0000000c : // SUB
            ($test_id == 6'd2) ? 32'h0000000c : // AND
            ($test_id == 6'd3) ? 32'h0000000c : // OR
            ($test_id == 6'd4) ? 32'h0000000c : // XOR
            ($test_id == 6'd5) ? 32'h00000005 : // SLL
            ($test_id == 6'd6) ? 32'h00000014 : // SRL
            ($test_id == 6'd7) ? 32'hfffffff8 : // SRA
            ($test_id == 6'd8) ? 32'hffffffff : // SLT
            ($test_id == 6'd9) ? 32'hffffffff : // SLTU
            ($test_id == 6'd10) ? 32'h0000000c : // ADDI
            ($test_id == 6'd11) ? 32'h0000000c : // ANDI
            ($test_id == 6'd12) ? 32'h0000000c : // ORI
            ($test_id == 6'd13) ? 32'h0000000c : // XORI
            ($test_id == 6'd14) ? 32'h00000005 : // SLLI
            ($test_id == 6'd15) ? 32'h00000014 : // SRLI
            ($test_id == 6'd16) ? 32'hfffffff8 : // SRAI
            ($test_id == 6'd17) ? 32'hffffffff : // SLTI
            ($test_id == 6'd18) ? 32'hffffffff : // SLTIU
            ($test_id == 6'd19) ? 32'h00000000 : // LUI
            ($test_id == 6'd20) ? 32'h00000000 : // AUIPC
            ($test_id == 6'd21) ? 32'h00000000 : // JAL
            ($test_id == 6'd22) ? 32'h0000000c : // JALR
            32'd0;
         $reg_b[31:0] =
            ($test_id == 6'd0) ? 32'h00000005 : // ADD
            ($test_id == 6'd1) ? 32'h00000005 : // SUB
            ($test_id == 6'd2) ? 32'h00000005 : // AND
            ($test_id == 6'd3) ? 32'h00000005 : // OR
            ($test_id == 6'd4) ? 32'h00000005 : // XOR
            ($test_id == 6'd5) ? 32'h00000002 : // SLL
            ($test_id == 6'd6) ? 32'h00000002 : // SRL
            ($test_id == 6'd7) ? 32'h00000002 : // SRA
            ($test_id == 6'd8) ? 32'h00000005 : // SLT
            ($test_id == 6'd9) ? 32'h00000005 : // SLTU
            ($test_id == 6'd10) ? 32'h00000005 : // ADDI
            ($test_id == 6'd11) ? 32'h00000005 : // ANDI
            ($test_id == 6'd12) ? 32'h00000005 : // ORI
            ($test_id == 6'd13) ? 32'h00000005 : // XORI
            ($test_id == 6'd14) ? 32'h00000002 : // SLLI
            ($test_id == 6'd15) ? 32'h00000002 : // SRLI
            ($test_id == 6'd16) ? 32'h00000002 : // SRAI
            ($test_id == 6'd17) ? 32'h00000005 : // SLTI
            ($test_id == 6'd18) ? 32'h00000005 : // SLTIU
            ($test_id == 6'd19) ? 32'h00000000 : // LUI
            ($test_id == 6'd20) ? 32'h00000000 : // AUIPC
            ($test_id == 6'd21) ? 32'h00000000 : // JAL
            ($test_id == 6'd22) ? 32'h00000000 : // JALR
            32'd0;
         $b[31:0] = $is_i ? $imm : $reg_b;
         $shamt[4:0] = $b[4:0];
         $ult = $a < $b;
         $slt_result = ($a[31] != $b[31]) ? $a[31] : $ult;
         $extended[63:0] = {{32{$a[31]}}, $a} >> $shamt;
      @3
         $result[31:0] =
            ($is_add || $is_addi) ? $a + $b :
            $is_sub ? $a - $b :
            ($is_and || $is_andi) ? $a & $b :
            ($is_or || $is_ori) ? $a | $b :
            ($is_xor || $is_xori) ? $a ^ $b :
            ($is_sll || $is_slli) ? $a << $shamt :
            ($is_srl || $is_srli) ? $a >> $shamt :
            ($is_sra || $is_srai) ? $extended[31:0] :
            ($is_slt || $is_slti) ? {31'b0, $slt_result} :
            ($is_sltu || $is_sltiu) ? {31'b0, $ult} :
            $is_lui ? $imm :
            $is_auipc ? $pc + $imm :
            ($is_jal || $is_jalr) ? $pc + 32'd4 :
            ($is_load || $is_s) ? $a + $imm : 32'd0;
         $taken_br = ($is_beq && ($a == $b)) ||
                     ($is_bne && ($a != $b)) ||
                     ($is_blt && $slt_result) ||
                     ($is_bge && !$slt_result) ||
                     ($is_bltu && $ult) ||
                     ($is_bgeu && !$ult);
         $expected[31:0] =
            ($test_id == 6'd0) ? 32'h00000011 : // ADD
            ($test_id == 6'd1) ? 32'h00000007 : // SUB
            ($test_id == 6'd2) ? 32'h00000004 : // AND
            ($test_id == 6'd3) ? 32'h0000000d : // OR
            ($test_id == 6'd4) ? 32'h00000009 : // XOR
            ($test_id == 6'd5) ? 32'h00000014 : // SLL
            ($test_id == 6'd6) ? 32'h00000005 : // SRL
            ($test_id == 6'd7) ? 32'hfffffffe : // SRA
            ($test_id == 6'd8) ? 32'h00000001 : // SLT
            ($test_id == 6'd9) ? 32'h00000000 : // SLTU
            ($test_id == 6'd10) ? 32'h00000011 : // ADDI
            ($test_id == 6'd11) ? 32'h00000004 : // ANDI
            ($test_id == 6'd12) ? 32'h0000000d : // ORI
            ($test_id == 6'd13) ? 32'h00000009 : // XORI
            ($test_id == 6'd14) ? 32'h00000014 : // SLLI
            ($test_id == 6'd15) ? 32'h00000005 : // SRLI
            ($test_id == 6'd16) ? 32'hfffffffe : // SRAI
            ($test_id == 6'd17) ? 32'h00000001 : // SLTI
            ($test_id == 6'd18) ? 32'h00000000 : // SLTIU
            ($test_id == 6'd19) ? 32'h12345000 : // LUI
            ($test_id == 6'd20) ? 32'h00001050 : // AUIPC
            ($test_id == 6'd21) ? 32'h00000058 : // JAL
            ($test_id == 6'd22) ? 32'h0000005c : // JALR
            32'd0;
         $decode_ok =
            ($test_id == 6'd0) ? $is_add :
            ($test_id == 6'd1) ? $is_sub :
            ($test_id == 6'd2) ? $is_and :
            ($test_id == 6'd3) ? $is_or :
            ($test_id == 6'd4) ? $is_xor :
            ($test_id == 6'd5) ? $is_sll :
            ($test_id == 6'd6) ? $is_srl :
            ($test_id == 6'd7) ? $is_sra :
            ($test_id == 6'd8) ? $is_slt :
            ($test_id == 6'd9) ? $is_sltu :
            ($test_id == 6'd10) ? $is_addi :
            ($test_id == 6'd11) ? $is_andi :
            ($test_id == 6'd12) ? $is_ori :
            ($test_id == 6'd13) ? $is_xori :
            ($test_id == 6'd14) ? $is_slli :
            ($test_id == 6'd15) ? $is_srli :
            ($test_id == 6'd16) ? $is_srai :
            ($test_id == 6'd17) ? $is_slti :
            ($test_id == 6'd18) ? $is_sltiu :
            ($test_id == 6'd19) ? $is_lui :
            ($test_id == 6'd20) ? $is_auipc :
            ($test_id == 6'd21) ? $is_jal :
            ($test_id == 6'd22) ? $is_jalr :
            1'b0;
         $test_ok = $decode_ok && ($result == $expected);
         $error_seen = $reset ? 1'b0 : >>1$error_seen || !$test_ok;
         *passed = !$reset && ($test_id == 6'd22) && $test_ok && !$error_seen;
         *failed = !$reset && $error_seen;
\SV
   endmodule
