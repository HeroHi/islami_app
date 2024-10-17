import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyles {
  static TextStyle appBarTextStyle = GoogleFonts.elMessiri(
      fontWeight: FontWeight.w700, fontSize: 30, color: Colors.black);
  static TextStyle semiBold = GoogleFonts.elMessiri(
      fontWeight: FontWeight.w600, fontSize: 25, color: Colors.black);
  static TextStyle intermediate = GoogleFonts.inter(
      fontWeight: FontWeight.w400, fontSize: 25, color: Colors.black);
  static TextStyle contentStyle = intermediate.copyWith(fontSize: 20);
}
