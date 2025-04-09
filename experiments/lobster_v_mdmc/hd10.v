// Benchmark "hd10" written by ABC on Thu Mar 27 16:00:18 2025

module top ( 
    i_2, i_3, i_4, i_5, i_6, i_7, i_8, i_9, i_10, i_11, i_12, i_13, i_14,
    i_15, i_16, i_17, i_18, i_19, i_20, i_21, i_22, i_23, i_24, i_25, i_26,
    i_27, i_28, i_29, i_30, i_31, i_32, i_33,
    m_0, m_1, m_2, m_3, m_4, m_5, m_6, m_7, m_8, m_9, m_10, m_11, m_12,
    m_13, m_14, m_15, m_16, m_17, m_18, m_19, m_20, m_21, m_22, m_23, m_24,
    m_25, m_26, m_27, m_28, m_29, m_30, m_31  );
  input  i_2, i_3, i_4, i_5, i_6, i_7, i_8, i_9, i_10, i_11, i_12, i_13,
    i_14, i_15, i_16, i_17, i_18, i_19, i_20, i_21, i_22, i_23, i_24, i_25,
    i_26, i_27, i_28, i_29, i_30, i_31, i_32, i_33;
  output m_0, m_1, m_2, m_3, m_4, m_5, m_6, m_7, m_8, m_9, m_10, m_11, m_12,
    m_13, m_14, m_15, m_16, m_17, m_18, m_19, m_20, m_21, m_22, m_23, m_24,
    m_25, m_26, m_27, m_28, m_29, m_30, m_31;
  wire new_n17, new_n91, new_n16, new_n90, new_n92, new_n21, new_n84,
    new_n20, new_n83, new_n85, new_n1142, new_n20708, new_n19, new_n94,
    new_n18, new_n93, new_n95, new_n23, new_n87, new_n22, new_n86, new_n88,
    new_n329, new_n66093, new_n2973, new_n98, new_n25, new_n75, new_n24,
    new_n74, new_n76, new_n29, new_n68, new_n28, new_n67, new_n69,
    new_n1306, new_n27, new_n78, new_n26, new_n77, new_n79, new_n31,
    new_n71, new_n30, new_n70, new_n72, new_n333, new_n81, new_n101,
    new_n219, new_n3, new_n61, new_n2, new_n60, new_n62, new_n1, new_n58,
    new_n0, new_n57, new_n59, new_n63, new_n7, new_n54, new_n6, new_n53,
    new_n55, new_n5, new_n51, new_n4, new_n50, new_n52, new_n56, new_n64,
    new_n8, new_n41, new_n9, new_n519, new_n43, new_n13, new_n35, new_n12,
    new_n34, new_n36, new_n1461, new_n11, new_n45, new_n10, new_n44,
    new_n46, new_n15, new_n38, new_n14, new_n37, new_n39, new_n325,
    new_n48, new_n49, new_n501, new_n66, new_n544, new_n4304, new_n10335,
    new_n96, new_n89, new_n97, new_n1790, new_n276, new_n102, new_n2862,
    new_n82, new_n99, new_n429, new_n107;
  assign new_n17 = i_19;
  assign new_n91 = ~new_n17;
  assign new_n16 = i_18;
  assign new_n90 = ~new_n16;
  assign new_n92 = new_n90 & new_n91;
  assign new_n21 = i_23;
  assign new_n84 = ~new_n21;
  assign new_n20 = i_22;
  assign new_n83 = ~new_n20;
  assign new_n85 = new_n83 & new_n84;
  assign new_n1142 = new_n85 & new_n92;
  assign new_n20708 = ~new_n1142;
  assign new_n19 = i_21;
  assign new_n94 = ~new_n19;
  assign new_n18 = i_20;
  assign new_n93 = ~new_n18;
  assign new_n95 = new_n93 & new_n94;
  assign new_n23 = i_25;
  assign new_n87 = ~new_n23;
  assign new_n22 = i_24;
  assign new_n86 = ~new_n22;
  assign new_n88 = new_n86 & new_n87;
  assign new_n329 = new_n88 & new_n95;
  assign new_n66093 = new_n329 & new_n20708;
  assign new_n2973 = ~new_n329;
  assign new_n98 = new_n2973 ^ new_n66093;
  assign new_n25 = i_27;
  assign new_n75 = ~new_n25;
  assign new_n24 = i_26;
  assign new_n74 = ~new_n24;
  assign new_n76 = new_n74 & new_n75;
  assign new_n29 = i_31;
  assign new_n68 = ~new_n29;
  assign new_n28 = i_30;
  assign new_n67 = ~new_n28;
  assign new_n69 = new_n67 & new_n68;
  assign new_n1306 = new_n69 & new_n76;
  assign new_n27 = i_29;
  assign new_n78 = ~new_n27;
  assign new_n26 = i_28;
  assign new_n77 = ~new_n26;
  assign new_n79 = new_n77 & new_n78;
  assign new_n31 = i_33;
  assign new_n71 = ~new_n31;
  assign new_n30 = i_32;
  assign new_n70 = ~new_n30;
  assign new_n72 = new_n70 & new_n71;
  assign new_n333 = new_n72 & new_n79;
  assign new_n81 = new_n333 & new_n1306;
  assign new_n101 = new_n81 & new_n98;
  assign new_n219 = ~new_n101;
  assign new_n3 = i_5;
  assign new_n61 = ~new_n3;
  assign new_n2 = i_4;
  assign new_n60 = ~new_n2;
  assign new_n62 = new_n60 & new_n61;
  assign new_n1 = i_3;
  assign new_n58 = ~new_n1;
  assign new_n0 = i_2;
  assign new_n57 = ~new_n0;
  assign new_n59 = new_n57 & new_n58;
  assign new_n63 = new_n59 & new_n62;
  assign new_n7 = i_9;
  assign new_n54 = ~new_n7;
  assign new_n6 = i_8;
  assign new_n53 = ~new_n6;
  assign new_n55 = new_n53 & new_n54;
  assign new_n5 = i_7;
  assign new_n51 = ~new_n5;
  assign new_n4 = i_6;
  assign new_n50 = ~new_n4;
  assign new_n52 = new_n50 & new_n51;
  assign new_n56 = new_n52 & new_n55;
  assign new_n64 = new_n56 & new_n63;
  assign new_n8 = i_10;
  assign new_n41 = ~new_n8;
  assign new_n9 = i_11;
  assign new_n519 = new_n9 & new_n41;
  assign new_n43 = new_n41 ^ new_n519;
  assign new_n13 = i_15;
  assign new_n35 = ~new_n13;
  assign new_n12 = i_14;
  assign new_n34 = ~new_n12;
  assign new_n36 = new_n34 & new_n35;
  assign new_n1461 = new_n36 & new_n43;
  assign new_n11 = i_13;
  assign new_n45 = ~new_n11;
  assign new_n10 = i_12;
  assign new_n44 = ~new_n10;
  assign new_n46 = new_n44 & new_n45;
  assign new_n15 = i_17;
  assign new_n38 = ~new_n15;
  assign new_n14 = i_16;
  assign new_n37 = ~new_n14;
  assign new_n39 = new_n37 & new_n38;
  assign new_n325 = new_n39 & new_n46;
  assign new_n48 = new_n325 & new_n1461;
  assign new_n49 = ~new_n48;
  assign new_n501 = new_n49 & new_n64;
  assign new_n66 = new_n49 ^ new_n501;
  assign new_n544 = new_n66 & new_n219;
  assign new_n4304 = new_n64 ^ new_n544;
  assign new_n10335 = ~new_n4304;
  assign new_n96 = new_n92 & new_n95;
  assign new_n89 = new_n85 & new_n88;
  assign new_n97 = new_n89 & new_n96;
  assign new_n1790 = new_n97 ^ new_n81;
  assign new_n276 = new_n81 & new_n97;
  assign new_n102 = new_n276 ^ new_n1790;
  assign new_n2862 = new_n66 & new_n102;
  assign new_n82 = ~new_n81;
  assign new_n99 = new_n82 & new_n98;
  assign new_n429 = new_n66 & new_n99;
  assign new_n107 = 1'b0;
  assign m_0 = new_n107;
  assign m_1 = new_n107;
  assign m_2 = new_n107;
  assign m_3 = new_n107;
  assign m_4 = new_n107;
  assign m_5 = new_n107;
  assign m_6 = new_n107;
  assign m_7 = new_n107;
  assign m_8 = new_n107;
  assign m_9 = new_n107;
  assign m_10 = new_n107;
  assign m_11 = new_n107;
  assign m_12 = new_n107;
  assign m_13 = new_n107;
  assign m_14 = new_n107;
  assign m_15 = new_n107;
  assign m_16 = new_n107;
  assign m_17 = new_n107;
  assign m_18 = new_n107;
  assign m_19 = new_n107;
  assign m_20 = new_n107;
  assign m_21 = new_n107;
  assign m_22 = new_n107;
  assign m_23 = new_n107;
  assign m_24 = new_n107;
  assign m_25 = new_n107;
  assign m_26 = new_n107;
  assign m_27 = new_n107;
  assign m_28 = new_n107;
  assign m_29 = new_n429;
  assign m_30 = new_n2862;
  assign m_31 = new_n10335;
endmodule


