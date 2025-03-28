// Benchmark "ctrl" written by ABC on Thu Mar 27 16:00:18 2025

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
  wire new_n0, new_n3, new_n17, new_n4, new_n29, new_n495, new_n2, new_n28,
    new_n1, new_n11, new_n57, new_n1489331, new_n10, new_n184, new_n316,
    new_n214763, new_n189, new_n93, new_n94, new_n9, new_n95, new_n6,
    new_n63, new_n64, new_n65, new_n8381, new_n29947, new_n5, new_n67,
    new_n68, new_n29948, new_n2997, new_n179, new_n2441, new_n2443,
    new_n10954, new_n516, new_n320, new_n18, new_n151, new_n170, new_n8445,
    new_n987991, new_n1102, new_n274, new_n236, new_n173, new_n174,
    new_n987992, new_n1500727, new_n1218, new_n162, new_n163, new_n48,
    new_n360, new_n1037724, new_n1037726, new_n1037725, new_n1037727,
    new_n1498138, new_n1498140, new_n172461, new_n19, new_n148, new_n155,
    new_n124, new_n140797, new_n1590, new_n240, new_n140602, new_n8385,
    new_n153, new_n16003, new_n82, new_n1488839, new_n272506, new_n283,
    new_n162341, new_n13, new_n2669, new_n136, new_n140, new_n141,
    new_n142, new_n1434, new_n1435, new_n146, new_n736, new_n16471,
    new_n287, new_n79153, new_n1041546, new_n1830, new_n106989, new_n3862,
    new_n201107, new_n201108, new_n201109, new_n201110, new_n201111,
    new_n231889, new_n947, new_n120, new_n121, new_n12917, new_n12918,
    new_n310, new_n231890, new_n201113, new_n1177, new_n455, new_n84,
    new_n15835, new_n10865, new_n16, new_n230, new_n86742, new_n271546,
    new_n351, new_n8414, new_n27480, new_n40126, new_n271628, new_n271629,
    new_n271630, new_n271631, new_n271632, new_n271633, new_n559, new_n485,
    new_n42, new_n43, new_n271634, new_n271635, new_n171475, new_n382,
    new_n1694, new_n112, new_n113, new_n2072, new_n403, new_n47, new_n1559,
    new_n192268, new_n114, new_n169757, new_n1132, new_n272, new_n106,
    new_n107, new_n988, new_n5262, new_n2126, new_n5260, new_n5261,
    new_n5263, new_n5264, new_n985, new_n5259, new_n6077, new_n104,
    new_n105, new_n172280, new_n79290, new_n1754, new_n25124, new_n186892,
    new_n100, new_n15559, new_n209, new_n28573, new_n1023151, new_n171984,
    new_n30, new_n2688, new_n91, new_n1069, new_n89, new_n380, new_n168794,
    new_n3714, new_n3715, new_n86, new_n8431, new_n74, new_n75, new_n308,
    new_n11955, new_n8377, new_n72, new_n73, new_n11956, new_n1063,
    new_n80, new_n81, new_n171179, new_n1446, new_n1447, new_n61, new_n279,
    new_n54, new_n55, new_n610648, new_n1512, new_n730, new_n967, new_n968,
    new_n52, new_n2132, new_n986, new_n2121, new_n2122, new_n2123,
    new_n2124, new_n2125, new_n2127, new_n2128, new_n2131, new_n2133,
    new_n2129, new_n2130, new_n2134, new_n2135, new_n2136, new_n2137,
    new_n50, new_n51, new_n172303, new_n33, new_n10827, new_n2433,
    new_n2435, new_n38, new_n347, new_n11511, new_n232389, new_n232390,
    new_n172572, new_n4123, new_n102016, new_n173690, new_n993, new_n2276,
    new_n173255, new_n173256, new_n173691, new_n173692, new_n173693,
    new_n173694, new_n173697, new_n173698, new_n173695, new_n173696,
    new_n173699, new_n173700, new_n173701, new_n24, new_n25, new_n14,
    new_n501, new_n535;
  assign new_n0 = opcode0;
  assign new_n3 = opcode3;
  assign new_n17 = ~new_n3;
  assign new_n4 = opcode4;
  assign new_n29 = new_n4 & new_n17;
  assign new_n495 = new_n29 & new_n0;
  assign new_n2 = opcode2;
  assign new_n28 = ~new_n2;
  assign new_n1 = opcode1;
  assign new_n11 = ~new_n1;
  assign new_n57 = new_n11 & new_n28;
  assign new_n1489331 = new_n57 & new_n495;
  assign new_n10 = ~new_n0;
  assign new_n184 = new_n10 ^ new_n1;
  assign new_n316 = new_n28 & new_n184;
  assign new_n214763 = new_n29 & new_n316;
  assign new_n189 = 1'b1;
  assign new_n93 = new_n0 & new_n1;
  assign new_n94 = ~new_n93;
  assign new_n9 = new_n3 & new_n4;
  assign new_n95 = new_n9 & new_n94;
  assign new_n6 = opext1;
  assign new_n63 = ~new_n6;
  assign new_n64 = new_n4 & new_n63;
  assign new_n65 = ~new_n64;
  assign new_n8381 = new_n65 & new_n93;
  assign new_n29947 = new_n6 & new_n3;
  assign new_n5 = opext0;
  assign new_n67 = ~new_n5;
  assign new_n68 = new_n4 & new_n67;
  assign new_n29948 = new_n68 & new_n29947;
  assign new_n2997 = new_n3 ^ new_n29948;
  assign new_n179 = new_n2997 & new_n8381;
  assign new_n2441 = new_n179 ^ new_n95;
  assign new_n2443 = new_n2441 & new_n28;
  assign new_n10954 = new_n95 ^ new_n2443;
  assign new_n516 = new_n1 & new_n3;
  assign new_n320 = new_n516 ^ new_n3;
  assign new_n18 = ~new_n4;
  assign new_n151 = new_n18 & new_n320;
  assign new_n170 = ~new_n151;
  assign new_n8445 = new_n28 & new_n0;
  assign new_n987991 = new_n8445 & new_n170;
  assign new_n1102 = new_n1 & new_n4;
  assign new_n274 = new_n63 & new_n5;
  assign new_n236 = new_n274 & new_n1102;
  assign new_n173 = new_n3 & new_n236;
  assign new_n174 = ~new_n173;
  assign new_n987992 = new_n174 & new_n987991;
  assign new_n1500727 = new_n8445 ^ new_n987992;
  assign new_n1218 = new_n68 & new_n3;
  assign new_n162 = new_n3 ^ new_n1218;
  assign new_n163 = new_n93 & new_n162;
  assign new_n48 = new_n3 & new_n18;
  assign new_n360 = new_n11 & new_n0;
  assign new_n1037724 = new_n360 & new_n48;
  assign new_n1037726 = new_n1037724 & new_n163;
  assign new_n1037725 = new_n1037724 ^ new_n163;
  assign new_n1037727 = new_n1037725 ^ new_n1037726;
  assign new_n1498138 = new_n1037727 ^ new_n95;
  assign new_n1498140 = new_n1498138 & new_n28;
  assign new_n172461 = new_n95 ^ new_n1498140;
  assign new_n19 = new_n17 & new_n18;
  assign new_n148 = new_n2 & new_n19;
  assign new_n155 = new_n2 & new_n48;
  assign new_n124 = new_n1 & new_n10;
  assign new_n140797 = new_n124 & new_n155;
  assign new_n1590 = new_n1 & new_n2;
  assign new_n240 = new_n48 & new_n1590;
  assign new_n140602 = new_n0 & new_n240;
  assign new_n8385 = new_n18 & new_n0;
  assign new_n153 = new_n320 & new_n8385;
  assign new_n16003 = new_n2 & new_n153;
  assign new_n82 = new_n2 & new_n10;
  assign new_n1488839 = new_n82 & new_n151;
  assign new_n272506 = new_n19 & new_n82;
  assign new_n283 = new_n2 & new_n0;
  assign new_n162341 = new_n19 & new_n283;
  assign new_n13 = new_n0 ^ new_n124;
  assign new_n2669 = new_n13 & new_n29;
  assign new_n136 = new_n17 ^ new_n2669;
  assign new_n140 = new_n1 ^ new_n516;
  assign new_n141 = ~new_n140;
  assign new_n142 = new_n18 & new_n141;
  assign new_n1434 = new_n142 ^ new_n136;
  assign new_n1435 = new_n2 & new_n1434;
  assign new_n146 = new_n136 ^ new_n1435;
  assign new_n736 = ~new_n146;
  assign new_n16471 = new_n28 & new_n18;
  assign new_n287 = new_n17 & new_n11;
  assign new_n79153 = new_n287 & new_n16471;
  assign new_n1041546 = new_n10 & new_n79153;
  assign new_n1830 = new_n29 ^ new_n2;
  assign new_n106989 = new_n2 ^ new_n1830;
  assign new_n3862 = new_n124 ^ new_n2;
  assign new_n201107 = new_n2 ^ new_n3862;
  assign new_n201108 = new_n201107 ^ new_n1830;
  assign new_n201109 = ~new_n201108;
  assign new_n201110 = new_n201109 & new_n106989;
  assign new_n201111 = new_n1830 ^ new_n201110;
  assign new_n231889 = ~new_n201111;
  assign new_n947 = new_n3 & new_n28;
  assign new_n120 = new_n4 & new_n11;
  assign new_n121 = ~new_n120;
  assign new_n12917 = new_n121 & new_n947;
  assign new_n12918 = new_n2 ^ new_n12917;
  assign new_n310 = ~new_n12918;
  assign new_n231890 = new_n310 & new_n231889;
  assign new_n201113 = ~new_n231890;
  assign new_n1177 = ~new_n201113;
  assign new_n455 = new_n2 & new_n29;
  assign new_n84 = new_n2 ^ new_n455;
  assign new_n15835 = new_n84 ^ new_n1177;
  assign new_n10865 = ~new_n15835;
  assign new_n16 = ~new_n9;
  assign new_n230 = new_n16 & new_n28;
  assign new_n86742 = new_n1 ^ new_n230;
  assign new_n271546 = new_n230 ^ new_n86742;
  assign new_n351 = new_n17 & new_n28;
  assign new_n8414 = new_n4 & new_n10;
  assign new_n27480 = new_n8414 & new_n351;
  assign new_n40126 = new_n2 ^ new_n27480;
  assign new_n271628 = new_n40126 ^ new_n230;
  assign new_n271629 = new_n230 ^ new_n271628;
  assign new_n271630 = new_n271629 ^ new_n86742;
  assign new_n271631 = ~new_n271630;
  assign new_n271632 = new_n271631 & new_n271546;
  assign new_n271633 = new_n86742 ^ new_n271632;
  assign new_n559 = new_n2 & new_n1;
  assign new_n485 = new_n19 & new_n559;
  assign new_n42 = new_n2 ^ new_n485;
  assign new_n43 = ~new_n42;
  assign new_n271634 = new_n43 & new_n271633;
  assign new_n271635 = new_n42 ^ new_n271634;
  assign new_n171475 = ~new_n271635;
  assign new_n382 = new_n28 & new_n1;
  assign new_n1694 = new_n4 ^ new_n3;
  assign new_n112 = new_n2 & new_n1694;
  assign new_n113 = ~new_n112;
  assign new_n2072 = new_n113 & new_n382;
  assign new_n403 = new_n29 & new_n124;
  assign new_n47 = new_n1 ^ new_n403;
  assign new_n1559 = new_n47 & new_n2072;
  assign new_n192268 = new_n1694 & new_n1590;
  assign new_n114 = new_n1 ^ new_n192268;
  assign new_n169757 = new_n114 ^ new_n1559;
  assign new_n1132 = new_n28 & new_n320;
  assign new_n272 = new_n10 & new_n4;
  assign new_n106 = new_n272 & new_n1132;
  assign new_n107 = ~new_n106;
  assign new_n988 = new_n1 ^ new_n4;
  assign new_n5262 = new_n1 ^ new_n988;
  assign new_n2126 = new_n0 ^ new_n1;
  assign new_n5260 = new_n1 ^ new_n2126;
  assign new_n5261 = new_n5260 ^ new_n988;
  assign new_n5263 = new_n5261 & new_n5262;
  assign new_n5264 = new_n988 ^ new_n5263;
  assign new_n985 = new_n3 ^ new_n4;
  assign new_n5259 = ~new_n985;
  assign new_n6077 = new_n2 & new_n5259;
  assign new_n104 = new_n6077 & new_n5264;
  assign new_n105 = ~new_n104;
  assign new_n172280 = new_n105 & new_n107;
  assign new_n79290 = ~new_n172280;
  assign new_n1754 = new_n2 ^ new_n3;
  assign new_n25124 = ~new_n1754;
  assign new_n186892 = new_n1694 & new_n25124;
  assign new_n100 = new_n3 ^ new_n186892;
  assign new_n15559 = new_n94 & new_n100;
  assign new_n209 = new_n4 & new_n3;
  assign new_n28573 = new_n28 & new_n209;
  assign new_n1023151 = new_n28573 & new_n15559;
  assign new_n171984 = new_n100 ^ new_n1023151;
  assign new_n30 = ~new_n29;
  assign new_n2688 = new_n30 & new_n1590;
  assign new_n91 = new_n1 ^ new_n2688;
  assign new_n1069 = new_n65 & new_n947;
  assign new_n89 = new_n28 ^ new_n1069;
  assign new_n380 = new_n89 & new_n91;
  assign new_n168794 = new_n91 ^ new_n380;
  assign new_n3714 = new_n29 & new_n283;
  assign new_n3715 = new_n2 ^ new_n3714;
  assign new_n86 = ~new_n3715;
  assign new_n8431 = new_n10 & new_n5;
  assign new_n74 = new_n209 & new_n8431;
  assign new_n75 = ~new_n74;
  assign new_n308 = new_n1590 ^ new_n1;
  assign new_n11955 = new_n308 & new_n75;
  assign new_n8377 = new_n0 & new_n65;
  assign new_n72 = new_n2997 & new_n8377;
  assign new_n73 = ~new_n72;
  assign new_n11956 = new_n73 & new_n11955;
  assign new_n1063 = new_n308 ^ new_n11956;
  assign new_n80 = new_n28 ^ new_n1063;
  assign new_n81 = ~new_n80;
  assign new_n171179 = new_n81 & new_n86;
  assign new_n1446 = new_n57 ^ new_n4;
  assign new_n1447 = new_n3 & new_n1446;
  assign new_n61 = new_n4 ^ new_n1447;
  assign new_n279 = new_n0 & new_n4;
  assign new_n54 = new_n3 & new_n279;
  assign new_n55 = ~new_n54;
  assign new_n610648 = new_n55 & new_n61;
  assign new_n1512 = new_n28 & new_n3;
  assign new_n730 = new_n1512 & new_n8414;
  assign new_n967 = new_n28 ^ new_n730;
  assign new_n968 = new_n11 & new_n967;
  assign new_n52 = new_n28 ^ new_n968;
  assign new_n2132 = new_n1 ^ new_n985;
  assign new_n986 = new_n4 ^ new_n985;
  assign new_n2121 = new_n1 ^ new_n986;
  assign new_n2122 = new_n0 ^ new_n4;
  assign new_n2123 = new_n985 ^ new_n2122;
  assign new_n2124 = new_n1 & new_n2123;
  assign new_n2125 = new_n4 ^ new_n2124;
  assign new_n2127 = new_n2125 ^ new_n2126;
  assign new_n2128 = new_n2127 & new_n2121;
  assign new_n2131 = new_n0 ^ new_n2128;
  assign new_n2133 = new_n2131 ^ new_n2132;
  assign new_n2129 = new_n4 ^ new_n2128;
  assign new_n2130 = new_n985 ^ new_n2129;
  assign new_n2134 = new_n2130 & new_n2133;
  assign new_n2135 = new_n2128 ^ new_n2134;
  assign new_n2136 = new_n2124 ^ new_n2135;
  assign new_n2137 = new_n2121 ^ new_n2136;
  assign new_n50 = new_n1 ^ new_n2137;
  assign new_n51 = ~new_n50;
  assign new_n172303 = new_n51 & new_n52;
  assign new_n33 = new_n3 & new_n10;
  assign new_n10827 = new_n17 ^ new_n33;
  assign new_n2433 = new_n4 & new_n10827;
  assign new_n2435 = new_n2433 & new_n11;
  assign new_n38 = new_n29 ^ new_n2435;
  assign new_n347 = new_n17 & new_n1;
  assign new_n11511 = new_n347 & new_n18;
  assign new_n232389 = new_n11511 ^ new_n38;
  assign new_n232390 = new_n2 & new_n232389;
  assign new_n172572 = new_n38 ^ new_n232390;
  assign new_n4123 = new_n2 ^ new_n1694;
  assign new_n102016 = new_n3 ^ new_n1694;
  assign new_n173690 = new_n2 ^ new_n102016;
  assign new_n993 = new_n1 ^ new_n2;
  assign new_n2276 = new_n1 ^ new_n3;
  assign new_n173255 = new_n1694 ^ new_n2276;
  assign new_n173256 = ~new_n173255;
  assign new_n173691 = new_n2 & new_n173256;
  assign new_n173692 = new_n3 ^ new_n173691;
  assign new_n173693 = new_n173692 ^ new_n993;
  assign new_n173694 = new_n173693 & new_n173690;
  assign new_n173697 = new_n1 ^ new_n173694;
  assign new_n173698 = new_n173697 ^ new_n4123;
  assign new_n173695 = new_n3 ^ new_n173694;
  assign new_n173696 = new_n1694 ^ new_n173695;
  assign new_n173699 = new_n173696 & new_n173698;
  assign new_n173700 = new_n173694 ^ new_n173699;
  assign new_n173701 = new_n173691 ^ new_n173700;
  assign new_n24 = new_n173690 ^ new_n173701;
  assign new_n25 = ~new_n24;
  assign new_n14 = new_n9 & new_n13;
  assign new_n501 = new_n14 & new_n25;
  assign new_n535 = new_n24 ^ new_n501;
  assign oseloregdst0 = new_n535;
  assign oseloregdst1 = new_n172572;
  assign oselopB0 = new_n172303;
  assign oselopB1 = new_n610648;
  assign oaluop0 = new_n171179;
  assign oaluop1 = new_n168794;
  assign oaluop2 = new_n171984;
  assign oaluopext0 = new_n79290;
  assign oaluopext1 = new_n169757;
  assign oaluopext2 = new_n171475;
  assign oaluopext3 = new_n10865;
  assign ohalt = new_n1041546;
  assign oregwrite = new_n736;
  assign oselpcopA = new_n162341;
  assign oselpcopB = new_n272506;
  assign obeqz = new_n1488839;
  assign obnez = new_n16003;
  assign obgez = new_n140602;
  assign obltz = new_n140797;
  assign ojump = new_n148;
  assign oCin = new_n172461;
  assign oinvA = new_n1500727;
  assign oinvB = new_n10954;
  assign osign = new_n189;
  assign omemwrite = new_n214763;
  assign oselwb = new_n1489331;
endmodule


