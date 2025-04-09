

module top ( 
    i0, i1, i2, i3, i4, i5, i6, i7,
    om_0  );
  input  i0, i1, i2, i3, i4, i5, i6, i7;
  output om_0;
  wire new_n10, new_n11, new_n12, new_n13, new_n14, new_n15, new_n16,
    new_n17, new_n18, new_n19, new_n20, new_n21, new_n22, new_n23, new_n24,
    new_n25, new_n26, new_n27, new_n28, new_n29, new_n30, new_n31, new_n32,
    new_n33, new_n34, new_n35, new_n36, new_n37, new_n38, new_n39, new_n40,
    new_n41, new_n42, new_n43, new_n44, new_n45;
  assign new_n10 = ~i0;
  assign new_n11 = ~i1;
  assign new_n12 = new_n11 & new_n10;
  assign new_n13 = ~i2;
  assign new_n14 = ~i3;
  assign new_n15 = new_n14 & new_n13;
  assign new_n16 = new_n15 & new_n12;
  assign new_n17 = ~i4;
  assign new_n18 = ~i5;
  assign new_n19 = new_n18 & new_n17;
  assign new_n20 = new_n19 & new_n16;
  assign new_n21 = ~i6;
  assign new_n22 = ~i7;
  assign new_n23 = new_n22 & new_n21;
  assign new_n24 = ~new_n23 ^ ~new_n20;
  assign new_n25 = ~new_n16;
  assign new_n26 = ~new_n19;
  assign new_n27 = new_n26 & new_n25;
  assign new_n28 = ~new_n27;
  assign new_n29 = ~new_n12;
  assign new_n30 = ~new_n15;
  assign new_n31 = new_n30 & new_n29;
  assign new_n32 = ~new_n31;
  assign new_n33 = i7 & i6;
  assign new_n34 = ~new_n33;
  assign new_n35 = i5 & i4;
  assign new_n36 = ~new_n35;
  assign new_n37 = new_n36 & new_n34;
  assign new_n38 = i1 & i0;
  assign new_n39 = ~new_n38;
  assign new_n40 = i3 & i2;
  assign new_n41 = ~new_n40;
  assign new_n42 = new_n41 & new_n39;
  assign new_n43 = new_n42 & new_n37;
  assign new_n44 = new_n43 & new_n32;
  assign new_n45 = new_n44 & new_n28;
  assign om_0 = new_n45 & new_n24;
endmodule


