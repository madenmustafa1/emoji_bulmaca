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

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<EmojiModel> getFirebaseEmoji(String collection, String id) async {
    CollectionReference users = FirebaseFirestore.instance.collection(collection);
    EmojiModel emojiModel;

    try {
      var user = await users
          .where("id", isEqualTo: id)
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

  void test() async {
    CollectionReference users = FirebaseFirestore.instance.collection('emojis');
    var user = await users
        .where("id", isEqualTo: "1")
        //.doc("BuGeW9CcVT8Rv5G9bLYR")
        .get()
        .then((QuerySnapshot<Object?> documentSnapshot) {
      if (documentSnapshot.docs.isNotEmpty) {
        List<Object?> data = documentSnapshot.docs.map((DocumentSnapshot e) {
          return e.data();
        }).toList();

        /*
            documentSnapshot.docs as List<Map<String, dynamic>>;
            */
        Map<String, dynamic> value = data[0] as Map<String, dynamic>;

        debugPrint("Test data:  " + value["url"]);
      } else {
        debugPrint("Not exists");
      }
    });

    /*
    var user = await users
        //.where("id", isEqualTo: "1")
        .doc("BuGeW9CcVT8Rv5G9bLYR")
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        debugPrint("Test data:  " + data["test"]);
      } else {
        debugPrint("Not exists");
      }
    });
    */
  }
}
