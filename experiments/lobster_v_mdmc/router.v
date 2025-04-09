// Benchmark "router" written by ABC on Thu Mar 27 16:00:18 2025

module top ( 
    destx0, destx1, destx2, destx3, destx4, destx5, destx6, destx7, destx8,
    destx9, destx10, destx11, destx12, destx13, destx14, destx15, destx16,
    destx17, destx18, destx19, destx20, destx21, destx22, destx23, destx24,
    destx25, destx26, destx27, destx28, destx29, desty0, desty1, desty2,
    desty3, desty4, desty5, desty6, desty7, desty8, desty9, desty10,
    desty11, desty12, desty13, desty14, desty15, desty16, desty17, desty18,
    desty19, desty20, desty21, desty22, desty23, desty24, desty25, desty26,
    desty27, desty28, desty29,
    outport0, outport1, outport2, outport3, outport4, outport5, outport6,
    outport7, outport8, outport9, outport10, outport11, outport12,
    outport13, outport14, outport15, outport16, outport17, outport18,
    outport19, outport20, outport21, outport22, outport23, outport24,
    outport25, outport26, outport27, outport28, outport29  );
  input  destx0, destx1, destx2, destx3, destx4, destx5, destx6, destx7,
    destx8, destx9, destx10, destx11, destx12, destx13, destx14, destx15,
    destx16, destx17, destx18, destx19, destx20, destx21, destx22, destx23,
    destx24, destx25, destx26, destx27, destx28, destx29, desty0, desty1,
    desty2, desty3, desty4, desty5, desty6, desty7, desty8, desty9,
    desty10, desty11, desty12, desty13, desty14, desty15, desty16, desty17,
    desty18, desty19, desty20, desty21, desty22, desty23, desty24, desty25,
    desty26, desty27, desty28, desty29;
  output outport0, outport1, outport2, outport3, outport4, outport5, outport6,
    outport7, outport8, outport9, outport10, outport11, outport12,
    outport13, outport14, outport15, outport16, outport17, outport18,
    outport19, outport20, outport21, outport22, outport23, outport24,
    outport25, outport26, outport27, outport28, outport29;
  wire new_n339, new_n0, new_n30, new_n1009, new_n18615, new_n42, new_n39,
    new_n40, new_n1041, new_n1271, new_n199, new_n41, new_n200, new_n5017,
    new_n51, new_n217, new_n46, new_n193, new_n6476, new_n56, new_n191,
    new_n57, new_n289, new_n290, new_n45113, new_n43, new_n194, new_n291,
    new_n38, new_n295, new_n37, new_n294, new_n296, new_n44097, new_n45,
    new_n44, new_n292, new_n861, new_n297, new_n6561, new_n299, new_n16370,
    new_n48, new_n47, new_n301, new_n302, new_n34, new_n306, new_n33,
    new_n305, new_n307, new_n44957, new_n36, new_n309, new_n35, new_n308,
    new_n310, new_n12995, new_n32, new_n313, new_n31, new_n312, new_n314,
    new_n55, new_n54, new_n222, new_n315, new_n53, new_n52, new_n872,
    new_n240, new_n50, new_n49, new_n214, new_n303, new_n6645, new_n317,
    new_n320, new_n42571, new_n48813, new_n195, new_n620, new_n3996,
    new_n18560, new_n203, new_n204, new_n2712, new_n209, new_n3379,
    new_n15632, new_n15633, new_n286, new_n287, new_n335, new_n41685,
    new_n2727, new_n30400, new_n923, new_n219, new_n7466, new_n192,
    new_n3268, new_n1324, new_n213, new_n779, new_n221, new_n1195,
    new_n227, new_n59, new_n44810, new_n58, new_n190, new_n228, new_n8404,
    new_n337, new_n26, new_n64, new_n25, new_n5801, new_n24, new_n23,
    new_n687, new_n5802, new_n22, new_n91, new_n21, new_n90, new_n92,
    new_n20, new_n19, new_n87, new_n7501, new_n18, new_n65, new_n17,
    new_n3256, new_n15, new_n14, new_n531, new_n16, new_n66, new_n39920,
    new_n12, new_n73, new_n11, new_n578, new_n10, new_n9, new_n67,
    new_n30307, new_n70, new_n106, new_n527, new_n13, new_n74, new_n76,
    new_n77, new_n8427, new_n82, new_n1142, new_n86, new_n876, new_n93,
    new_n94, new_n5803, new_n5804, new_n99, new_n100, new_n29, new_n27,
    new_n629, new_n28, new_n63, new_n101, new_n149, new_n823, new_n136,
    new_n1330, new_n78, new_n79, new_n3286, new_n5540, new_n6977,
    new_n8433, new_n30833, new_n30834, new_n102, new_n7918, new_n103,
    new_n5520, new_n114, new_n2, new_n117, new_n6624, new_n1, new_n116,
    new_n46793, new_n667, new_n120, new_n1288, new_n137, new_n138,
    new_n134, new_n1165, new_n135, new_n139, new_n47054, new_n8, new_n122,
    new_n7, new_n121, new_n123, new_n4, new_n127, new_n3, new_n126,
    new_n128, new_n41917, new_n68, new_n124, new_n6, new_n130, new_n5,
    new_n129, new_n131, new_n6568, new_n133, new_n141, new_n2152, new_n145,
    new_n9133, new_n95, new_n3920, new_n24948, new_n707, new_n75,
    new_n7439, new_n3985, new_n177, new_n7916, new_n178, new_n160,
    new_n161, new_n43097, new_n608, new_n159, new_n679, new_n580, new_n172,
    new_n171, new_n173, new_n169, new_n168, new_n170, new_n174, new_n69,
    new_n45410, new_n115, new_n164, new_n6551, new_n167, new_n175,
    new_n179, new_n181, new_n183, new_n12491, new_n12493, new_n187,
    new_n509726, new_n230, new_n231, new_n322, new_n323, new_n49640,
    new_n519, new_n324, new_n30486, new_n51015, new_n30487, new_n5791,
    new_n235, new_n4013, new_n30489, new_n49973, new_n30490, new_n564,
    new_n9644, new_n16379, new_n16380, new_n2436, new_n16377, new_n16378,
    new_n16381, new_n16382, new_n16383, new_n3727, new_n49453, new_n8953,
    new_n247, new_n248, new_n43636, new_n249, new_n645, new_n250, new_n251,
    new_n29881, new_n29883, new_n622, new_n1206, new_n270, new_n269,
    new_n271, new_n272, new_n266, new_n265, new_n267, new_n263, new_n262,
    new_n264, new_n268, new_n273, new_n244, new_n258, new_n259, new_n197,
    new_n196, new_n198, new_n260, new_n256, new_n257, new_n261, new_n274,
    new_n276, new_n279, new_n281, new_n7519, new_n847, new_n326, new_n329,
    new_n1112, new_n484929, new_n146, new_n484936, new_n18475, new_n404,
    new_n147, new_n148, new_n18554, new_n914;
  assign new_n339 = 1'b0;
  assign new_n0 = destx0;
  assign new_n30 = desty0;
  assign new_n1009 = new_n30 & new_n0;
  assign new_n18615 = ~new_n1009;
  assign new_n42 = desty12;
  assign new_n39 = desty9;
  assign new_n40 = desty10;
  assign new_n1041 = new_n40 & new_n39;
  assign new_n1271 = new_n40 ^ new_n1041;
  assign new_n199 = new_n39 ^ new_n1271;
  assign new_n41 = desty11;
  assign new_n200 = new_n41 & new_n199;
  assign new_n5017 = new_n200 ^ new_n42;
  assign new_n51 = desty21;
  assign new_n217 = ~new_n51;
  assign new_n46 = desty16;
  assign new_n193 = ~new_n46;
  assign new_n6476 = new_n193 & new_n217;
  assign new_n56 = desty26;
  assign new_n191 = ~new_n56;
  assign new_n57 = desty27;
  assign new_n289 = new_n57 & new_n191;
  assign new_n290 = new_n289 & new_n6476;
  assign new_n45113 = new_n290 & new_n5017;
  assign new_n43 = desty13;
  assign new_n194 = ~new_n43;
  assign new_n291 = new_n41 & new_n194;
  assign new_n38 = desty8;
  assign new_n295 = ~new_n38;
  assign new_n37 = desty7;
  assign new_n294 = ~new_n37;
  assign new_n296 = new_n294 & new_n295;
  assign new_n44097 = new_n296 & new_n291;
  assign new_n45 = desty15;
  assign new_n44 = desty14;
  assign new_n292 = new_n44 & new_n45;
  assign new_n861 = new_n39 & new_n40;
  assign new_n297 = new_n39 ^ new_n861;
  assign new_n6561 = new_n297 & new_n292;
  assign new_n299 = new_n6561 & new_n44097;
  assign new_n16370 = new_n299 & new_n45113;
  assign new_n48 = desty18;
  assign new_n47 = desty17;
  assign new_n301 = new_n47 & new_n48;
  assign new_n302 = ~new_n301;
  assign new_n34 = desty4;
  assign new_n306 = ~new_n34;
  assign new_n33 = desty3;
  assign new_n305 = ~new_n33;
  assign new_n307 = new_n305 & new_n306;
  assign new_n44957 = new_n307 & new_n302;
  assign new_n36 = desty6;
  assign new_n309 = ~new_n36;
  assign new_n35 = desty5;
  assign new_n308 = ~new_n35;
  assign new_n310 = new_n308 & new_n309;
  assign new_n12995 = new_n310 & new_n44957;
  assign new_n32 = desty2;
  assign new_n313 = ~new_n32;
  assign new_n31 = desty1;
  assign new_n312 = ~new_n31;
  assign new_n314 = new_n312 & new_n313;
  assign new_n55 = desty25;
  assign new_n54 = desty24;
  assign new_n222 = new_n54 & new_n55;
  assign new_n315 = new_n222 & new_n314;
  assign new_n53 = desty23;
  assign new_n52 = desty22;
  assign new_n872 = new_n52 & new_n53;
  assign new_n240 = new_n53 ^ new_n872;
  assign new_n50 = desty20;
  assign new_n49 = desty19;
  assign new_n214 = new_n49 & new_n50;
  assign new_n303 = new_n214 & new_n240;
  assign new_n6645 = new_n303 & new_n315;
  assign new_n317 = new_n6645 & new_n12995;
  assign new_n320 = new_n317 & new_n16370;
  assign new_n42571 = new_n320 & new_n18615;
  assign new_n48813 = new_n193 & new_n292;
  assign new_n195 = ~new_n42;
  assign new_n620 = new_n195 & new_n194;
  assign new_n3996 = new_n199 & new_n41;
  assign new_n18560 = ~new_n3996;
  assign new_n203 = new_n18560 & new_n620;
  assign new_n204 = ~new_n203;
  assign new_n2712 = new_n204 & new_n48813;
  assign new_n209 = new_n46 ^ new_n2712;
  assign new_n3379 = new_n47 ^ new_n48;
  assign new_n15632 = new_n3379 & new_n209;
  assign new_n15633 = new_n48 ^ new_n15632;
  assign new_n286 = ~new_n15633;
  assign new_n287 = ~new_n286;
  assign new_n335 = new_n287 & new_n42571;
  assign new_n41685 = new_n53 & new_n191;
  assign new_n2727 = new_n222 & new_n41685;
  assign new_n30400 = new_n217 & new_n52;
  assign new_n923 = new_n51 ^ new_n30400;
  assign new_n219 = ~new_n923;
  assign new_n7466 = new_n214 & new_n219;
  assign new_n192 = ~new_n48;
  assign new_n3268 = new_n47 & new_n192;
  assign new_n1324 = new_n209 & new_n3268;
  assign new_n213 = new_n48 ^ new_n1324;
  assign new_n779 = new_n213 & new_n7466;
  assign new_n221 = new_n923 ^ new_n779;
  assign new_n1195 = new_n221 & new_n2727;
  assign new_n227 = new_n56 ^ new_n1195;
  assign new_n59 = desty29;
  assign new_n44810 = new_n59 & new_n57;
  assign new_n58 = desty28;
  assign new_n190 = new_n58 & new_n44810;
  assign new_n228 = new_n190 & new_n227;
  assign new_n8404 = new_n228 & new_n335;
  assign new_n337 = new_n228 ^ new_n8404;
  assign new_n26 = destx26;
  assign new_n64 = ~new_n26;
  assign new_n25 = destx25;
  assign new_n5801 = new_n25 & new_n64;
  assign new_n24 = destx24;
  assign new_n23 = destx23;
  assign new_n687 = new_n23 & new_n24;
  assign new_n5802 = new_n687 & new_n5801;
  assign new_n22 = destx22;
  assign new_n91 = ~new_n22;
  assign new_n21 = destx21;
  assign new_n90 = ~new_n21;
  assign new_n92 = new_n90 & new_n91;
  assign new_n20 = destx20;
  assign new_n19 = destx19;
  assign new_n87 = new_n19 & new_n20;
  assign new_n7501 = new_n87 & new_n92;
  assign new_n18 = destx18;
  assign new_n65 = ~new_n18;
  assign new_n17 = destx17;
  assign new_n3256 = new_n17 & new_n65;
  assign new_n15 = destx15;
  assign new_n14 = destx14;
  assign new_n531 = new_n14 & new_n15;
  assign new_n16 = destx16;
  assign new_n66 = ~new_n16;
  assign new_n39920 = new_n66 & new_n531;
  assign new_n12 = destx12;
  assign new_n73 = ~new_n12;
  assign new_n11 = destx11;
  assign new_n578 = new_n11 & new_n73;
  assign new_n10 = destx10;
  assign new_n9 = destx9;
  assign new_n67 = ~new_n9;
  assign new_n30307 = new_n67 & new_n10;
  assign new_n70 = new_n9 ^ new_n30307;
  assign new_n106 = new_n70 & new_n578;
  assign new_n527 = new_n106 ^ new_n73;
  assign new_n13 = destx13;
  assign new_n74 = ~new_n13;
  assign new_n76 = new_n74 & new_n527;
  assign new_n77 = ~new_n76;
  assign new_n8427 = new_n77 & new_n39920;
  assign new_n82 = new_n16 ^ new_n8427;
  assign new_n1142 = new_n82 & new_n3256;
  assign new_n86 = new_n18 ^ new_n1142;
  assign new_n876 = new_n86 & new_n7501;
  assign new_n93 = new_n92 ^ new_n876;
  assign new_n94 = ~new_n93;
  assign new_n5803 = new_n94 & new_n5802;
  assign new_n5804 = new_n26 ^ new_n5803;
  assign new_n99 = ~new_n5804;
  assign new_n100 = ~new_n99;
  assign new_n29 = destx29;
  assign new_n27 = destx27;
  assign new_n629 = new_n27 & new_n29;
  assign new_n28 = destx28;
  assign new_n63 = new_n28 & new_n629;
  assign new_n101 = new_n63 & new_n100;
  assign new_n149 = ~new_n101;
  assign new_n823 = new_n14 & new_n13;
  assign new_n136 = new_n14 ^ new_n823;
  assign new_n1330 = new_n136 & new_n527;
  assign new_n78 = new_n14 ^ new_n1330;
  assign new_n79 = new_n15 & new_n78;
  assign new_n3286 = new_n79 ^ new_n16;
  assign new_n5540 = new_n17 & new_n3286;
  assign new_n6977 = new_n12 ^ new_n11;
  assign new_n8433 = new_n70 ^ new_n11;
  assign new_n30833 = ~new_n8433;
  assign new_n30834 = new_n30833 & new_n6977;
  assign new_n102 = ~new_n15;
  assign new_n7918 = new_n102 ^ new_n1330;
  assign new_n103 = new_n14 ^ new_n7918;
  assign new_n5520 = new_n103 & new_n30834;
  assign new_n114 = new_n20 & new_n90;
  assign new_n2 = destx2;
  assign new_n117 = ~new_n2;
  assign new_n6624 = new_n117 & new_n114;
  assign new_n1 = destx1;
  assign new_n116 = ~new_n1;
  assign new_n46793 = new_n23 & new_n116;
  assign new_n667 = new_n91 & new_n46793;
  assign new_n120 = new_n667 & new_n6624;
  assign new_n1288 = new_n18 & new_n19;
  assign new_n137 = new_n19 ^ new_n1288;
  assign new_n138 = new_n136 & new_n137;
  assign new_n134 = new_n24 & new_n25;
  assign new_n1165 = new_n26 & new_n134;
  assign new_n135 = new_n134 ^ new_n1165;
  assign new_n139 = new_n135 & new_n138;
  assign new_n47054 = new_n139 & new_n120;
  assign new_n8 = destx8;
  assign new_n122 = ~new_n8;
  assign new_n7 = destx7;
  assign new_n121 = ~new_n7;
  assign new_n123 = new_n121 & new_n122;
  assign new_n4 = destx4;
  assign new_n127 = ~new_n4;
  assign new_n3 = destx3;
  assign new_n126 = ~new_n3;
  assign new_n128 = new_n126 & new_n127;
  assign new_n41917 = new_n128 & new_n123;
  assign new_n68 = ~new_n10;
  assign new_n124 = new_n9 & new_n68;
  assign new_n6 = destx6;
  assign new_n130 = ~new_n6;
  assign new_n5 = destx5;
  assign new_n129 = ~new_n5;
  assign new_n131 = new_n129 & new_n130;
  assign new_n6568 = new_n131 & new_n124;
  assign new_n133 = new_n6568 & new_n41917;
  assign new_n141 = new_n133 & new_n47054;
  assign new_n2152 = new_n141 & new_n5520;
  assign new_n145 = new_n2152 & new_n5540;
  assign new_n9133 = new_n23 & new_n93;
  assign new_n95 = new_n23 ^ new_n9133;
  assign new_n3920 = new_n95 ^ new_n24;
  assign new_n24948 = new_n17 ^ new_n82;
  assign new_n707 = new_n65 & new_n24948;
  assign new_n75 = new_n73 & new_n74;
  assign new_n7439 = new_n70 & new_n75;
  assign new_n3985 = new_n11 & new_n7439;
  assign new_n177 = ~new_n14;
  assign new_n7916 = new_n177 ^ new_n3985;
  assign new_n178 = new_n75 ^ new_n7916;
  assign new_n160 = new_n15 & new_n66;
  assign new_n161 = new_n75 & new_n160;
  assign new_n43097 = new_n161 & new_n178;
  assign new_n608 = new_n19 & new_n64;
  assign new_n159 = new_n25 & new_n608;
  assign new_n679 = new_n159 & new_n63;
  assign new_n580 = new_n679 & new_n43097;
  assign new_n172 = new_n4 & new_n5;
  assign new_n171 = new_n2 & new_n3;
  assign new_n173 = new_n171 & new_n172;
  assign new_n169 = new_n8 & new_n11;
  assign new_n168 = new_n6 & new_n7;
  assign new_n170 = new_n168 & new_n169;
  assign new_n174 = new_n170 & new_n173;
  assign new_n69 = new_n67 & new_n68;
  assign new_n45410 = new_n69 & new_n114;
  assign new_n115 = new_n23 & new_n91;
  assign new_n164 = new_n0 & new_n1;
  assign new_n6551 = new_n164 & new_n115;
  assign new_n167 = new_n6551 & new_n45410;
  assign new_n175 = new_n167 & new_n174;
  assign new_n179 = new_n175 & new_n580;
  assign new_n181 = new_n179 & new_n707;
  assign new_n183 = new_n181 & new_n3920;
  assign new_n12491 = new_n183 ^ new_n145;
  assign new_n12493 = new_n12491 & new_n149;
  assign new_n187 = new_n145 ^ new_n12493;
  assign new_n509726 = new_n187 & new_n337;
  assign new_n230 = ~new_n0;
  assign new_n231 = new_n217 & new_n230;
  assign new_n322 = ~new_n30;
  assign new_n323 = new_n230 & new_n322;
  assign new_n49640 = new_n317 & new_n323;
  assign new_n519 = new_n16370 & new_n49640;
  assign new_n324 = new_n287 & new_n519;
  assign new_n30486 = new_n324 ^ new_n231;
  assign new_n51015 = new_n190 & new_n30486;
  assign new_n30487 = new_n227 & new_n51015;
  assign new_n5791 = new_n231 ^ new_n30487;
  assign new_n235 = ~new_n53;
  assign new_n4013 = new_n235 & new_n52;
  assign new_n30489 = new_n4013 ^ new_n240;
  assign new_n49973 = new_n214 & new_n30489;
  assign new_n30490 = new_n213 & new_n49973;
  assign new_n564 = new_n240 ^ new_n30490;
  assign new_n9644 = new_n45 ^ new_n203;
  assign new_n16379 = new_n45 ^ new_n9644;
  assign new_n16380 = ~new_n16379;
  assign new_n2436 = new_n44 ^ new_n45;
  assign new_n16377 = new_n2436 ^ new_n9644;
  assign new_n16378 = ~new_n16377;
  assign new_n16381 = new_n16378 & new_n16380;
  assign new_n16382 = new_n9644 ^ new_n16381;
  assign new_n16383 = ~new_n16382;
  assign new_n3727 = new_n49 ^ new_n48;
  assign new_n49453 = new_n47 & new_n3727;
  assign new_n8953 = new_n209 & new_n49453;
  assign new_n247 = new_n48 ^ new_n8953;
  assign new_n248 = ~new_n247;
  assign new_n43636 = new_n248 & new_n16383;
  assign new_n249 = ~new_n44;
  assign new_n645 = new_n41 & new_n42;
  assign new_n250 = new_n199 & new_n645;
  assign new_n251 = new_n43 & new_n250;
  assign new_n29881 = new_n251 ^ new_n203;
  assign new_n29883 = new_n29881 & new_n249;
  assign new_n622 = new_n203 ^ new_n29883;
  assign new_n1206 = new_n56 & new_n50;
  assign new_n270 = new_n50 ^ new_n1206;
  assign new_n269 = new_n47 & new_n193;
  assign new_n271 = new_n269 & new_n270;
  assign new_n272 = new_n190 & new_n271;
  assign new_n266 = new_n34 & new_n35;
  assign new_n265 = new_n32 & new_n33;
  assign new_n267 = new_n265 & new_n266;
  assign new_n263 = new_n38 & new_n41;
  assign new_n262 = new_n36 & new_n37;
  assign new_n264 = new_n262 & new_n263;
  assign new_n268 = new_n264 & new_n267;
  assign new_n273 = new_n268 & new_n272;
  assign new_n244 = ~new_n49;
  assign new_n258 = new_n192 & new_n244;
  assign new_n259 = ~new_n258;
  assign new_n197 = ~new_n40;
  assign new_n196 = ~new_n39;
  assign new_n198 = new_n196 & new_n197;
  assign new_n260 = new_n198 & new_n259;
  assign new_n256 = new_n30 & new_n31;
  assign new_n257 = new_n222 & new_n256;
  assign new_n261 = new_n257 & new_n260;
  assign new_n274 = new_n261 & new_n273;
  assign new_n276 = new_n274 & new_n622;
  assign new_n279 = new_n276 & new_n43636;
  assign new_n281 = new_n279 & new_n564;
  assign new_n7519 = new_n281 & new_n5791;
  assign new_n847 = new_n228 & new_n324;
  assign new_n326 = new_n228 ^ new_n847;
  assign new_n329 = new_n326 ^ new_n7519;
  assign new_n1112 = new_n329 & new_n187;
  assign new_n484929 = new_n145 & new_n99;
  assign new_n146 = ~new_n145;
  assign new_n484936 = new_n146 ^ new_n484929;
  assign new_n18475 = ~new_n484936;
  assign new_n404 = new_n100 ^ new_n18475;
  assign new_n147 = new_n63 & new_n404;
  assign new_n148 = ~new_n147;
  assign new_n18554 = new_n148 ^ new_n1112;
  assign new_n914 = ~new_n187;
  assign outport0 = new_n914;
  assign outport1 = new_n18554;
  assign outport2 = new_n509726;
  assign outport3 = new_n339;
  assign outport4 = new_n339;
  assign outport5 = new_n339;
  assign outport6 = new_n339;
  assign outport7 = new_n339;
  assign outport8 = new_n339;
  assign outport9 = new_n339;
  assign outport10 = new_n339;
  assign outport11 = new_n339;
  assign outport12 = new_n339;
  assign outport13 = new_n339;
  assign outport14 = new_n339;
  assign outport15 = new_n339;
  assign outport16 = new_n339;
  assign outport17 = new_n339;
  assign outport18 = new_n339;
  assign outport19 = new_n339;
  assign outport20 = new_n339;
  assign outport21 = new_n339;
  assign outport22 = new_n339;
  assign outport23 = new_n339;
  assign outport24 = new_n339;
  assign outport25 = new_n339;
  assign outport26 = new_n339;
  assign outport27 = new_n339;
  assign outport28 = new_n339;
  assign outport29 = new_n339;
endmodule


