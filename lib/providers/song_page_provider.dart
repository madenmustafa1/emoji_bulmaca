import 'package:emoji_bulmaca/model/emoji_model.dart';
import 'package:emoji_bulmaca/model/input_text_model.dart';
import 'package:emoji_bulmaca/providers/emoji_key_manager.dart';
import 'package:emoji_bulmaca/providers/emoji_model_manager.dart';
import 'package:emoji_bulmaca/providers/score_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/score_model.dart';
import 'input_text_manager.dart';

final StateNotifierProvider<ScoreManager, ScoreModel> scoreNotifierProvider =
    StateNotifierProvider<ScoreManager, ScoreModel>((ref) {
  return ScoreManager();
});

final StateNotifierProvider<EmojiManager, EmojiModel> emojiModelNotifierProvider =     StateNotifierProvider<EmojiManager, EmojiModel>((ref) {
  return EmojiManager();
});


final StateNotifierProvider<InputTextManager, TextModel> emojiInputTextNotifierProvider =     StateNotifierProvider<InputTextManager, TextModel>((ref) {
  return InputTextManager();
});

final StateNotifierProvider<EmojiKeyManager, String> emojiKeyNotifierProvider =     
StateNotifierProvider<EmojiKeyManager, String>((ref) {
  return EmojiKeyManager();
});

