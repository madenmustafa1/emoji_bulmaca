import 'package:flutter/material.dart';

import '../utils/constants.dart';

class MainTitleWidget extends StatelessWidget {
  MainTitleWidget({
    Key? key,
  }) : super(key: key);

  late MediaQueryData queryData;
  Constants constants = Constants();

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
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
