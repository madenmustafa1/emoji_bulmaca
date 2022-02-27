import 'package:emoji_bulmaca/model/input_text_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputTextManager extends StateNotifier<TextModel> {
  InputTextManager() : super(TextModel(""));

  void text({required String value}) {
    state = TextModel(state.text);
  }

  void setText() {
    state = TextModel("");
  }
}
