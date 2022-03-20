import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../dependency_injection/setup.dart';
import '../utils/constants.dart';

class FinishWidget extends StatelessWidget {
  const FinishWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Constants constants = getIt<Constants>();

    return Column(
      children: [
        Center(child: finishAnim(size)),
        Text(
          CText.FINISH_CHAPTER_INFO,
          style: constants.returnTextStyle(26),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: SizedBox(
            width: size.width / 2,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                CText.FINISH_CHAPTER_TEXT,
                style: constants.returnTextStyle(16),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(constants.BUTTON_COLOR),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget finishAnim(Size size) {
    return Lottie.asset(
      'assets/anim/congratulations.json',
      height: size.height / 2.5,
    );
  }
}
