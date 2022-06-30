import 'package:emoji_bulmaca/model/add_emoji_model.dart';
import 'package:emoji_bulmaca/repo/repository.dart';
import 'package:flutter/material.dart';
import '../dependency_injection/setup.dart';
import '../model/dio-model/emoji_response_model.dart';
import '../utils/constants.dart';

class EmojiOperationsViewModel {
  final Constants _constants = getIt<Constants>();
  final Repository _repository = getIt<Repository>();

  Widget newFutureBuilderText(int songsCount) {
    return Text(
      songsCount.toString(),
      style: _constants.returnTextStyle(_constants.MAIN_TITLE_NO_2),
    );
  }

  Future<EmojiResponseModel> getFirebaseEmojiInfo(String collection, int id) async {
    return _repository.getFirebaseEmojiInfo(collection: collection, index: id);
  }

  //Photo Url -> collection..document..url / req. -> getFirebaseEmojiInfo
  Widget getEmojiPhoto(String collection, int index, MediaQueryData queryData) {
    return _repository.getEmojiPhoto(
      collection: collection,
      index: index,
      queryData: queryData,
    );
  }

  void addEmoji(AddEmojiModel addEmojiModel) {
    _repository.addEmoji(addEmojiModel);
  }
}
