import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmojiKeyManager extends StateNotifier<String> {
  EmojiKeyManager() : super("");

  void setKey(String key) => state = key;
  String getKey() => state;
}
