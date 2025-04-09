// Benchmark "hd07" written by ABC on Thu Mar 27 16:00:18 2025

module top ( 
    i0, i1, i2, i3, i4, i5, i6, i7,
    om_0, om_1, om_2, om_3, om_4, om_5, om_6, om_7  );
  input  i0, i1, i2, i3, i4, i5, i6, i7;
  output om_0, om_1, om_2, om_3, om_4, om_5, om_6, om_7;
  wire new_n6, new_n5, new_n316, new_n4, new_n300, new_n34, new_n302,
    new_n304, new_n37, new_n7, new_n357, new_n2, new_n898, new_n142,
    new_n821, new_n146, new_n3, new_n143, new_n1058, new_n141, new_n144,
    new_n147, new_n1137, new_n148, new_n149, new_n0, new_n118, new_n4011,
    new_n1, new_n10, new_n14418, new_n308, new_n309, new_n17, new_n27,
    new_n358, new_n14088, new_n372, new_n373, new_n4031, new_n1812,
    new_n18, new_n28, new_n5232, new_n339536, new_n1461, new_n59, new_n11,
    new_n4048, new_n42;
  assign new_n6 = i6;
  assign new_n5 = i5;
  assign new_n316 = new_n5 ^ new_n6;
  assign new_n4 = i4;
  assign new_n300 = new_n4 ^ new_n6;
  assign new_n34 = ~new_n5;
  assign new_n302 = new_n34 & new_n300;
  assign new_n304 = new_n302 ^ new_n316;
  assign new_n37 = ~new_n304;
  assign new_n7 = i7;
  assign new_n357 = new_n7 & new_n37;
  assign new_n2 = i2;
  assign new_n898 = 1'b0;
  assign new_n142 = new_n898 ^ new_n2;
  assign new_n821 = new_n4 ^ new_n142;
  assign new_n146 = ~new_n821;
  assign new_n3 = i3;
  assign new_n143 = new_n3 ^ new_n4;
  assign new_n1058 = new_n4 ^ new_n143;
  assign new_n141 = new_n2 ^ new_n4;
  assign new_n144 = new_n141 ^ new_n1058;
  assign new_n147 = new_n144 & new_n146;
  assign new_n1137 = new_n4 ^ new_n147;
  assign new_n148 = new_n141 ^ new_n1137;
  assign new_n149 = ~new_n148;
  assign new_n0 = i0;
  assign new_n118 = new_n0 ^ new_n2;
  assign new_n4011 = ~new_n118;
  assign new_n1 = i1;
  assign new_n10 = ~new_n1;
  assign new_n14418 = new_n10 & new_n4011;
  assign new_n308 = ~new_n14418;
  assign new_n309 = new_n2 ^ new_n308;
  assign new_n17 = ~new_n309;
  assign new_n27 = new_n17 & new_n149;
  assign new_n358 = new_n27 & new_n357;
  assign new_n14088 = new_n7 ^ new_n358;
  assign new_n372 = new_n6 & new_n37;
  assign new_n373 = new_n27 & new_n372;
  assign new_n4031 = new_n6 ^ new_n373;
  assign new_n1812 = new_n17 & new_n148;
  assign new_n18 = ~new_n17;
  assign new_n28 = new_n18 ^ new_n1812;
  assign new_n5232 = new_n5 & new_n28;
  assign new_n339536 = new_n4 & new_n28;
  assign new_n1461 = new_n3 & new_n18;
  assign new_n59 = new_n0 & new_n1;
  assign new_n11 = new_n0 ^ new_n59;
  assign new_n4048 = new_n2 & new_n11;
  assign new_n42 = 1'b0;
  assign om_0 = new_n42;
  assign om_1 = new_n42;
  assign om_2 = new_n4048;
  assign om_3 = new_n1461;
  assign om_4 = new_n339536;
  assign om_5 = new_n5232;
  assign om_6 = new_n4031;
  assign om_7 = new_n14088;
endmodule


