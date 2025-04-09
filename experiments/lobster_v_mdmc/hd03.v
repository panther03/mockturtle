// Benchmark "hd03" written by ABC on Thu Mar 27 16:00:18 2025

module top ( 
    i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15,
    om_0, om_1, om_2, om_3, om_4, om_5, om_6, om_7  );
  input  i0, i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14,
    i15;
  output om_0, om_1, om_2, om_3, om_4, om_5, om_6, om_7;
  wire new_n15, new_n7, new_n70, new_n79, new_n80, new_n14, new_n6, new_n69,
    new_n71, new_n60, new_n13, new_n5, new_n59, new_n61, new_n53, new_n12,
    new_n4, new_n52, new_n56, new_n66, new_n65, new_n67, new_n76, new_n75,
    new_n77, new_n54, new_n63, new_n73, new_n43, new_n11, new_n3, new_n42,
    new_n44, new_n36, new_n10, new_n2, new_n35, new_n39, new_n49, new_n48,
    new_n50, new_n37, new_n46, new_n28, new_n9, new_n1, new_n26, new_n33,
    new_n27, new_n29, new_n31, new_n20, new_n21, new_n23, new_n8, new_n0,
    new_n18, new_n24, new_n32, new_n34, new_n47, new_n51, new_n74, new_n78,
    new_n81, new_n64, new_n68, new_n72, new_n57, new_n58, new_n62, new_n55,
    new_n40, new_n41, new_n45, new_n38, new_n25, new_n30, new_n19, new_n22;
  assign new_n15 = i15;
  assign new_n7 = i7;
  assign new_n70 = new_n7 ^ new_n15;
  assign new_n79 = new_n7 & new_n15;
  assign new_n80 = new_n79 ^ new_n70;
  assign new_n14 = i14;
  assign new_n6 = i6;
  assign new_n69 = new_n6 & new_n14;
  assign new_n71 = new_n69 ^ new_n70;
  assign new_n60 = new_n6 ^ new_n14;
  assign new_n13 = i13;
  assign new_n5 = i5;
  assign new_n59 = new_n5 & new_n13;
  assign new_n61 = new_n59 ^ new_n60;
  assign new_n53 = new_n5 ^ new_n13;
  assign new_n12 = i12;
  assign new_n4 = i4;
  assign new_n52 = new_n4 & new_n12;
  assign new_n56 = new_n52 & new_n53;
  assign new_n66 = new_n56 & new_n61;
  assign new_n65 = new_n59 & new_n60;
  assign new_n67 = new_n65 ^ new_n66;
  assign new_n76 = new_n67 & new_n71;
  assign new_n75 = new_n69 & new_n70;
  assign new_n77 = new_n75 ^ new_n76;
  assign new_n54 = new_n52 ^ new_n53;
  assign new_n63 = new_n54 & new_n61;
  assign new_n73 = new_n63 & new_n71;
  assign new_n43 = new_n4 ^ new_n12;
  assign new_n11 = i11;
  assign new_n3 = i3;
  assign new_n42 = new_n3 & new_n11;
  assign new_n44 = new_n42 ^ new_n43;
  assign new_n36 = new_n3 ^ new_n11;
  assign new_n10 = i10;
  assign new_n2 = i2;
  assign new_n35 = new_n2 & new_n10;
  assign new_n39 = new_n35 & new_n36;
  assign new_n49 = new_n39 & new_n44;
  assign new_n48 = new_n42 & new_n43;
  assign new_n50 = new_n48 ^ new_n49;
  assign new_n37 = new_n35 ^ new_n36;
  assign new_n46 = new_n37 & new_n44;
  assign new_n28 = new_n2 ^ new_n10;
  assign new_n9 = i9;
  assign new_n1 = i1;
  assign new_n26 = new_n1 & new_n9;
  assign new_n33 = new_n26 & new_n28;
  assign new_n27 = ~new_n26;
  assign new_n29 = new_n27 ^ new_n28;
  assign new_n31 = ~new_n29;
  assign new_n20 = ~new_n1;
  assign new_n21 = new_n20 ^ new_n9;
  assign new_n23 = ~new_n21;
  assign new_n8 = i8;
  assign new_n0 = i0;
  assign new_n18 = new_n0 & new_n8;
  assign new_n24 = new_n18 & new_n23;
  assign new_n32 = new_n24 & new_n31;
  assign new_n34 = new_n32 ^ new_n33;
  assign new_n47 = new_n34 & new_n46;
  assign new_n51 = new_n47 ^ new_n50;
  assign new_n74 = new_n51 & new_n73;
  assign new_n78 = new_n74 ^ new_n77;
  assign new_n81 = new_n78 ^ new_n80;
  assign new_n64 = new_n51 & new_n63;
  assign new_n68 = new_n64 ^ new_n67;
  assign new_n72 = new_n68 ^ new_n71;
  assign new_n57 = new_n51 & new_n54;
  assign new_n58 = new_n56 ^ new_n57;
  assign new_n62 = new_n58 ^ new_n61;
  assign new_n55 = new_n51 ^ new_n54;
  assign new_n40 = new_n34 & new_n37;
  assign new_n41 = new_n39 ^ new_n40;
  assign new_n45 = new_n41 ^ new_n44;
  assign new_n38 = new_n34 ^ new_n37;
  assign new_n25 = ~new_n24;
  assign new_n30 = new_n25 ^ new_n29;
  assign new_n19 = ~new_n18;
  assign new_n22 = new_n19 ^ new_n21;
  assign om_0 = new_n22;
  assign om_1 = new_n30;
  assign om_2 = new_n38;
  assign om_3 = new_n45;
  assign om_4 = new_n55;
  assign om_5 = new_n62;
  assign om_6 = new_n72;
  assign om_7 = new_n81;
endmodule


