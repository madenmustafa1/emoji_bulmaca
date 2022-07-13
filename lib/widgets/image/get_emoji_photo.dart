import 'package:flutter/material.dart';
import '/dependency_injection/setup.dart';
import '/model/dio-model/emoji_request_model.dart';
import '/model/dio-model/emoji_response_model.dart';
import '/pages/song_page/song_page_vm.dart';
import 'dart:convert';
import 'dart:typed_data';

class GetEmojiPhotoWidget {
  Uint8List? _bytesImage;
  final SongPageViewModel songPageViewModel = getIt<SongPageViewModel>();

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
                return const Center(child: CircularProgressIndicator());
              }
            }
          });
    } catch (e) {
      return Container();
    }
    //Collection -> int -> kategori
    //id -> int -> index
  }
}
