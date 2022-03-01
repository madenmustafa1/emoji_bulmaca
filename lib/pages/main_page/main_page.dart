import 'package:emoji_bulmaca/model/emoji_list_model.dart';
import 'package:emoji_bulmaca/pages/main_page/emoji_list.dart';
import 'package:emoji_bulmaca/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> data = [];

  final List<int> colorCodes = <int>[600, 500, 100];

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
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top + 50,
          ),
          Center(
            child: Column(
              children: [
                Text(
                  "Emoji bulmaca",
                  style: constants.returnTextStyle(constants.MAIN_TITLE_NO_1),
                ),
                SizedBox(
                  height: queryData.size.height / 60,
                ),
                const Text(
                  "Kategoriler",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: FutureBuilder<List<EmojiListModel>>(
            future: emojiList.getEmojiList(),
            builder: (context, AsyncSnapshot<List<EmojiListModel>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    EmojiListModel emojiListModel = snapshot.data![index];
                    return emojiList.listViewItem(
                      emojiListModel.coverUrl,
                      queryData,
                      emojiListModel.totalCount,
                      emojiListModel.name,
                    );
                  },
                );
              }
            },
          ))
        ],
      ),
    );
  }
}
