import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.red,
          ),
          textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(color: Colors.white),
          )),
      child: const Text(CText.CLOSE),
      onPressed: () => Navigator.pop(context),
    );
  }
}
