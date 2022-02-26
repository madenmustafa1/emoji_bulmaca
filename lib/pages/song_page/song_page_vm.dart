import 'package:emoji_bulmaca/model/score_model.dart';
import 'package:emoji_bulmaca/pages/song_page/score_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateNotifierProvider<ScoreManager, ScoreModel> scoreNotifierProvider =
    StateNotifierProvider<ScoreManager, ScoreModel>((ref) {
  return ScoreManager();
});

class SongPageViewModel {}
