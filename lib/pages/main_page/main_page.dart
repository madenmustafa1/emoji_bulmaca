import 'package:emoji_bulmaca/widgets/button/music_on_off.dart';
import 'package:emoji_bulmaca/widgets/button/send_emoji_.dart';
import 'package:flutter/material.dart';
import '../../dependency_injection/setup.dart';
import '../../pages/main_page/emoji_list.dart';
import '../../utils/admob/show_ad.dart';
import '../../utils/play_sound.dart';
import '../../widgets/image/emoji_happy.dart';
import '../../widgets/text/main_page_title_widget.dart';
import '../../widgets/list/category_list_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late EmojiList emojiList;
  final PlaySound playSound = getIt<PlaySound>();

  @override
  void initState() {
    super.initState();
    playSound.playTutorial();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    emojiList = EmojiList(context);

    return Scaffold(
      //floatingActionButton: MusicOnOffWidget(queryData: queryData),
      body: Stack(
        children: [
          SizedBox(
            height: queryData.size.height,
            width: queryData.size.width,
            child: Image.asset(
              'assets/bg/bg.jpg',
              fit: BoxFit.fill,
            ),
          ),
          MusicOnOffWidget(queryData: queryData),
          EmojiHappyAndSad(queryData: queryData),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top + 85,
              ),
              MainTitleWidget(),
              SendEmoji(),
              const CategoryListWidget(),
              ShowAd()
            ],
          ),
        ],
      ),
    );
  }
}
