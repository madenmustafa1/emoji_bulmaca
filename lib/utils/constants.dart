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
      color: TEXT_COLOR,
    );
  }

  // ignore: non_constant_identifier_names
  Color BUTTON_COLOR = HexColor("#FFAF68");
  // ignore: non_constant_identifier_names
  Color TEXT_COLOR = HexColor("#404040");
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

class CText {
  // ignore: constant_identifier_names
  static const String TOAST_TITLE = "Başardın!";
  // ignore: constant_identifier_names
  static const String TOAST_INFO =
      "Tebrikler bölümü tamamladın. Hadi diğer bölümlere geçelim.";
// ignore: constant_identifier_names
  static const String FINISH_CHAPTER_INFO = "Tebrikler bölümü tamamladın!";
  // ignore: constant_identifier_names
  static const String FINISH_CHAPTER_TEXT = "Geri dön";


  // ignore: constant_identifier_names
  static const String INPUT_DIALOG_TITLE = "Uygulamada hangi kategori veya içeriği görmek istersin?";

  // ignore: constant_identifier_names
  static const String INPUT_DIALOG_TITLE_ID = "Görmek istediğin şarkı nedir?";

  // ignore: constant_identifier_names
  static const String CLOSE = "KAPAT";
  // ignore: constant_identifier_names
  static const String SEND = "GÖNDER";
}
