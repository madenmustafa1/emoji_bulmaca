import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emoji_bulmaca/model/emoji_model.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class EmojiOperations {
  Constants constants = Constants();

  Image getNextImg(String path, int index) {
    return Image.asset(
      'assets/img/$path/${index.toString()}.png',
      fit: BoxFit.cover,
    );
  }

  Widget futureGetNextImg(String path, Future<int> songsCount) {
    return FutureBuilder<int>(
      future: songsCount,
      builder: (context, AsyncSnapshot<int> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.data != null) {
            return getNextImg(path, snapshot.data!);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
      },
    );
  }

  Widget newFutureBuilderText(Future<int> songsCount) {
    return FutureBuilder<int>(
      future: songsCount,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else {
          //
          return Text(
            snapshot.data.toString(),
            style: constants.returnTextStyle(constants.MAIN_TITLE_NO_2),
          );
        }
      },
    );
  }

  //Firebase
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<EmojiModel> getFirebaseEmojiInfo(String collection, Future<int> id) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection(collection);
    EmojiModel emojiModel;
    int idInt = await id;

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
          debugPrint("Emoji model:  " + emojiModel.url);
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

  Widget getEmojiPhoto(String collection, Future<int> id, MediaQueryData queryData) {
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