import 'package:emoji_bulmaca/utils/constants.dart';
import 'package:emoji_bulmaca/utils/emoji_operations.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SongPage extends StatefulWidget {
  final String heroTag;
  //

  const SongPage({Key? key, this.heroTag = ""}) : super(key: key);

  @override
  _SongPageState createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  //TextEditingController _controller = new TextEditingController();

  int imageCount = 1;
  late Future<int> songsCount;

  late Constants constants;
  late EmojiOperations emojiOperations;

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

    super.initState();
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
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 32,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: emojiOperations.newFutureBuilderText(
                    songsCount,
                  )

                  /* Text(
                    "Skor: ${(imageCount - 1).toString()}",
                    style: constants.returnTextStyle(constants.MAIN_TITLE_NO_3),
                  )
                  */
                  ,
                )
              ],
            ),
            Hero(
              tag: widget.heroTag, //"emoji1",
              child: Container(
                height: queryData.size.height / 2.5,
                //color: Colors.amber[300],
                margin: const EdgeInsets.all(10),
                child: Center(
                  //Current emoji photo & change
                  child: emojiOperations.futureGetNextImg(
                    "songs",
                    songsCount,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
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
            ),
          ],
        ),
      ),
    );
  }

  void inputControl() async {
    int count = await songsCount;
    int imageCount2 = await songsCount;
    if (emojiTextController.text == "ask kokusu") {
      setState(() {
        emojiTextController.text = "";
        imageCount = imageCount2 + 1;

        _incrementImageCount(count + 1);
      });
    }
  }
}
