// Benchmark "hd01" written by ABC on Thu Mar 27 16:00:18 2025

module top ( 
    i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15,
    i16, i17, i18, i19, i20, i21, i22, i23, i24, i25, i26, i27, i28, i29,
    i30, i31,
    om_0, om_1, om_2, om_3, om_4, om_5, om_6, om_7, om_8, om_9, om_10,
    om_11, om_12, om_13, om_14, om_15, om_16, om_17, om_18, om_19, om_20,
    om_21, om_22, om_23, om_24, om_25, om_26, om_27, om_28, om_29, om_30,
    om_31  );
  input  i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14,
    i15, i16, i17, i18, i19, i20, i21, i22, i23, i24, i25, i26, i27, i28,
    i29, i30, i31;
  output om_0, om_1, om_2, om_3, om_4, om_5, om_6, om_7, om_8, om_9, om_10,
    om_11, om_12, om_13, om_14, om_15, om_16, om_17, om_18, om_19, om_20,
    om_21, om_22, om_23, om_24, om_25, om_26, om_27, om_28, om_29, om_30,
    om_31;
  wire new_n30, new_n147, new_n29, new_n143, new_n148, new_n31, new_n149,
    new_n25, new_n127, new_n24, new_n124, new_n128, new_n26, new_n131,
    new_n132, new_n27, new_n135, new_n136, new_n28, new_n139, new_n140,
    new_n150, new_n21, new_n111, new_n20, new_n108, new_n112, new_n22,
    new_n115, new_n116, new_n23, new_n119, new_n120, new_n17, new_n96,
    new_n16, new_n93, new_n97, new_n18, new_n100, new_n101, new_n19,
    new_n104, new_n105, new_n121, new_n15, new_n87, new_n14, new_n83,
    new_n88, new_n13, new_n79, new_n12, new_n76, new_n80, new_n89, new_n11,
    new_n71, new_n10, new_n68, new_n72, new_n9, new_n64, new_n8, new_n61,
    new_n65, new_n73, new_n90, new_n7, new_n56, new_n6, new_n53, new_n57,
    new_n5, new_n49, new_n4, new_n46, new_n50, new_n58, new_n3, new_n42,
    new_n2, new_n39, new_n43, new_n1, new_n36, new_n0, new_n34, new_n37,
    new_n44, new_n59, new_n91, new_n122, new_n151, new_n144, new_n145,
    new_n146, new_n141, new_n142, new_n137, new_n138, new_n133, new_n134,
    new_n129, new_n130, new_n125, new_n126, new_n123, new_n117, new_n106,
    new_n118, new_n113, new_n114, new_n109, new_n110, new_n107, new_n102,
    new_n103, new_n98, new_n99, new_n94, new_n95, new_n92, new_n84,
    new_n85, new_n74, new_n86, new_n81, new_n82, new_n77, new_n78, new_n75,
    new_n69, new_n66, new_n70, new_n67, new_n62, new_n63, new_n60, new_n54,
    new_n51, new_n55, new_n52, new_n47, new_n48, new_n45, new_n40, new_n41,
    new_n38, new_n35;
  assign new_n30 = i30;
  assign new_n147 = ~new_n30;
  assign new_n29 = i29;
  assign new_n143 = ~new_n29;
  assign new_n148 = new_n143 & new_n147;
  assign new_n31 = i31;
  assign new_n149 = new_n31 & new_n148;
  assign new_n25 = i25;
  assign new_n127 = ~new_n25;
  assign new_n24 = i24;
  assign new_n124 = ~new_n24;
  assign new_n128 = new_n124 & new_n127;
  assign new_n26 = i26;
  assign new_n131 = ~new_n26;
  assign new_n132 = new_n131 & new_n128;
  assign new_n27 = i27;
  assign new_n135 = ~new_n27;
  assign new_n136 = new_n135 & new_n132;
  assign new_n28 = i28;
  assign new_n139 = ~new_n28;
  assign new_n140 = new_n139 & new_n136;
  assign new_n150 = new_n140 & new_n149;
  assign new_n21 = i21;
  assign new_n111 = ~new_n21;
  assign new_n20 = i20;
  assign new_n108 = ~new_n20;
  assign new_n112 = new_n108 & new_n111;
  assign new_n22 = i22;
  assign new_n115 = ~new_n22;
  assign new_n116 = new_n115 & new_n112;
  assign new_n23 = i23;
  assign new_n119 = ~new_n23;
  assign new_n120 = new_n119 & new_n116;
  assign new_n17 = i17;
  assign new_n96 = ~new_n17;
  assign new_n16 = i16;
  assign new_n93 = ~new_n16;
  assign new_n97 = new_n93 & new_n96;
  assign new_n18 = i18;
  assign new_n100 = ~new_n18;
  assign new_n101 = new_n100 & new_n97;
  assign new_n19 = i19;
  assign new_n104 = ~new_n19;
  assign new_n105 = new_n104 & new_n101;
  assign new_n121 = new_n105 & new_n120;
  assign new_n15 = i15;
  assign new_n87 = ~new_n15;
  assign new_n14 = i14;
  assign new_n83 = ~new_n14;
  assign new_n88 = new_n83 & new_n87;
  assign new_n13 = i13;
  assign new_n79 = ~new_n13;
  assign new_n12 = i12;
  assign new_n76 = ~new_n12;
  assign new_n80 = new_n76 & new_n79;
  assign new_n89 = new_n80 & new_n88;
  assign new_n11 = i11;
  assign new_n71 = ~new_n11;
  assign new_n10 = i10;
  assign new_n68 = ~new_n10;
  assign new_n72 = new_n68 & new_n71;
  assign new_n9 = i9;
  assign new_n64 = ~new_n9;
  assign new_n8 = i8;
  assign new_n61 = ~new_n8;
  assign new_n65 = new_n61 & new_n64;
  assign new_n73 = new_n65 & new_n72;
  assign new_n90 = new_n73 & new_n89;
  assign new_n7 = i7;
  assign new_n56 = ~new_n7;
  assign new_n6 = i6;
  assign new_n53 = ~new_n6;
  assign new_n57 = new_n53 & new_n56;
  assign new_n5 = i5;
  assign new_n49 = ~new_n5;
  assign new_n4 = i4;
  assign new_n46 = ~new_n4;
  assign new_n50 = new_n46 & new_n49;
  assign new_n58 = new_n50 & new_n57;
  assign new_n3 = i3;
  assign new_n42 = ~new_n3;
  assign new_n2 = i2;
  assign new_n39 = ~new_n2;
  assign new_n43 = new_n39 & new_n42;
  assign new_n1 = i1;
  assign new_n36 = ~new_n1;
  assign new_n0 = i0;
  assign new_n34 = ~new_n0;
  assign new_n37 = new_n34 & new_n36;
  assign new_n44 = new_n37 & new_n43;
  assign new_n59 = new_n44 & new_n58;
  assign new_n91 = new_n59 & new_n90;
  assign new_n122 = new_n91 & new_n121;
  assign new_n151 = new_n122 & new_n150;
  assign new_n144 = new_n143 & new_n30;
  assign new_n145 = new_n140 & new_n144;
  assign new_n146 = new_n122 & new_n145;
  assign new_n141 = new_n29 & new_n140;
  assign new_n142 = new_n122 & new_n141;
  assign new_n137 = new_n28 & new_n136;
  assign new_n138 = new_n122 & new_n137;
  assign new_n133 = new_n27 & new_n132;
  assign new_n134 = new_n122 & new_n133;
  assign new_n129 = new_n26 & new_n128;
  assign new_n130 = new_n122 & new_n129;
  assign new_n125 = new_n124 & new_n25;
  assign new_n126 = new_n122 & new_n125;
  assign new_n123 = new_n24 & new_n122;
  assign new_n117 = new_n23 & new_n116;
  assign new_n106 = new_n91 & new_n105;
  assign new_n118 = new_n106 & new_n117;
  assign new_n113 = new_n22 & new_n112;
  assign new_n114 = new_n106 & new_n113;
  assign new_n109 = new_n108 & new_n21;
  assign new_n110 = new_n106 & new_n109;
  assign new_n107 = new_n20 & new_n106;
  assign new_n102 = new_n19 & new_n101;
  assign new_n103 = new_n91 & new_n102;
  assign new_n98 = new_n18 & new_n97;
  assign new_n99 = new_n91 & new_n98;
  assign new_n94 = new_n93 & new_n17;
  assign new_n95 = new_n91 & new_n94;
  assign new_n92 = new_n16 & new_n91;
  assign new_n84 = new_n83 & new_n15;
  assign new_n85 = new_n80 & new_n84;
  assign new_n74 = new_n59 & new_n73;
  assign new_n86 = new_n74 & new_n85;
  assign new_n81 = new_n14 & new_n80;
  assign new_n82 = new_n74 & new_n81;
  assign new_n77 = new_n76 & new_n13;
  assign new_n78 = new_n74 & new_n77;
  assign new_n75 = new_n12 & new_n74;
  assign new_n69 = new_n68 & new_n11;
  assign new_n66 = new_n59 & new_n65;
  assign new_n70 = new_n66 & new_n69;
  assign new_n67 = new_n10 & new_n66;
  assign new_n62 = new_n61 & new_n9;
  assign new_n63 = new_n59 & new_n62;
  assign new_n60 = new_n8 & new_n59;
  assign new_n54 = new_n53 & new_n7;
  assign new_n51 = new_n44 & new_n50;
  assign new_n55 = new_n51 & new_n54;
  assign new_n52 = new_n6 & new_n51;
  assign new_n47 = new_n46 & new_n5;
  assign new_n48 = new_n44 & new_n47;
  assign new_n45 = new_n4 & new_n44;
  assign new_n40 = new_n39 & new_n3;
  assign new_n41 = new_n37 & new_n40;
  assign new_n38 = new_n2 & new_n37;
  assign new_n35 = new_n34 & new_n1;
  assign om_0 = new_n0;
  assign om_1 = new_n35;
  assign om_2 = new_n38;
  assign om_3 = new_n41;
  assign om_4 = new_n45;
  assign om_5 = new_n48;
  assign om_6 = new_n52;
  assign om_7 = new_n55;
  assign om_8 = new_n60;
  assign om_9 = new_n63;
  assign om_10 = new_n67;
  assign om_11 = new_n70;
  assign om_12 = new_n75;
  assign om_13 = new_n78;
  assign om_14 = new_n82;
  assign om_15 = new_n86;
  assign om_16 = new_n92;
  assign om_17 = new_n95;
  assign om_18 = new_n99;
  assign om_19 = new_n103;
  assign om_20 = new_n107;
  assign om_21 = new_n110;
  assign om_22 = new_n114;
  assign om_23 = new_n118;
  assign om_24 = new_n123;
  assign om_25 = new_n126;
  assign om_26 = new_n130;
  assign om_27 = new_n134;
  assign om_28 = new_n138;
  assign om_29 = new_n142;
  assign om_30 = new_n146;
  assign om_31 = new_n151;
endmodule


