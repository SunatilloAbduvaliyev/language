import 'package:english/data/model/forms_status.dart';
import 'package:english/data/model/word/word_model.dart';

class WordState {
  final String errorMessage;
  final List<WordModel> listWord;
  final FormsStatus status;

  WordState({
    required this.errorMessage,
    required this.listWord,
    required this.status,
  });

  WordState copyWith({
    String? errorMessage,
    FormsStatus? status,
    List<WordModel>? listWord,
  }) =>
      WordState(
        errorMessage: errorMessage ?? this.errorMessage,
        listWord: listWord ?? this.listWord,
        status: status ?? this.status,
      );

  static WordState initialValue() => WordState(
        errorMessage: '',
        listWord: [],
        status: FormsStatus.pure,
      );
}
