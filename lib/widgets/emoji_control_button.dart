import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../dependency_injection/setup.dart';
import '../model/score_model.dart';
import '../utils/play_sound.dart';
import '../model/emoji_model.dart';
import '../model/input_text_model.dart';
import '../providers/song_page_provider.dart';
import '../utils/constants.dart';
import 'emoji_operations.dart';

class EmojiControlButton extends ConsumerWidget {
  final int totalCount;
  EmojiControlButton({Key? key, required this.totalCount}) : super(key: key);

  final Constants constants = getIt<Constants>();
  final EmojiOperations emojiOperations = EmojiOperations();
  final PlaySound playSound = getIt<PlaySound>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScoreModel scoreProvider = ref.watch(scoreNotifierProvider);

    final double bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: returnPadding(context),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: bottomPadding),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 12,
              child: SizedBox(
                height: double.infinity,
                child: ElevatedButton(
                  //Input control->
                  onPressed: () {
                    inputControl(ref, scoreProvider);
                  },
                  child: const Icon(Icons.send),
                  style:
                      ElevatedButton.styleFrom(primary: constants.BUTTON_COLOR),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void inputControl(WidgetRef ref, ScoreModel scoreProvider) async {
    TextModel textProvider = ref.watch(emojiInputTextNotifierProvider);
    String emojiKey = ref.read(emojiKeyNotifierProvider.notifier).getKey();

    if (totalCount >= scoreProvider.score) {
      EmojiModel forEmojiName = await emojiOperations.getFirebaseEmojiInfo(
          emojiKey, scoreProvider.score);

      if (textProvider.text.replaceAll(' ', '') == forEmojiName.name) {
        ref.read(emojiInputTextNotifierProvider.notifier).text(value: "");
        ref
            .read(scoreNotifierProvider.notifier)
            .increaseTheScore(key: emojiKey);

        ref.read(inputClearNotifierProvider.notifier).clearInput();
        playSound.playTrueAudio();
      } else {
        if (textProvider.text.trim() != "") playSound.playWrongAudio();
      }
    }
  }

  EdgeInsetsGeometry returnPadding(BuildContext context) {
    return EdgeInsets.only(bottom: (MediaQuery.of(context).size.height / 250));
  }
}
