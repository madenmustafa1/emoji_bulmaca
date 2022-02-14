import 'package:emoji_bulmaca/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ConstantsWidgets {
  Constants constants = Constants();

  SizedBox getSizedBox(BuildContext context, int division) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / division,
    );
  }

  Icon getIcon(IconData icon) {
    return Icon(
      icon,
      size: constants.MAIN_TITLE_NO_1,
      color: constants.BUTTON_COLOR,
    );
  }
}
