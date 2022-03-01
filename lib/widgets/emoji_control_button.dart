import 'package:emoji_bulmaca/model/emoji_model.dart';
import 'package:emoji_bulmaca/model/input_text_model.dart';
import 'package:emoji_bulmaca/providers/song_page_provider.dart';
import 'package:emoji_bulmaca/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/score_model.dart';
import '../utils/toast.dart';
import 'emoji_operations.dart';

class EmojiControlButton extends ConsumerWidget {
  final int totalCount;
  EmojiControlButton({Key? key, required this.totalCount}) : super(key: key);

  Constants constants = Constants();
  EmojiOperations emojiOperations = EmojiOperations();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late Toast showToast;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    showToast = Toast(context);
    final double bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 12,
          child: SizedBox(
            height: double.infinity,
            child: ElevatedButton(
              //Input control->
              onPressed: () {
                inputControl(ref);
              },
              child: const Icon(Icons.send),
              style: ElevatedButton.styleFrom(primary: constants.BUTTON_COLOR),
            ),
          ),
        ),
      ),
    );
  }

  void inputControl(WidgetRef ref) async {
    ScoreModel scoreProvider = ref.watch(scoreNotifierProvider);
    TextModel textProvider = ref.watch(emojiInputTextNotifierProvider);
    String emojiKey = ref.read(emojiKeyNotifierProvider.notifier).getKey();

    if (totalCount > scoreProvider.score) {
      EmojiModel forEmojiName = await emojiOperations.getFirebaseEmojiInfo(
          emojiKey, scoreProvider.score);

      if (textProvider.text == forEmojiName.name) {
        ref.read(emojiInputTextNotifierProvider.notifier).text(value: "");
        ref
            .read(scoreNotifierProvider.notifier)
            .increaseTheScore(key: emojiKey);
      }
    } else {
      showToast.showToast();
    }
  }
}
