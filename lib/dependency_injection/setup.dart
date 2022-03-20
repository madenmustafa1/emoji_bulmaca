import 'package:emoji_bulmaca/utils/constants.dart';
import 'package:emoji_bulmaca/utils/play_sound.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<Constants>(() => Constants());
  getIt.registerLazySingleton<PlaySound>(() => PlaySound());
}
