import '../model/emoji_model.dart';
import '../model/input_text_clear_model.dart';
import '../model/input_text_model.dart';
import '../providers/emoji_key_manager.dart';
import '../providers/emoji_model_manager.dart';
import '../providers/score_manager.dart';
import '../model/score_model.dart';
import 'input_clear_managar.dart';
import 'input_text_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateNotifierProvider<ScoreManager, ScoreModel> scoreNotifierProvider =
    StateNotifierProvider<ScoreManager, ScoreModel>((ref) => ScoreManager());

final StateNotifierProvider<EmojiManager, EmojiModel>
    emojiModelNotifierProvider =
    StateNotifierProvider<EmojiManager, EmojiModel>(((ref) => EmojiManager()));

final StateNotifierProvider<InputTextManager, TextModel>
    emojiInputTextNotifierProvider =
    StateNotifierProvider<InputTextManager, TextModel>(
        (ref) => InputTextManager());

final StateNotifierProvider<EmojiKeyManager, String> emojiKeyNotifierProvider =
    StateNotifierProvider<EmojiKeyManager, String>((ref) => EmojiKeyManager());

final StateNotifierProvider<InputClearManager, InputClearModel>
    inputClearNotifierProvider = StateNotifierProvider<InputClearManager, InputClearModel>(
        (ref) => InputClearManager());
