import 'dart:async';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

import 'constants.dart';

class Toast {
  BuildContext context;
  Toast(this.context);

  void showToast() {
    MotionToast(
      toastDuration: const Duration(seconds: 3),
      icon: Icons.emoji_events,
      primaryColor: Colors.green,
      title: Text(CText.TOAST_TITLE),
      description: Text(CText.TOAST_INFO),
      position: MOTION_TOAST_POSITION.center,
      backgroundType: BACKGROUND_TYPE.transparent,
    ).show(context);

    //scheduleTimeout(3 * 1000);
  }

  Timer scheduleTimeout([int milliseconds = 3000]) =>
      Timer(Duration(milliseconds: milliseconds), handleTimeout);

  void handleTimeout() {
    Navigator.of(context).pop();
  }

  void customToast(String title, String message) {
    MotionToast(
      animationDuration: Duration(milliseconds: 200),
      toastDuration: const Duration(milliseconds: 200),
      icon: Icons.emoji_events,
      primaryColor: Colors.orange,
      title: Text(title),
      description: Text(message),
      position: MOTION_TOAST_POSITION.center,
    ).show(context);
  }
}
