import 'package:flutter/material.dart';
import '/utils/page.dart';
import '/widgets/button/answer_button.dart';
import '/widgets/button/back_button.dart';
import '/widgets/button/music_on_off.dart';
import '/widgets/image/emoji_happy.dart';
import '/widgets/image/emoji_image.dart';
import '/widgets/text/emoji_input_text.dart';
import '/widgets/text/count_widget.dart';

class SongPage extends StatefulWidget {
  final int totalCount;
  final String emojiKey;

  const SongPage({
    Key? key,
    this.totalCount = 0,
    required this.emojiKey,
  }) : super(key: key);

  @override
  _SongPageState createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SizedBox(
            height: queryData.size.height,
            width: queryData.size.width,
            child: Image.asset('assets/bg/bg.jpg', fit: BoxFit.fill),
          ),
          EmojiHappyAndSad(queryData: queryData),
          SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                SizedBox(height: queryData.size.height / 7.5),
                //Scor
                CountWidget(totalCount: widget.totalCount),

                //Emoji Image
                EmojiImage(
                    emojiKey: widget.emojiKey, totalCount: widget.totalCount),
                //Answer Button
                AnswerButton(),
                //Sized Box
                const SizedBox(height: 5),
                //Emoji input text
                EmojiInputText(totalCount: widget.totalCount),
              ],
            ),
          ),
          const BackButtonWidget(),
          MusicOnOffWidget(
            queryData: queryData,
            page: PAGE.SONG,
          ),
        ],
      ),
    );
  }
}
