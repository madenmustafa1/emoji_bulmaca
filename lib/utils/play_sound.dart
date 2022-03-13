import 'dart:math';

import 'package:audioplayers/audioplayers.dart';

playTutorial() async {
  AudioCache cache = AudioCache();
  return await cache.play("audio/tutorial.wav");
}

playWrongAudio() async {
  var rng = Random();
  for (var i = 0; i < 100; i++) {
    rng.nextInt(4);
  }

  AudioCache cache = AudioCache();
  return await cache.play("audio/tutorial.wav");
}

playTrueAudio({int index = 0}) async {
  AudioCache cache = AudioCache();
  return await cache.play("audio/tutorial.wav");
}
