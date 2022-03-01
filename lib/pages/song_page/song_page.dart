import 'dart:async';
import 'package:emoji_bulmaca/model/emoji_model.dart';
import 'package:emoji_bulmaca/utils/constants.dart';
import 'package:emoji_bulmaca/utils/toast.dart';
import 'package:emoji_bulmaca/widgets/count_widget.dart';
import 'package:emoji_bulmaca/widgets/emoji_control_button.dart';
import 'package:emoji_bulmaca/widgets/emoji_operations.dart';
import 'package:emoji_bulmaca/widgets/constants_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/emoji_image.dart';
import '../../widgets/emoji_input_text.dart';

class SongPage extends StatefulWidget {
  final int totalCount;
  final String emojiKey;

  const SongPage({Key? key, this.totalCount = 0, required this.emojiKey})
      : super(key: key);

  @override
  _SongPageState createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  int imageCount = 1;
  late Future<int> songsCount;
  late Future<EmojiModel> emojiModel;

  late Constants constants;
  late EmojiOperations emojiOperations;
  late ConstantsWidgets constantsWidgets;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> _incrementImageCount(int imageCount2) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt(widget.emojiKey, imageCount2).then((bool success) {});
  }

  @override
  void initState() {
    constants = Constants();
    emojiOperations = EmojiOperations();
    constantsWidgets = ConstantsWidgets();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    songsCount = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt(widget.emojiKey) ?? 1;
    });

    final double bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            //Scor
            CountWidget(totalCount: widget.totalCount),
            //Emoji Image
            EmojiImage(emojiKey: widget.emojiKey),
            //
            const SizedBox(height: 10),
            //Emoji input text
            EmojiInputText(totalCount: widget.totalCount),
          ],
        ),
      ),
    );
  }
}
