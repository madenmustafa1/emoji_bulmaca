import 'package:emoji_bulmaca/model/emoji_model.dart';
import 'package:emoji_bulmaca/utils/constants.dart';
import 'package:emoji_bulmaca/widgets/emoji_operations.dart';
import 'package:emoji_bulmaca/widgets/constants_widgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SongPage extends StatefulWidget {
  final String heroTag;
  const SongPage({Key? key, this.heroTag = ""}) : super(key: key);

  @override
  _SongPageState createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  //TextEditingController _controller = new TextEditingController();

  int imageCount = 1;
  late Future<int> songsCount;
  late Future<EmojiModel> emojiModel;

  late Constants constants;
  late EmojiOperations emojiOperations;
  late ConstantsWidgets constantsWidgets;

  late TextEditingController emojiTextController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> _incrementImageCount(int imageCount2) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt('songs', imageCount2).then((bool success) {});
  }

  @override
  void initState() {
    constants = Constants();
    emojiOperations = EmojiOperations();
    constantsWidgets = ConstantsWidgets();

    emojiModel = getFirebaseEmojiInfo();
    super.initState();
  }

  Future<EmojiModel> getFirebaseEmojiInfo() async {
    songsCount = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('songs') ?? 1;
    });
    return await emojiOperations.getFirebaseEmojiInfo("songs", songsCount);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    songsCount = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('songs') ?? 1;
    });

    final double bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: false, // set it to false
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            //Scor
            Row(
              children: [
                constantsWidgets.getSizedBox(context, 32),
                //Scor icon
                constantsWidgets.getIcon(Icons.star),
                //Scor count
                Align(
                  alignment: Alignment.centerLeft,
                  child: emojiOperations.newFutureBuilderText(
                    songsCount,
                  ),
                )
              ],
            ),

            //Emoji Image
            Container(
              height: queryData.size.height / 2.5,
              child: Hero(
                tag: widget.heroTag,
                child: emojiOperations.getEmojiPhoto(
                    "songs", songsCount, queryData),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            inputDecoration(context, bottomPadding),
          ],
        ),
      ),
    );
  }

  Padding inputDecoration(BuildContext context, double bottomPadding) {
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
          Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: Padding(
              padding: EdgeInsets.only(bottom: bottomPadding),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 12,
                child: SizedBox(
                  height: double.infinity,
                  child: ElevatedButton(
                    //Input control->
                    onPressed: () {
                      inputControl();
                    },
                    child: const Icon(Icons.send),
                    style: ElevatedButton.styleFrom(
                        primary: constants.BUTTON_COLOR),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  
  void inputControl() async {
    EmojiModel forEmojiName = await getFirebaseEmojiInfo();

    int count = await songsCount;
    int imageCount2 = await songsCount;

    if (emojiTextController.text == forEmojiName.name) {
      setState(() {
        emojiTextController.text = "";
        imageCount = imageCount2 + 1;
        emojiModel = getFirebaseEmojiInfo();
        _incrementImageCount(count + 1);
      });
    }
  }
}










/*
  Container getNextImg(MediaQueryData queryData) {
    return Container(
      height: queryData.size.height / 2.5,
      margin: const EdgeInsets.all(10),
      child: Center(
        //Current emoji photo & change
        child: emojiOperations.futureGetNextImg(
          "songs",
          songsCount,
        ),
      ),
    );
  }

  */