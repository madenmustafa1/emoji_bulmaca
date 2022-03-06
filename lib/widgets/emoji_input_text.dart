import 'dart:async';
import 'package:emoji_bulmaca/providers/song_page_provider.dart';
import 'package:emoji_bulmaca/widgets/emoji_control_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/score_model.dart';
import '../utils/toast.dart';

class EmojiInputText extends ConsumerStatefulWidget {
  final int totalCount;
  const EmojiInputText({Key? key, required this.totalCount}) : super(key: key);

  @override
  _EmojiInputTextState createState() => _EmojiInputTextState();
}

class _EmojiInputTextState extends ConsumerState<EmojiInputText> {
  TextEditingController emojiTextController = TextEditingController();

  Timer scheduleTimeout([int milliseconds = 1000]) =>
      Timer(Duration(milliseconds: milliseconds), handleTimeout);

  void handleTimeout() {
    ScoreModel scoreProvider = ref.watch(scoreNotifierProvider);
    if (scoreProvider.score >= widget.totalCount) {
      Toast showToast = Toast(context);
      showToast.showToast();
    }
  }

  @override
  void initState() {
    super.initState();

    scheduleTimeout();
  }

  @override
  void dispose() {
    super.dispose();
    scheduleTimeout().cancel();
  }

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.3,
            child: Padding(
              padding: EdgeInsets.only(bottom: bottomPadding),
              child: TextField(
                onChanged: (value) {
                  ref
                      .read(emojiInputTextNotifierProvider.notifier)
                      .text(value: value);
                },
                controller: emojiTextController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal)),
                  hintText: 'Tahminin nedir?',
                  //helperText: 'Tahminin nedir?',
                  labelText: 'Şarkıyı bul',
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.green,
                  ),
                  suffixStyle: TextStyle(color: Colors.green),
                ),
              ),
            ),
          ),
          EmojiControlButton(
            totalCount: widget.totalCount,
          ),
        ],
      ),
    );
  }
}
