import 'package:emoji_bulmaca/model/input_text_model.dart';
import 'package:emoji_bulmaca/pages/song_page/song_page_provider.dart';
import 'package:emoji_bulmaca/widgets/emoji_control_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmojiInputText extends ConsumerStatefulWidget {
  final int totalCount;
  EmojiInputText({Key? key, required this.totalCount}) : super(key: key);

  @override
  _EmojiInputTextState createState() => _EmojiInputTextState();
}

class _EmojiInputTextState extends ConsumerState<EmojiInputText> {
  TextEditingController emojiTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).viewInsets.bottom;
    TextModel textProvider = ref.watch(emojiInputTextNotifierProvider);

    if (textProvider.text != "") {
      // Or check if appState.username != null or what ever your use case is.
      emojiTextController.text = textProvider.text ?? '';
    }

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
                  helperText: 'Tahminin nedir?',
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
