// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/dependency_injection/setup.dart';
import '/model/score_model.dart';
import '/providers/song_page_provider.dart';
import '/view_model/emoji_operations_vm.dart';

class EmojiImage extends ConsumerWidget {
  final String emojiKey;
  final int totalCount;
  EmojiImage({Key? key, required this.emojiKey, required this.totalCount})
      : super(key: key);

  final EmojiOperationsViewModel emojiOperations =
      getIt<EmojiOperationsViewModel>();
  ScoreModel? scoreProvider;
  bool setKeyEnabled = true;
  int count = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MediaQueryData queryData = MediaQuery.of(context);

    //scoreProvider ??= ref.watch(scoreNotifierProvider);
    ScoreModel scoreProvider = ref.watch(scoreNotifierProvider);
    debugPrint("1123123124124124");

    ref.read(emojiKeyNotifierProvider.notifier).setKey(emojiKey);

    return getEmoji(scoreProvider, queryData);
  }

  Widget getEmoji(ScoreModel scoreProvider, MediaQueryData queryData) {
    //var score = ref.read(scoreNotifierProvider).score;

    if (scoreProvider.score <= totalCount) {
      return SizedBox(
        height: queryData.size.height / 2.8,
        child: emojiOperations.getEmojiPhoto(
          emojiKey,
          scoreProvider.score,
          queryData,
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
