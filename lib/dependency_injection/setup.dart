import 'package:emoji_bulmaca/utils/admob/ad_mob_constants.dart';

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
}
