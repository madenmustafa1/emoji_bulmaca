import 'package:flutter/material.dart';

import '../utils/constants.dart';

class MainTitleWidget extends StatelessWidget {
  const MainTitleWidget({
    Key? key,
    required this.constants,
    required this.queryData,
  }) : super(key: key);

  final Constants constants;
  final MediaQueryData queryData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "Emoji bulmaca",
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
