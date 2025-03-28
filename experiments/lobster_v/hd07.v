

module top ( 
    i0, i1, i2, i3, i4, i5, i6, i7,
    om_0, om_1, om_2, om_3, om_4, om_5, om_6, om_7  );
  input  i0, i1, i2, i3, i4, i5, i6, i7;
  output om_0, om_1, om_2, om_3, om_4, om_5, om_6, om_7;
  wire new_n19, new_n20, new_n22, new_n23, new_n24, new_n25, new_n26,
    new_n27, new_n29, new_n30, new_n31, new_n32, new_n33, new_n34, new_n35,
    new_n36, new_n37, new_n40, new_n41, new_n42, new_n43, new_n44, new_n45,
    new_n46, new_n47, new_n48;
  assign new_n19 = ~i1;
  assign new_n20 = new_n19 & i0;
  assign om_2 = new_n20 & i2;
  assign new_n22 = ~new_n20;
  assign new_n23 = ~i2;
  assign new_n24 = new_n23 & i1;
  assign new_n25 = ~new_n24;
  assign new_n26 = new_n25 & new_n22;
  assign new_n27 = ~new_n26;
  assign om_3 = new_n27 & i3;
  assign new_n29 = i4 & i3;
  assign new_n30 = ~new_n29;
  assign new_n31 = ~i3;
  assign new_n32 = new_n31 & new_n23;
  assign new_n33 = ~new_n32;
  assign new_n34 = new_n33 & new_n30;
  assign new_n35 = ~new_n34;
  assign new_n36 = new_n35 & new_n26;
  assign new_n37 = ~new_n36;
  assign om_4 = new_n37 & i4;
  assign om_5 = new_n37 & i5;
  assign new_n40 = ~i6;
  assign new_n41 = new_n40 & i5;
  assign new_n42 = ~new_n41;
  assign new_n43 = ~i5;
  assign new_n44 = new_n43 & i4;
  assign new_n45 = ~new_n44;
  assign new_n46 = new_n45 & new_n42;
  assign new_n47 = new_n46 & new_n36;
  assign new_n48 = ~new_n47;
  assign om_6 = new_n48 & i6;
  assign om_7 = new_n48 & i7;
  assign om_0 = 1'b0;
  assign om_1 = 1'b0;
endmodule


