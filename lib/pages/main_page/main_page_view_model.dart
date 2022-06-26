
import 'package:flutter/material.dart';
import '../../dependency_injection/setup.dart';
import '../../model/dio-model/login_request_model.dart';
import '../../model/dio-model/login_response.dart';
import '../../repo/repository-dio.dart';

class MainPageViewModel {

    final RepositoryDio repositoryDio = getIt<RepositoryDio>();

    void getEmojiCategoryList() async {
    var result = await repositoryDio.getEmojiCategoryList();
  }

  Future<LoginResponseModel?> getToken() async {
    RepositoryDio repositoryDio = RepositoryDio();
    LoginRequestModel loginRequestModel = LoginRequestModel(
        username: "madenapps",
        password: "madenapps_login*demo",
        key: "login_key");
    var resul = await repositoryDio.login(loginRequestModel);
    debugPrint(resul!.token);

    return null;
  }
}
