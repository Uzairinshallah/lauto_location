import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle molengo({TextStyle? style}) =>
      GoogleFonts.molengo(textStyle: style);

  static TextStyle spliceSans({TextStyle? style}) =>
      GoogleFonts.splineSans(textStyle: style);

  static TextStyle quickSand({TextStyle? style}) =>
      GoogleFonts.quicksand(textStyle: style);

  static TextStyle monda({TextStyle? style}) =>
      GoogleFonts.monda(textStyle: style);
}
