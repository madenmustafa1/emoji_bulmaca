import '/model/score_model.dart';
import '/providers/song_page_provider.dart';
import '/widgets/image/constants_widgets.dart';
import '/view_model/emoji_operations_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/dependency_injection/setup.dart';

class CountWidget extends ConsumerWidget {
  final int totalCount;
  CountWidget({Key? key, required this.totalCount}) : super(key: key);

  final ConstantsWidgets constantsWidgets = ConstantsWidgets();
  final EmojiOperationsViewModel emojiOperations =
      getIt<EmojiOperationsViewModel>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScoreModel scoreProvider = ref.watch(scoreNotifierProvider);
    String emojiKey = ref.read(emojiKeyNotifierProvider.notifier).getKey();
    ref.read(scoreNotifierProvider.notifier).getScoreCount(emojiKey);

    debugPrint("123123124124");

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
