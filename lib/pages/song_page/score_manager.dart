import 'package:emoji_bulmaca/model/score_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScoreManager extends StateNotifier<ScoreModel> {
  ScoreManager() : super(ScoreModel(0));

  void increaseTheScore({int scoreI = 1}) {
    int score = state.score;
    state = ScoreModel(score + scoreI);
  }
}
