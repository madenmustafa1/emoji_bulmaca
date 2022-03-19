import 'package:emoji_bulmaca/model/input_text_clear_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputClearManager extends StateNotifier<InputClearModel> {
  InputClearManager() : super(InputClearModel(false));

  void clearInput() => state = InputClearModel(true);
  void dontClear() => state = InputClearModel(false);
}
