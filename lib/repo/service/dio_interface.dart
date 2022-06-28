import 'package:emoji_bulmaca/model/dio-model/emoji_response_model.dart';

import '../../model/dio-model/emoji_list_model_dio.dart';
import '../../model/dio-model/emoji_request_model.dart';
import '../../model/dio-model/login_request_model.dart';
import '../../model/dio-model/login_response.dart';

abstract class DioInterface {
  Future<LoginResponseModel?> login(LoginRequestModel loginRequestModel);
  Future<List<EmojiCategoryModelDio>?> getEmojiCategoryList(
    String auth,
  );
  Future<EmojiResponseModel?> getEmoji(
      String auth, EmojiRequestModel emojiRequestModel);
}
