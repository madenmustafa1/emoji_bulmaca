
import 'package:emoji_bulmaca/model/score_model.dart';
import 'package:emoji_bulmaca/pages/song_page/song_page_vm.dart';
import 'package:emoji_bulmaca/widgets/constants_widgets.dart';
import 'package:emoji_bulmaca/widgets/emoji_operations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountWidget extends ConsumerWidget {
  CountWidget({Key? key}) : super(key: key);

  ConstantsWidgets constantsWidgets = ConstantsWidgets();
  EmojiOperations emojiOperations = EmojiOperations();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScoreModel scoreProvider = ref.watch(scoreNotifierProvider);
    return Row(
      children: [
        constantsWidgets.getSizedBox(context, 32),
        //Scor icon
        constantsWidgets.getIcon(Icons.star),
        //Scor count
        Align(
          alignment: Alignment.centerLeft,
          child: emojiOperations.newFutureBuilderText2(
            scoreProvider.score,
          ),
        )
      ],
    );
  }
}


