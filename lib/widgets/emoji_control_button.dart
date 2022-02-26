import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../pages/song_page/song_page_vm.dart';

class EmojiControlButton extends ConsumerWidget {
  const EmojiControlButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                ref
                    .read(scoreNotifierProvider.notifier)
                    .increaseTheScore(scoreI: 100);
              },
              child: const Icon(Icons.send),
              // style: ElevatedButton.styleFrom(    primary: constants.BUTTON_COLOR),
            ),
          ),
        ),
      ),
    );
  }
}


