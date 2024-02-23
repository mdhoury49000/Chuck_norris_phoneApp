import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PhrasesCubit extends Cubit<List<String>> {
  PhrasesCubit() : super([]);

  void loadPhrases() async {
    final prefs = await SharedPreferences.getInstance();
    final savedPhrases = prefs.getStringList('savedPhrases') ?? [];
    emit(savedPhrases);
  }

  void savePhrase(String phrase) async {
    final prefs = await SharedPreferences.getInstance();
    final currentPhrases = List<String>.from(state);
    if (!currentPhrases.contains(phrase)) {
      currentPhrases.add(phrase);
      await prefs.setStringList('savedPhrases', currentPhrases);
      emit(currentPhrases);
    }
  }
}
