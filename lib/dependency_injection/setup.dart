import 'package:emoji_bulmaca/repo/repository.dart';
import 'package:emoji_bulmaca/view_model/emoji_operations_vm.dart';

import '../utils/constants.dart';
import '../utils/play_sound.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<Constants>(() => Constants());
  getIt.registerLazySingleton<PlaySound>(() => PlaySound());
  getIt.registerLazySingleton<EmojiOperationsViewModel>(() => EmojiOperationsViewModel());
  getIt.registerLazySingleton<Repository>(() => Repository());
}
