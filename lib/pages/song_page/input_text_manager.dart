import 'package:emoji_bulmaca/model/input_text_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputTextManager extends StateNotifier<TextModel> {
  InputTextManager() : super(TextModel(""));

  void text({required String value}) {
    debugPrint("text");
    state = TextModel(state.text);
  }

  void setText() {
    debugPrint("settext");
    state = TextModel("");
  }
}
