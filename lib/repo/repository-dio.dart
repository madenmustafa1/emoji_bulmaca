// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import '../model/dio-model/emoji_list_model_dio.dart';
import '../model/dio-model/login_response.dart';
import '../model/dio-model/login_request_model.dart';
import 'package:flutter/material.dart';
import 'dio_interface.dart';

class RepositoryDio extends DioInterface {
  final SUCCESS = 200;

  @override
  Future<List<EmojiCategoryModelDio>> getEmojiCategoryList() async {
    try {
      Response<dynamic> response =
          await Dio().get('http://192.168.1.21:7070/category',
              options: Options(headers: {
                "Authorization":
                    "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhdXRoMCIsInV1aWQiOiJkMGE1ZDU0MS00NzM3LTRlYzQtOTBkZC04NTk5YjU1ZjM2MGQiLCJlbWFpbCI6Im5hbWUxMjM1NTIzMjMifQ.HWFWxrYeFGMNVj7M8aCCOu6gv0IiNl9ulUEbsQbiFeA"
              }));

      if (response.statusCode != SUCCESS) {
        debugPrint(response.data.toString());
        return [];
      }

      List<EmojiCategoryModelDio> emojiCategoryList = await response.data
          .map<EmojiCategoryModelDio>((e) => EmojiCategoryModelDio.fromMap(e))
          .toList();

      return emojiCategoryList;
    } catch (e) {
      debugPrint("EXCEPTION: " + e.toString());

      return [];
    }
  }

  @override
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
