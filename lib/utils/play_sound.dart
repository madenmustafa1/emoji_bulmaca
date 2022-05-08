import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlaySound {
  String voiceCheckKey = "VOICE_CHECK";

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  bool voiceMute = false;
  Future<bool> voiceMuteCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(voiceCheckKey) ?? false;
  }

  void playTutorial() async {
    voiceMute = await voiceMuteCheck();
    if (voiceMute) {
      return;
    }

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

  void playWrongAudio() async {
    voiceMute = await voiceMuteCheck();
    if (!voiceMute) {
      int random = Random().nextInt(4) + 1;
      AudioCache cache = AudioCache();
      await cache.play("audio/wrong$random.mp3");
    }
  }

  void playTrueAudio() async {
    bool voiceMute = await voiceMuteCheck();

    if (!voiceMute) {
      int random = Random().nextInt(4) + 1;
      AudioCache cache = AudioCache();
      await cache.play("audio/true$random.mp3");
    }
  }
}
