import 'package:emoji_bulmaca/model/voice_check_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VoiceChangeManager extends StateNotifier<VoiceCheckModel> {
  VoiceChangeManager() : super(VoiceCheckModel(false));

  String voiceCheckKey = "VOICE_CHECK";

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  void getVoiceState() async {
    state = await _prefs.then((SharedPreferences prefs) {
      return VoiceCheckModel(prefs.getBool(voiceCheckKey) ?? false);
    });
  }

  void setVoiceState() async {
    bool result = !state.voiceCheck;
    await _prefs.then((value) => value.setBool(voiceCheckKey, result));
    state = VoiceCheckModel(!state.voiceCheck);
  }
}
