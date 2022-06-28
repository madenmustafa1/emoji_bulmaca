import 'package:flutter/material.dart';
import '/model/dio-model/emoji_list_model_dio.dart';
import '/model/dio-model/emoji_response_model.dart';
import '/dependency_injection/setup.dart';
import '/model/dio-model/login_request_model.dart';
import '/model/dio-model/login_response.dart';
import '/repo/repository-dio.dart';
import '/model/dio-model/emoji_request_model.dart';

class MainPageViewModel {
  final RepositoryDio repositoryDio = getIt<RepositoryDio>();

  Future<LoginResponseModel?> getToken() async {
    RepositoryDio repositoryDio = RepositoryDio();
    LoginRequestModel loginRequestModel = LoginRequestModel(
        username: "madenapps",
        password: "madenapps_login*demo",
        key: "login_key");
    LoginResponseModel? result = await repositoryDio.login(loginRequestModel);
    debugPrint(result!.token);

    return result;
  }

  Future<List<EmojiCategoryModelDio>?> getEmojiCategoryList() async {
    var token = await getToken();
    List<EmojiCategoryModelDio>? emojiCategoryModel;
    if (token != null) {
      emojiCategoryModel = await repositoryDio.getEmojiCategoryList(token.token);
    }
    return emojiCategoryModel;
  }

  Future<EmojiResponseModel?> getEmoji(
      EmojiRequestModel emojiRequestModel) async {
    EmojiResponseModel? model;
    var token = await getToken();
    if (token != null) {
      model = await repositoryDio.getEmoji(token.token, emojiRequestModel);
    }

    return model;
  }
}
