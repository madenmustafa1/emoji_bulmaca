import 'package:flutter/material.dart';

import '../utils/constants.dart';

class MainTitleWidget extends StatelessWidget {
  MainTitleWidget({
    Key? key,
  }) : super(key: key);

  final Constants constants = Constants();

  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    return Center(
      child: Column(
        children: [
          Text(
            "Emoji Bulmaca",
            style: constants.returnTextStyle(constants.MAIN_TITLE_NO_1),
          ),
          SizedBox(
            height: queryData.size.height / 60,
          ),
          const Text(
            "Kategoriler",
            style: TextStyle(
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
