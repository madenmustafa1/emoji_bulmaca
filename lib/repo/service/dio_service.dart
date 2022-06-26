// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:emoji_bulmaca/model/dio-model/emoji_request_model.dart';
import '/../model/dio-model/login_response.dart';
import '/../model/dio-model/login_request_model.dart';
import '/../model/dio-model/emoji_list_model_dio.dart';
import '/../repo/service/dio_interface.dart';
import '../../dependency_injection/setup.dart';
import 'package:flutter/material.dart';

class DioService implements DioInterface {
  final SUCCESS = 200;

  final BASE_URL = "http://192.168.1.21:7070/";

  final Dio dio = getIt<Dio>();

  @override
  Future<List<EmojiCategoryModelDio>?> getEmojiCategoryList() async {
    List<EmojiCategoryModelDio>? emojiCategoryList;

    Response<dynamic> response = await dio.get(BASE_URL + 'category',
        options: Options(headers: {
          "Authorization":
              "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhdXRoMCIsInV1aWQiOiJkMGE1ZDU0MS00NzM3LTRlYzQtOTBkZC04NTk5YjU1ZjM2MGQiLCJlbWFpbCI6Im5hbWUxMjM1NTIzMjMifQ.HWFWxrYeFGMNVj7M8aCCOu6gv0IiNl9ulUEbsQbiFeA"
        }));

    if (response.statusCode != SUCCESS) {
      debugPrint(response.data.toString());
      return null;
    }

    emojiCategoryList = await response.data
        .map<EmojiCategoryModelDio>((e) => EmojiCategoryModelDio.fromMap(e))
        .toList();
    return emojiCategoryList;
  }

  @override
  Future<LoginResponseModel?> login(LoginRequestModel loginRequestModel) async {
    Response<dynamic> response =
        await dio.post(BASE_URL + 'sign-in', data: loginRequestModel.asMap());

    if (response.statusCode != SUCCESS) {
      debugPrint(response.data.toString());
      return null;
    }

    return LoginResponseModel.fromMap(response.data);
  }

  @override
  Future<EmojiCategoryModelDio?> getEmoji(EmojiRequestModel emojiRequestModel) {
    //final request = Request('GET', 'http://example.com/api/v1');
    // TODO: implement getEmoji
    throw UnimplementedError();
  }
}
