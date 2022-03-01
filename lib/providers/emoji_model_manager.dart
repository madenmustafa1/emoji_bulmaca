import 'package:emoji_bulmaca/model/emoji_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmojiManager extends StateNotifier<EmojiModel> {
  EmojiManager() : super(const EmojiModel("","",""));

}
