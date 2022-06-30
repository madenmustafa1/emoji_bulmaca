import '/model/score_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScoreManager extends StateNotifier<ScoreModel> {
  ScoreManager() : super(ScoreModel(1));

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void getScoreCount(String key) async {
    ScoreModel scoreModel = await _prefs.then((SharedPreferences prefs) {
      return ScoreModel(prefs.getInt(key) ?? 1);
    });
    if (scoreModel.score != state.score) {
      state = scoreModel;
    }
  }

  void increaseTheScore({int scoreI = 1, required String key}) {
    int score = state.score;
    state = ScoreModel(score + scoreI);
    _prefs.then((value) => value.setInt(key, state.score));
  }

  void resetScore() => state = ScoreModel(1);
}
