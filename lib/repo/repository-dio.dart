// ignore_for_file: file_names
import 'package:emoji_bulmaca/model/add_emoji_model.dart';
import '/model/dio-model/emoji_response_model.dart';
import '/model/dio-model/emoji_request_model.dart';
import '/dependency_injection/setup.dart';
import '/repo/service/dio_service.dart';
import '/model/dio-model/emoji_list_model_dio.dart';
import '/model/dio-model/login_response.dart';
import '/model/dio-model/login_request_model.dart';
import 'service/dio_interface.dart';

class RepositoryDio extends DioInterface {

  final DioService dioService = getIt<DioService>();

  @override
  Future<List<EmojiCategoryModelDio>> getEmojiCategoryList(String auth) async {
    try {
      List<EmojiCategoryModelDio>? result =
          await dioService.getEmojiCategoryList(auth);

      if (result == null) {
        return [];
      }

      return result;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<LoginResponseModel?> login(LoginRequestModel loginRequestModel)  async{
    return await dioService.login(loginRequestModel);
  }

  @override
  Future<EmojiResponseModel?> getEmoji(String auth, EmojiRequestModel emojiRequestModel) async {
    return await dioService.getEmoji(auth, emojiRequestModel);
  }

  @override
  Future<bool> addEmojiUserRequest(String auth,AddEmojiModel addEmojiModel) async {
    return await dioService.addEmojiUserRequest(auth, addEmojiModel);
  }
}
