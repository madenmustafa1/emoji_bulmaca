import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emoji_bulmaca/model/emoji_model.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class EmojiOperations {
  Constants constants = Constants();

  Widget newFutureBuilderText(int songsCount) {
    return Text(
      songsCount.toString(),
      style: constants.returnTextStyle(constants.MAIN_TITLE_NO_2),
    );
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<EmojiModel> getFirebaseEmojiInfo(String collection, int id) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection(collection);
    EmojiModel emojiModel;
    int idInt = id;

    try {
      var user = await users
          .where("id", isEqualTo: idInt.toString())
          .get()
          .then((QuerySnapshot<Object?> documentSnapshot) {
        if (documentSnapshot.docs.isNotEmpty) {
          List<Object?> data = documentSnapshot.docs.map((DocumentSnapshot e) {
            return e.data();
          }).toList();
          Map<String, dynamic> value = data[0] as Map<String, dynamic>;

          emojiModel = EmojiModel.fromMap(value);

          return emojiModel;
        } else {
          return const EmojiModel("", "", "");
        }
      });
      return user;
    } catch (e) {
      return const EmojiModel("", "", "");
    }
  }

  Widget getEmojiPhoto(String collection, int id, MediaQueryData queryData) {
    return FutureBuilder(
        future: getFirebaseEmojiInfo(collection, id),
        builder: (context, AsyncSnapshot<EmojiModel> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.data != null) {
              return Container(
                height: queryData.size.height / 2.5,
                margin: const EdgeInsets.all(10),
                child: Center(
                  //Current emoji photo & change
                  child: Image.network(
                    snapshot.data!.url,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }
        });
  }
}
