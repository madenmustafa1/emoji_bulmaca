import 'package:emoji_bulmaca/model/add_emoji_model.dart';
import 'package:emoji_bulmaca/utils/constants.dart';
import 'package:emoji_bulmaca/widgets/button/cancel_button.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../dependency_injection/setup.dart';
import '../../view_model/emoji_operations_vm.dart';

class SendEmoji extends StatelessWidget {
  SendEmoji({Key? key}) : super(key: key);

  final EmojiOperationsViewModel emojiOperations =
      getIt<EmojiOperationsViewModel>();

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: queryData.size.width / 6,
          child: InkWell(
            onTap: () => _displayTextInputDialog(context),
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }

  final TextEditingController _textFieldController = TextEditingController();

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(CText.INPUT_DIALOG_TITLE),
            content: TextField(
              onChanged: (value) {},
              controller: _textFieldController,
              decoration:
                  const InputDecoration(hintText: CText.INPUT_DIALOG_TITLE_ID),
            ),
            actions: <Widget>[
              const CancelButton(),
              sendButton(context),
            ],
          );
        });
  }

  ElevatedButton sendButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Colors.green,
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(color: Colors.white),
        ),
      ),
      child: const Text(CText.SEND),
      onPressed: () {
        if (_textFieldController.text.trim() != "") {
          emojiOperations.addEmoji(
            AddEmojiModel(_textFieldController.text.trim(), const Uuid().v1()),
          );
        }
        Navigator.pop(context);
      },
    );
  }
}
