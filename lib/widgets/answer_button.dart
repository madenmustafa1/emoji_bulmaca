import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../model/emoji_model.dart';
import '../model/score_model.dart';
import '../providers/song_page_provider.dart';
import 'emoji_operations.dart';

class AnswerButton extends ConsumerWidget {
  AnswerButton({Key? key}) : super(key: key);

  EmojiOperations emojiOperations = EmojiOperations();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        getEmojiAnswer(ref);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Lottie.asset(
            'assets/img/button/think_anim2.json',
            height: size.height / 12,
          ),
          SizedBox(width: size.width / 50),
        ],
      ),
    );
  }

  void getEmojiAnswer(WidgetRef ref) async {
    ScoreModel scoreProvider = ref.watch(scoreNotifierProvider);
    String emojiKey = ref.read(emojiKeyNotifierProvider.notifier).getKey();
    EmojiModel forEmojiName = await emojiOperations.getFirebaseEmojiInfo(
        emojiKey, scoreProvider.score);

    ref.read(inputClearNotifierProvider.notifier).clearInput();
    ref
        .read(emojiInputTextNotifierProvider.notifier)
        .text(value: forEmojiName.name);
  }
}
