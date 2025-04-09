

module top ( 
    i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15,
    om_0, om_1, om_2, om_3, om_4, om_5, om_6, om_7  );
  input  i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14,
    i15;
  output om_0, om_1, om_2, om_3, om_4, om_5, om_6, om_7;
  wire new_n25, new_n26, new_n27, new_n28, new_n30, new_n31, new_n32,
    new_n33, new_n34, new_n35, new_n36, new_n38, new_n39, new_n40, new_n41,
    new_n42, new_n43, new_n44, new_n46, new_n47, new_n48, new_n49, new_n50,
    new_n51, new_n53, new_n54, new_n55, new_n56, new_n57, new_n58, new_n59,
    new_n60, new_n61, new_n63, new_n64, new_n65, new_n66, new_n67, new_n68,
    new_n70, new_n71, new_n72, new_n73, new_n74, new_n75, new_n76, new_n77,
    new_n78, new_n80, new_n81, new_n82, new_n83, new_n84, new_n85, new_n86,
    new_n87;
  assign new_n25 = i8 & i0;
  assign new_n26 = ~new_n25;
  assign new_n27 = ~i1;
  assign new_n28 = ~i9 ^ ~new_n27;
  assign om_0 = ~new_n28 ^ ~new_n26;
  assign new_n30 = ~new_n28;
  assign new_n31 = new_n30 & new_n25;
  assign new_n32 = ~new_n31;
  assign new_n33 = i9 & i1;
  assign new_n34 = ~new_n33;
  assign new_n35 = ~i10 ^ ~i2;
  assign new_n36 = ~new_n35 ^ ~new_n34;
  assign om_1 = ~new_n36 ^ ~new_n32;
  assign new_n38 = ~new_n36;
  assign new_n39 = new_n38 & new_n31;
  assign new_n40 = new_n35 & new_n33;
  assign new_n41 = ~new_n40 ^ ~new_n39;
  assign new_n42 = i10 & i2;
  assign new_n43 = ~i11 ^ ~i3;
  assign new_n44 = ~new_n43 ^ ~new_n42;
  assign om_2 = ~new_n44 ^ ~new_n41;
  assign new_n46 = new_n43 & new_n42;
  assign new_n47 = new_n44 & new_n41;
  assign new_n48 = ~new_n47 ^ ~new_n46;
  assign new_n49 = i11 & i3;
  assign new_n50 = ~i12 ^ ~i4;
  assign new_n51 = ~new_n50 ^ ~new_n49;
  assign om_3 = ~new_n51 ^ ~new_n48;
  assign new_n53 = new_n51 & new_n44;
  assign new_n54 = new_n53 & new_n41;
  assign new_n55 = new_n50 & new_n49;
  assign new_n56 = new_n51 & new_n46;
  assign new_n57 = ~new_n56 ^ ~new_n55;
  assign new_n58 = ~new_n57 ^ ~new_n54;
  assign new_n59 = i12 & i4;
  assign new_n60 = ~i13 ^ ~i5;
  assign new_n61 = ~new_n60 ^ ~new_n59;
  assign om_4 = ~new_n61 ^ ~new_n58;
  assign new_n63 = new_n60 & new_n59;
  assign new_n64 = new_n61 & new_n58;
  assign new_n65 = ~new_n64 ^ ~new_n63;
  assign new_n66 = i13 & i5;
  assign new_n67 = ~i14 ^ ~i6;
  assign new_n68 = ~new_n67 ^ ~new_n66;
  assign om_5 = ~new_n68 ^ ~new_n65;
  assign new_n70 = new_n68 & new_n61;
  assign new_n71 = new_n70 & new_n58;
  assign new_n72 = new_n67 & new_n66;
  assign new_n73 = new_n68 & new_n63;
  assign new_n74 = ~new_n73 ^ ~new_n72;
  assign new_n75 = ~new_n74 ^ ~new_n71;
  assign new_n76 = i14 & i6;
  assign new_n77 = ~i15 ^ ~i7;
  assign new_n78 = ~new_n77 ^ ~new_n76;
  assign om_6 = ~new_n78 ^ ~new_n75;
  assign new_n80 = new_n78 & new_n70;
  assign new_n81 = new_n80 & new_n58;
  assign new_n82 = new_n77 & new_n76;
  assign new_n83 = new_n78 & new_n74;
  assign new_n84 = ~new_n83 ^ ~new_n82;
  assign new_n85 = ~new_n84 ^ ~new_n81;
  assign new_n86 = i15 & i7;
  assign new_n87 = ~new_n77 ^ ~new_n86;
  assign om_7 = ~new_n87 ^ ~new_n85;
endmodule


