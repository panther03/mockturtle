// Benchmark "hd08" written by ABC on Thu Mar 27 16:00:18 2025

module top ( 
    i0, i1, i2, i3, i4, i5, i6, i7,
    om_0  );
  input  i0, i1, i2, i3, i4, i5, i6, i7;
  output om_0;
  wire new_n3, new_n2, new_n13, new_n5034, new_n30, new_n1, new_n11, new_n0,
    new_n10, new_n12, new_n29, new_n31, new_n32, new_n7, new_n22, new_n6,
    new_n21, new_n23, new_n5, new_n18, new_n4, new_n17, new_n19, new_n787,
    new_n14, new_n15, new_n20, new_n24, new_n649, new_n40, new_n41,
    new_n38, new_n39, new_n42, new_n35, new_n36, new_n33, new_n34, new_n37,
    new_n43, new_n1642, new_n26, new_n16, new_n25, new_n27, new_n28,
    new_n49, new_n8333;
  assign new_n3 = i3;
  assign new_n2 = i2;
  assign new_n13 = ~new_n2;
  assign new_n5034 = new_n13 & new_n3;
  assign new_n30 = new_n2 ^ new_n5034;
  assign new_n1 = i1;
  assign new_n11 = ~new_n1;
  assign new_n0 = i0;
  assign new_n10 = ~new_n0;
  assign new_n12 = new_n10 & new_n11;
  assign new_n29 = ~new_n12;
  assign new_n31 = new_n29 & new_n30;
  assign new_n32 = ~new_n31;
  assign new_n7 = i7;
  assign new_n22 = ~new_n7;
  assign new_n6 = i6;
  assign new_n21 = ~new_n6;
  assign new_n23 = new_n21 & new_n22;
  assign new_n5 = i5;
  assign new_n18 = ~new_n5;
  assign new_n4 = i4;
  assign new_n17 = ~new_n4;
  assign new_n19 = new_n17 & new_n18;
  assign new_n787 = new_n12 & new_n19;
  assign new_n14 = ~new_n3;
  assign new_n15 = new_n13 & new_n14;
  assign new_n20 = new_n15 & new_n787;
  assign new_n24 = new_n20 ^ new_n23;
  assign new_n649 = new_n24 & new_n32;
  assign new_n40 = new_n2 & new_n3;
  assign new_n41 = ~new_n40;
  assign new_n38 = new_n0 & new_n1;
  assign new_n39 = ~new_n38;
  assign new_n42 = new_n39 & new_n41;
  assign new_n35 = new_n4 & new_n5;
  assign new_n36 = ~new_n35;
  assign new_n33 = new_n6 & new_n7;
  assign new_n34 = ~new_n33;
  assign new_n37 = new_n34 & new_n36;
  assign new_n43 = new_n37 & new_n42;
  assign new_n1642 = new_n17 & new_n5;
  assign new_n26 = new_n4 ^ new_n1642;
  assign new_n16 = new_n12 & new_n15;
  assign new_n25 = ~new_n16;
  assign new_n27 = new_n25 & new_n26;
  assign new_n28 = ~new_n27;
  assign new_n49 = new_n28 & new_n43;
  assign new_n8333 = new_n49 & new_n649;
  assign om_0 = new_n8333;
endmodule


