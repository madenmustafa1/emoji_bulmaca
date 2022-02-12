import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {

  // ignore: non_constant_identifier_names
  double MAIN_TITLE_NO_1 = 40;
  // ignore: non_constant_identifier_names
  double MAIN_TITLE_NO_2 = 30;
  // ignore: non_constant_identifier_names
  double MAIN_TITLE_NO_3 = 20;

   TextStyle returnTextStyle(double customFontSize) {
    return GoogleFonts.lato(
      fontWeight: FontWeight.w900,
      fontSize: customFontSize,
    );
  }



  // ignore: non_constant_identifier_names
  Color BUTTON_COLOR = HexColor("#FFAF68");
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
