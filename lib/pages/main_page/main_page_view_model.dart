import '/model/dio-model/emoji_list_model_dio.dart';
import '/dependency_injection/setup.dart';
import '/model/dio-model/login_request_model.dart';
import '/model/dio-model/login_response.dart';
import '/repo/repository-dio.dart';

class MainPageViewModel {
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

  Future<List<EmojiCategoryModelDio>?> getEmojiCategoryList() async {
    try {
      _token ??= await getToken();

      return await repositoryDio.getEmojiCategoryList(_token!.token);
    } catch (e) {
      return null;
    }
  }
}
