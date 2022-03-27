import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmojiHappyAndSad extends StatelessWidget {
  const EmojiHappyAndSad({
    Key? key,
    required this.queryData,
  }) : super(key: key);

  final MediaQueryData queryData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Opacity(
                opacity: 0.7,
                child: Lottie.asset(
                  'assets/bg/swing_happy.json',
                  //fit: BoxFit.fill,
                  height: queryData.size.height / 6,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
