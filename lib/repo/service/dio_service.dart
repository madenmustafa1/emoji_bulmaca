// ignore_for_file: non_constant_identifier_names
import 'package:dio/dio.dart';
import '/model/add_emoji_model.dart';
import '/model/dio-model/emoji_request_model.dart';
import '/model/dio-model/emoji_response_model.dart';
import '/model/dio-model/login_response.dart';
import '/model/dio-model/login_request_model.dart';
import '/model/dio-model/emoji_list_model_dio.dart';
import '/repo/service/dio_interface.dart';
import '/dependency_injection/setup.dart';

class DioService implements DioInterface {
  final SUCCESS = 200;

  //final BASE_URL = "http://192.168.1.21:7070/";
  final BASE_URL = "https://emojibulmaca.com/";

  final Dio dio = getIt<Dio>();

  @override
  Future<List<EmojiCategoryModelDio>?> getEmojiCategoryList(String auth) async {
    List<EmojiCategoryModelDio>? emojiCategoryList;

    Response<dynamic> response = await dio.get(BASE_URL + 'category',
        options: Options(headers: {"Authorization": auth}));

    if (response.statusCode != SUCCESS) {
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
      return null;
    }

    return LoginResponseModel.fromMap(response.data);
  }

  @override
  Future<EmojiResponseModel?> getEmoji(
      String auth, EmojiRequestModel emojiRequestModel) async {
    Response<dynamic> response = await dio.post(BASE_URL + 'get-song',
        options: Options(headers: {"Authorization": auth}),
        data: emojiRequestModel.asMap());

    if (response.statusCode != SUCCESS) {
      return null;
    }

    return EmojiResponseModel.fromMap(response.data);
  }

  @override
  Future<bool> addEmojiUserRequest(
      String auth, AddEmojiModel addEmojiModel) async {
    Response<dynamic> response = await dio.post(BASE_URL + 'add-emoji',
        options: Options(headers: {
          "Authorization": auth,
        }),
        data: addEmojiModel.asMap());

    if (response.statusCode != SUCCESS) {
      return Future.value(false);
    }
    var isSuccess = response.data as bool;

    return isSuccess;
  }
}
