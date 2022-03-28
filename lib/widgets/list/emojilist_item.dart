import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/emoji_list_model.dart';
import '../../pages/song_page/song_page.dart';
import '../../providers/song_page_provider.dart';

class EmojiListItem extends ConsumerWidget {
  String url;
  int totalCount;
  String emojiKey;

  EmojiListItem(
      {Key? key,
      required this.url,
      required this.totalCount,
      required this.emojiKey})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {
            ref.read(scoreNotifierProvider.notifier).resetScore();
            Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => SongPage(
                totalCount: totalCount,
                emojiKey: emojiKey,
              ),
            ));
          },
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

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<EmojiListModel>> getEmojiList() async {
    CollectionReference emojiList =
        FirebaseFirestore.instance.collection("emoji_list");
    EmojiListModel emojiModel = const EmojiListModel(0, "", "");
    List<EmojiListModel> emojiListModel = [];

    try {
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
          const EmojiListModel(0, "", "");
        }
      });

      return emojiListModel;
    } catch (e) {
      return emojiListModel;
    }
  }
}
