import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../song_page/song_page.dart';

class EmojiList {
  BuildContext context;
  EmojiList(this.context);
  
  //FirebaseFirestore firestore = FirebaseFirestore.instance;

  Widget listViewItem(
      String url, MediaQueryData queryData, int totalCount, String emojiKey) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () => Navigator.of(context).push(CupertinoPageRoute(
            builder: (context) => SongPage(
              totalCount: totalCount,
              emojiKey: emojiKey,
            ),
          )),
          child: Container(
            height: queryData.size.height / 2.5,
            margin: const EdgeInsets.all(10),
            child: Center(
              //Current emoji photo & change
              child: Image.network(
                url,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
