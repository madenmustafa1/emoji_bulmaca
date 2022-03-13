import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/input_text_clear_model.dart';
import '../model/score_model.dart';
import '../utils/constants.dart';
import '../utils/toast.dart';
import '../providers/song_page_provider.dart';
import '../widgets/emoji_control_button.dart';

class EmojiInputText extends ConsumerStatefulWidget {
  final int totalCount;
  const EmojiInputText({Key? key, required this.totalCount}) : super(key: key);

  @override
  _EmojiInputTextState createState() => _EmojiInputTextState();
}

class _EmojiInputTextState extends ConsumerState<EmojiInputText> {
  TextEditingController emojiTextController = TextEditingController();

  Constants constants = Constants();

  Timer scheduleTimeout([int milliseconds = 1000]) =>
      Timer(Duration(milliseconds: milliseconds), handleTimeout);

  void handleTimeout() {
    ScoreModel scoreProvider = ref.watch(scoreNotifierProvider);
    if (scoreProvider.score > widget.totalCount) {
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
    clearInput();
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
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: constants.BUTTON_COLOR)),
                  hintText: 'Tahminin nedir?',
                  labelText: 'Şarkıyı bul',
                  suffixStyle: TextStyle(color: constants.BUTTON_COLOR),
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

  void clearInput() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      InputClearModel clearInput = ref.watch(inputClearNotifierProvider);
      if (clearInput.inputClear) {
        emojiTextController.text = "";
        ref.read(inputClearNotifierProvider.notifier).dontClear();
      }
    });
  }
}
