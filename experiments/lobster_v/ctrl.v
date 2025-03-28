

module top ( 
    opcode0, opcode1, opcode2, opcode3, opcode4, opext0, opext1,
    oseloregdst0, oseloregdst1, oselopB0, oselopB1, oaluop0, oaluop1,
    oaluop2, oaluopext0, oaluopext1, oaluopext2, oaluopext3, ohalt,
    oregwrite, oselpcopA, oselpcopB, obeqz, obnez, obgez, obltz, ojump,
    oCin, oinvA, oinvB, osign, omemwrite, oselwb  );
  input  opcode0, opcode1, opcode2, opcode3, opcode4, opext0, opext1;
  output oseloregdst0, oseloregdst1, oselopB0, oselopB1, oaluop0, oaluop1,
    oaluop2, oaluopext0, oaluopext1, oaluopext2, oaluopext3, ohalt,
    oregwrite, oselpcopA, oselpcopB, obeqz, obnez, obgez, obltz, ojump,
    oCin, oinvA, oinvB, osign, omemwrite, oselwb;
  wire new_n34, new_n35, new_n36, new_n37, new_n38, new_n39, new_n40,
    new_n41, new_n42, new_n43, new_n44, new_n45, new_n46, new_n47, new_n48,
    new_n49, new_n50, new_n51, new_n53, new_n54, new_n55, new_n56, new_n57,
    new_n58, new_n59, new_n60, new_n61, new_n62, new_n63, new_n64, new_n65,
    new_n66, new_n67, new_n68, new_n70, new_n71, new_n72, new_n73, new_n74,
    new_n75, new_n76, new_n77, new_n79, new_n80, new_n81, new_n82, new_n83,
    new_n84, new_n85, new_n86, new_n88, new_n89, new_n90, new_n91, new_n92,
    new_n93, new_n94, new_n95, new_n96, new_n97, new_n98, new_n99,
    new_n100, new_n101, new_n102, new_n103, new_n104, new_n105, new_n106,
    new_n107, new_n108, new_n109, new_n110, new_n111, new_n113, new_n114,
    new_n115, new_n116, new_n118, new_n119, new_n120, new_n121, new_n122,
    new_n123, new_n124, new_n125, new_n127, new_n128, new_n129, new_n130,
    new_n131, new_n132, new_n133, new_n135, new_n136, new_n137, new_n138,
    new_n139, new_n141, new_n142, new_n143, new_n145, new_n146, new_n147,
    new_n148, new_n149, new_n150, new_n151, new_n152, new_n153, new_n154,
    new_n155, new_n157, new_n159, new_n160, new_n161, new_n162, new_n163,
    new_n164, new_n165, new_n166, new_n167, new_n168, new_n169, new_n170,
    new_n171, new_n176, new_n178, new_n180, new_n183, new_n184, new_n185,
    new_n186, new_n187, new_n188, new_n189, new_n190, new_n191, new_n192,
    new_n193, new_n195, new_n196, new_n197, new_n198, new_n199, new_n200,
    new_n201, new_n202, new_n204, new_n205, new_n206, new_n207, new_n210,
    new_n211, new_n213;
  assign new_n34 = opcode4 & opcode3;
  assign new_n35 = ~opcode0;
  assign new_n36 = ~opcode1;
  assign new_n37 = new_n36 & new_n35;
  assign new_n38 = ~new_n37;
  assign new_n39 = new_n38 & new_n34;
  assign new_n40 = ~new_n39;
  assign new_n41 = ~new_n34;
  assign new_n42 = ~opcode3;
  assign new_n43 = ~opcode4;
  assign new_n44 = new_n43 & new_n42;
  assign new_n45 = new_n44 & opcode1;
  assign new_n46 = ~new_n45;
  assign new_n47 = new_n46 & new_n41;
  assign new_n48 = ~new_n47;
  assign new_n49 = new_n48 & opcode2;
  assign new_n50 = ~new_n49;
  assign new_n51 = new_n50 & new_n40;
  assign oseloregdst0 = ~new_n51;
  assign new_n53 = ~opcode2;
  assign new_n54 = opcode4 & new_n42;
  assign new_n55 = ~new_n54;
  assign new_n56 = new_n55 & opcode1;
  assign new_n57 = ~new_n56;
  assign new_n58 = opcode3 & new_n35;
  assign new_n59 = new_n58 & opcode4;
  assign new_n60 = ~new_n59;
  assign new_n61 = new_n60 & new_n36;
  assign new_n62 = ~new_n61;
  assign new_n63 = new_n62 & new_n57;
  assign new_n64 = ~new_n63;
  assign new_n65 = new_n64 & new_n53;
  assign new_n66 = ~new_n65;
  assign new_n67 = new_n46 & opcode2;
  assign new_n68 = ~new_n67;
  assign oseloregdst1 = new_n68 & new_n66;
  assign new_n70 = new_n54 & new_n35;
  assign new_n71 = ~new_n70;
  assign new_n72 = new_n71 & opcode1;
  assign new_n73 = new_n43 & opcode3;
  assign new_n74 = ~new_n73;
  assign new_n75 = new_n74 & new_n72;
  assign new_n76 = ~new_n75;
  assign new_n77 = new_n62 & new_n53;
  assign oselopB0 = new_n77 & new_n76;
  assign new_n79 = new_n34 & opcode0;
  assign new_n80 = ~new_n79;
  assign new_n81 = ~new_n44;
  assign new_n82 = new_n53 & new_n36;
  assign new_n83 = ~new_n82;
  assign new_n84 = new_n83 & opcode3;
  assign new_n85 = ~new_n84;
  assign new_n86 = new_n85 & new_n81;
  assign oselopB1 = new_n86 & new_n80;
  assign new_n88 = ~opext1;
  assign new_n89 = new_n88 & opcode4;
  assign new_n90 = ~new_n89;
  assign new_n91 = new_n90 & opcode3;
  assign new_n92 = ~opext0;
  assign new_n93 = new_n92 & opcode4;
  assign new_n94 = new_n93 & opext1;
  assign new_n95 = ~new_n94;
  assign new_n96 = new_n95 & new_n91;
  assign new_n97 = new_n96 & opcode0;
  assign new_n98 = ~new_n97;
  assign new_n99 = new_n59 & opext0;
  assign new_n100 = ~new_n99;
  assign new_n101 = new_n100 & new_n98;
  assign new_n102 = ~new_n101;
  assign new_n103 = new_n102 & opcode1;
  assign new_n104 = ~new_n103;
  assign new_n105 = new_n104 & new_n53;
  assign new_n106 = ~new_n105;
  assign new_n107 = opcode2 & new_n35;
  assign new_n108 = ~new_n107;
  assign new_n109 = new_n55 & opcode2;
  assign new_n110 = ~new_n109;
  assign new_n111 = new_n110 & new_n108;
  assign oaluop0 = new_n111 & new_n106;
  assign new_n113 = ~new_n91;
  assign new_n114 = new_n113 & new_n53;
  assign new_n115 = ~new_n114;
  assign new_n116 = new_n110 & opcode1;
  assign oaluop1 = new_n116 & new_n115;
  assign new_n118 = opcode1 & opcode0;
  assign new_n119 = ~new_n118;
  assign new_n120 = new_n119 & new_n34;
  assign new_n121 = new_n120 & new_n53;
  assign new_n122 = ~new_n121;
  assign new_n123 = new_n41 & opcode2;
  assign new_n124 = ~new_n123;
  assign new_n125 = new_n124 & new_n81;
  assign oaluop2 = new_n125 & new_n122;
  assign new_n127 = new_n80 & new_n46;
  assign new_n128 = ~new_n127;
  assign new_n129 = new_n128 & opcode2;
  assign new_n130 = ~new_n129;
  assign new_n131 = new_n82 & new_n59;
  assign new_n132 = ~new_n131;
  assign new_n133 = new_n132 & new_n130;
  assign oaluopext0 = ~new_n133;
  assign new_n135 = new_n72 & new_n53;
  assign new_n136 = ~new_n135;
  assign new_n137 = new_n123 & new_n81;
  assign new_n138 = ~new_n137;
  assign new_n139 = new_n138 & opcode1;
  assign oaluopext1 = new_n139 & new_n136;
  assign new_n141 = new_n82 & new_n41;
  assign new_n142 = ~new_n141;
  assign new_n143 = new_n142 & new_n68;
  assign oaluopext2 = new_n143 & new_n136;
  assign new_n145 = opcode4 & new_n36;
  assign new_n146 = ~new_n145;
  assign new_n147 = new_n146 & opcode3;
  assign new_n148 = ~new_n147;
  assign new_n149 = opcode1 & new_n35;
  assign new_n150 = ~new_n149;
  assign new_n151 = new_n150 & new_n54;
  assign new_n152 = ~new_n151;
  assign new_n153 = new_n152 & new_n53;
  assign new_n154 = new_n153 & new_n148;
  assign new_n155 = ~new_n154;
  assign oaluopext3 = new_n155 & new_n110;
  assign new_n157 = new_n44 & new_n35;
  assign ohalt = new_n157 & new_n82;
  assign new_n159 = new_n38 & opcode4;
  assign new_n160 = ~new_n159;
  assign new_n161 = new_n160 & new_n42;
  assign new_n162 = ~new_n161;
  assign new_n163 = new_n162 & new_n53;
  assign new_n164 = ~new_n163;
  assign new_n165 = new_n42 & opcode1;
  assign new_n166 = ~new_n165;
  assign new_n167 = new_n166 & new_n43;
  assign new_n168 = ~new_n167;
  assign new_n169 = new_n168 & opcode2;
  assign new_n170 = ~new_n169;
  assign new_n171 = new_n170 & new_n164;
  assign oregwrite = ~new_n171;
  assign ojump = new_n44 & opcode2;
  assign oselpcopA = ojump & opcode0;
  assign oselpcopB = new_n107 & new_n44;
  assign new_n176 = new_n73 & new_n36;
  assign obeqz = new_n176 & new_n107;
  assign new_n178 = new_n176 & opcode0;
  assign obnez = new_n178 & opcode2;
  assign new_n180 = new_n73 & opcode2;
  assign obgez = new_n180 & new_n118;
  assign obltz = new_n180 & new_n149;
  assign new_n183 = ~new_n120;
  assign new_n184 = new_n183 & opcode2;
  assign new_n185 = ~new_n184;
  assign new_n186 = ~new_n93;
  assign new_n187 = new_n186 & opcode3;
  assign new_n188 = new_n187 & new_n118;
  assign new_n189 = ~new_n188;
  assign new_n190 = ~new_n178;
  assign new_n191 = new_n190 & new_n53;
  assign new_n192 = new_n191 & new_n189;
  assign new_n193 = ~new_n192;
  assign oCin = new_n193 & new_n185;
  assign new_n195 = ~new_n176;
  assign new_n196 = opext0 & opcode1;
  assign new_n197 = new_n196 & new_n88;
  assign new_n198 = new_n197 & new_n34;
  assign new_n199 = ~new_n198;
  assign new_n200 = new_n199 & new_n195;
  assign new_n201 = ~new_n200;
  assign new_n202 = new_n53 & opcode0;
  assign oinvA = new_n202 & new_n201;
  assign new_n204 = new_n118 & new_n96;
  assign new_n205 = ~new_n204;
  assign new_n206 = new_n205 & new_n53;
  assign new_n207 = ~new_n206;
  assign oinvB = new_n207 & new_n185;
  assign new_n210 = ~opcode1 ^ ~new_n35;
  assign new_n211 = new_n54 & new_n53;
  assign omemwrite = new_n211 & new_n210;
  assign new_n213 = new_n54 & new_n36;
  assign oselwb = new_n213 & new_n202;
  assign osign = 1'b1;
endmodule


