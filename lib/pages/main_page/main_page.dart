import 'package:flutter/material.dart';
import '../../dependency_injection/setup.dart';
import '../../pages/main_page/emoji_list.dart';
import '../../utils/play_sound.dart';
import '../../widgets/emoji_happy.dart';
import '../../widgets/main_page_title_widget.dart';
import '../../widgets/category_list_widget.dart';

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
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    emojiList = EmojiList(context);

    return Scaffold(
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
          EmojiHappyAndSad(queryData: queryData),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top + 85,
              ),
              MainTitleWidget(),
              const CategoryListWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
