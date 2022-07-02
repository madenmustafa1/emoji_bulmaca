import '/model/dio-model/emoji_request_model.dart';
import '/widgets/image/get_emoji_photo.dart';
import '/pages/song_page/song_page_vm.dart';
import '/model/add_emoji_model.dart';
import 'package:flutter/material.dart';
import '/dependency_injection/setup.dart';
import '/model/dio-model/emoji_response_model.dart';
import '/utils/constants.dart';

class EmojiOperationsViewModel {
  final Constants _constants = getIt<Constants>();
  final GetEmojiPhotoWidget getEmojiPhotoWidget = getIt<GetEmojiPhotoWidget>();
  final SongPageViewModel songPageViewModel = getIt<SongPageViewModel>();

  Widget newFutureBuilderText(int songsCount) {
    return Text(
      songsCount.toString(),
      style: _constants.returnTextStyle(_constants.MAIN_TITLE_NO_2),
    );
  }

  Future<EmojiResponseModel> getFirebaseEmojiInfo(
      String collection, int id) async {
    return await songPageViewModel
        .getEmoji(EmojiRequestModel(id, int.parse(collection)));
  }

  //Photo Url -> collection..document..url / req. -> getFirebaseEmojiInfo
  Widget getEmojiPhoto(String collection, int index, MediaQueryData queryData) {
    return getEmojiPhotoWidget.getEmojiPhoto(
      collection: collection,
      index: index,
      queryData: queryData,
    );
  }

  void addEmoji(AddEmojiModel addEmojiModel) {
    songPageViewModel.addEmojiUserRequest(addEmojiModel);
  }
}
