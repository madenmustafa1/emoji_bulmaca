import 'package:dio/dio.dart';

import '../pages/main_page/main_page_view_model.dart';
import '../repo/repository-dio.dart';
import '../repo/service/dio_service.dart';
import '../utils/admob/ad_mob_constants.dart';
import '../repo/repository.dart';
import '../view_model/emoji_operations_vm.dart';
import '../utils/constants.dart';
import '../utils/play_sound.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<AdMobConstants>(() => AdMobConstants());
  getIt.registerLazySingleton<Constants>(() => Constants());
  getIt.registerLazySingleton<PlaySound>(() => PlaySound());
  getIt.registerLazySingleton<EmojiOperationsViewModel>(
      () => EmojiOperationsViewModel());
  getIt.registerLazySingleton<Repository>(() => Repository());


  getIt.registerLazySingleton<RepositoryDio>(() => RepositoryDio());
  getIt.registerLazySingleton<DioService>(() => DioService());
  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt.registerFactory<MainPageViewModel>(() => MainPageViewModel());
}
