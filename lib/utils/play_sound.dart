import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlaySound {
  static void playTutorial() async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    String tutorialKey = "tutorial";
    bool tutorialShow = await _prefs.then((SharedPreferences prefs) {
      return prefs.getBool(tutorialKey) ?? true;
    });

    if (tutorialShow) {
      AudioCache cache = AudioCache();
      await cache.play("audio/tutorial.mp3");
      await _prefs.then((SharedPreferences prefs) {
        return prefs.setBool(tutorialKey, false);
      });
    }
  }

  static void playWrongAudio() async {
    int random = Random().nextInt(4) + 1;
    AudioCache cache = AudioCache();
    await cache.play("audio/wrong$random.mp3");
  }

  static void playTrueAudio() async {
    int random = Random().nextInt(4) + 1;
    AudioCache cache = AudioCache();
    await cache.play("audio/true$random.mp3");
  }

  Widget audioVisualizer(MediaQueryData queryData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.all(queryData.size.height / 40),
              child: Opacity(
                opacity: 0.8,
                child: Lottie.asset(
                  'assets/bg/mic_visualize.json',
                  height: queryData.size.height / 12,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
