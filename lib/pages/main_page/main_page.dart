import 'package:emoji_bulmaca/pages/main_page/emoji_list.dart';
import 'package:emoji_bulmaca/utils/constants.dart';
import 'package:emoji_bulmaca/widgets/emoji_happy.dart';
import 'package:emoji_bulmaca/widgets/main_page_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/category_list_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> songsCount;

  late EmojiList emojiList;

  @override
  void initState() {
    songsCount = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('songs') ?? 1;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    Constants constants = Constants();
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
              height: MediaQuery.of(context).padding.top + 50,
            ),
            MainTitleWidget(constants: constants, queryData: queryData),
            CategoryListWidget(emojiList: emojiList, queryData: queryData)
          ],
        ),
      ],
    ));
  }
}
