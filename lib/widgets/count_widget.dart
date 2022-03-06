import 'package:emoji_bulmaca/model/score_model.dart';
import 'package:emoji_bulmaca/providers/song_page_provider.dart';
import 'package:emoji_bulmaca/widgets/constants_widgets.dart';
import 'package:emoji_bulmaca/widgets/emoji_operations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountWidget extends ConsumerWidget {
  int totalCount;
  CountWidget({Key? key, required this.totalCount}) : super(key: key);

  ConstantsWidgets constantsWidgets = ConstantsWidgets();
  EmojiOperations emojiOperations = EmojiOperations();

  late ScoreModel scoreProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    scoreProvider = ref.watch(scoreNotifierProvider);
    String emojiKey = ref.read(emojiKeyNotifierProvider.notifier).getKey();
    ref.read(scoreNotifierProvider.notifier).getScoreCount(emojiKey);

    return Row(
      children: [
        constantsWidgets.getSizedBox(context, 32),
        //Scor icon
        constantsWidgets.getIcon(Icons.star),
        //Scor count
        Align(
          alignment: Alignment.centerLeft,
          child: emojiOperations.newFutureBuilderText(
            scoreProvider.score,
          ),
        )
      ],
    );
  }
}
