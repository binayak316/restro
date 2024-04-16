import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primary = Color.fromARGB(255, 34, 206, 236);
  static const Color primaryFaded =  Color.fromARGB(255, 164, 234, 247);
  static const Color blackColor = Colors.black;
  static const Color whiteColor = Colors.white;
  static const Color borderColor = Colors.grey;
  static const Color redColor = Colors.red;

// -------------------------------------------------------

  static const Color yellowColor = Colors.yellow;
  static Color lightGrey = Color.fromARGB(255, 245, 245, 245);

  //Shimmer Colors
  static final Color shimmerBase = Colors.grey.withOpacity(0.40);
  static const Color shimmerHighlight = Color(0xFFE1E1E1);
  static final Color shimmerBaseLight = Colors.grey.withOpacity(0.10);

  // ----------------
  static const Color green = Color.fromARGB(255, 177, 228, 179);
}
