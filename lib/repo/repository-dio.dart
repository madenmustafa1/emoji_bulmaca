
import 'package:emoji_bulmaca/model/dio-model/emoji_request_model.dart';

import '../dependency_injection/setup.dart';
import '../repo/service/dio_service.dart';
import '../model/dio-model/emoji_list_model_dio.dart';
import '../model/dio-model/login_response.dart';
import '../model/dio-model/login_request_model.dart';
import 'service/dio_interface.dart';

class RepositoryDio extends DioInterface {

  final DioService dioService = getIt<DioService>();

  @override
  Future<List<EmojiCategoryModelDio>> getEmojiCategoryList() async {
    try {
      List<EmojiCategoryModelDio>? result =
          await dioService.getEmojiCategoryList();

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
  Future<EmojiCategoryModelDio?> getEmoji(EmojiRequestModel emojiRequestModel) {
    // TODO: implement getEmoji
    throw UnimplementedError();
  }
}
