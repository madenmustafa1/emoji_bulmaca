import 'package:emoji_bulmaca/widgets/emoji_operations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/score_model.dart';
import '../providers/song_page_provider.dart';

class EmojiImage extends ConsumerWidget {
  final String emojiKey;
  EmojiImage({Key? key, required this.emojiKey}) : super(key: key);

  EmojiOperations emojiOperations = EmojiOperations();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    ScoreModel scoreProvider = ref.watch(scoreNotifierProvider);
    ref.read(emojiKeyNotifierProvider.notifier).setKey(emojiKey);
 
    return SizedBox(
      height: queryData.size.height / 2.8,
      child: emojiOperations.getEmojiPhoto(
        emojiKey,
        scoreProvider.score,
        queryData,
      ),
    );
  }
}
