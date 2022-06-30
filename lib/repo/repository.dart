import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '/dependency_injection/setup.dart';
import '/model/add_emoji_model.dart';
import '/model/dio-model/emoji_request_model.dart';
import '/model/dio-model/emoji_response_model.dart';
import '/pages/song_page/song_page_vm.dart';
import 'dart:convert';
import 'dart:typed_data';

class Repository {
  Uint8List? _bytesImage;
  final SongPageViewModel songPageViewModel = getIt<SongPageViewModel>();

  Future<EmojiResponseModel> getFirebaseEmojiInfo({
    required String collection,
    required int index,
  }) async {
    EmojiResponseModel? result = await songPageViewModel
        .getEmoji(EmojiRequestModel(index, int.parse(collection)));

    if (result == null) {
      return const EmojiResponseModel(1, "", "", 1, "", 1, "");
    }
    return result;
  }

  Widget getEmojiPhoto({
    required String collection,
    required int index,
    required MediaQueryData queryData,
  }) {
    try {
      return FutureBuilder(
          future: songPageViewModel
              .getEmoji(EmojiRequestModel(index, int.parse(collection))),
          builder: (context, AsyncSnapshot<EmojiResponseModel?> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.data != null) {
                var data = snapshot.data!;
                _bytesImage = const Base64Decoder().convert(data.image);
                return Container(
                  height: queryData.size.height / 2.5,
                  margin: const EdgeInsets.all(10),
                  child: Center(
                    //Current emoji photo & change
                    child: Image.memory(
                      _bytesImage!,
                      fit: BoxFit.cover,
                      gaplessPlayback: true,
                    ),
                  ),
                );
              } else {
                debugPrint("e.toString(");
                return const Center(child: CircularProgressIndicator());
              }
            }
          });
    } catch (e) {
      debugPrint("e.toString(");
      return Container();
    }
    //Collection -> int -> kategori
    //id -> int -> index
  }

  void addEmoji(AddEmojiModel addEmojiModel) async {
    CollectionReference addEmojiRef =
        FirebaseFirestore.instance.collection('add_emoji');
    Map<String, dynamic> map = addEmojiModel.toJson();
    addEmojiRef.add(map).then((value) {}).catchError((error) {});
  }
}
