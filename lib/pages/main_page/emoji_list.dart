import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emoji_bulmaca/model/emoji_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../song_page.dart';

class EmojiList {
  BuildContext context;
  EmojiList(this.context);

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Widget listViewItem(String url, MediaQueryData queryData, int totalCount) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () => Navigator.of(context).push(CupertinoPageRoute(
            builder: (context) => SongPage(totalCount: totalCount),
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

  Future<List<EmojiListModel>> getEmojiList() async {
    CollectionReference emojiList =
        FirebaseFirestore.instance.collection("emoji_list");
    EmojiListModel emojiModel = const EmojiListModel(0, "", "");

    List<EmojiListModel> emojiListModel = [];

    try {
      EmojiListModel emojiInfo =
          await emojiList.get().then((QuerySnapshot<Object?> documentSnapshot) {
        if (documentSnapshot.docs.isNotEmpty) {
          List<Object?> data = documentSnapshot.docs.map((DocumentSnapshot e) {
            return e.data();
          }).toList();

          for (int i = 0; i < data.length; i++) {
            Map<String, dynamic> value = data[i] as Map<String, dynamic>;

            emojiModel = EmojiListModel.fromMap(value);
            emojiListModel.add(emojiModel);
          }

          return emojiModel;
        } else {
          return const EmojiListModel(0, "", "");
        }
      });

      return emojiListModel;
    } catch (e) {
      return emojiListModel;
    }
  }
}
