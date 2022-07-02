import '/model/add_emoji_model.dart';
import '/model/dio-model/emoji_request_model.dart';
import '/model/dio-model/emoji_response_model.dart';
import '/model/dio-model/login_request_model.dart';
import '/model/dio-model/login_response.dart';
import '/repo/repository-dio.dart';
import '/dependency_injection/setup.dart';

class SongPageViewModel {
  final RepositoryDio repositoryDio = getIt<RepositoryDio>();
  LoginResponseModel? _token;

  Future<LoginResponseModel?> getToken() async {
    RepositoryDio repositoryDio = RepositoryDio();
    LoginRequestModel loginRequestModel = LoginRequestModel(
        username: "madenapps",
        password: "madenapps_login*demo",
        key: "login_key");
    LoginResponseModel? result = await repositoryDio.login(loginRequestModel);
    _token = result;
    return result;
  }

  //mainPageViewModel.getEmoji(const EmojiRequestModel(1, 2));
  Future<EmojiResponseModel> getEmoji(
      EmojiRequestModel emojiRequestModel) async {
    EmojiResponseModel? model;
    try {
      _token = await getToken();
      if (_token != null) {
        model = await repositoryDio.getEmoji(_token!.token, emojiRequestModel);
      }
    } catch (e) {
      model = null;
    }

    if (model == null) {
      return const EmojiResponseModel(1, "", "", 1, "", 1, "");
    }

    return model;
  }

  void addEmojiUserRequest(AddEmojiModel addEmojiModel) async {
    try {
      String? token;
      if (_token != null) {
        token = _token!.token;
      } else {
        _token = await getToken();
        token = _token?.token;
      }

      if (token == null) return;

      repositoryDio.addEmojiUserRequest(token, addEmojiModel);
    } catch (e) {
      return;
    }
  }
}
