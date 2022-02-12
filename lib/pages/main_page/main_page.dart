import 'package:emoji_bulmaca/pages/song_page.dart';
import 'package:emoji_bulmaca/utils/constants.dart';
import 'package:emoji_bulmaca/utils/emoji_operations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> data = [];

  final List<String> entries = <String>['Sarkı', 'Atasözü', 'Kelime'];

  final List<int> colorCodes = <int>[600, 500, 100];

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> songsCount;

  late EmojiOperations emojiOperations;
  @override
  void initState() {
    emojiOperations = EmojiOperations();

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
              child: FutureBuilder<int>(
            future: songsCount,
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return listViewItem(index, snapshot.data);
                  },
                );
              }
            },
          ))
        ],
      ),
    );
  }

  Widget listViewItem(int index, int songsCount) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Hero(
        tag: "emoji${index + 1}",
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
              onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) => SongPage(
                      heroTag: "emoji${index + 1}",
                    ),
                  )),
              child: emojiOperations.getNextImg(
                "songs",
                index + 1,
              )),
        ),
      ),
    );
  }
}