import 'package:english/data/model/basic_grammar/basic_grammar_model.dart';
import 'package:english/data/model/forms_status.dart';

class GrammarState {
  final String errorMessage;
  final List<BasicGrammarModel> grammarData;
  final FormsStatus status;

  GrammarState({
    required this.errorMessage,
    required this.grammarData,
    required this.status,
  });

  GrammarState copyWith({
    String? errorMessage,
    List<BasicGrammarModel>? grammarData,
    FormsStatus? status,
  }) =>
      GrammarState(
        errorMessage: errorMessage ?? this.errorMessage,
        grammarData: grammarData ?? this.grammarData,
        status: status ?? this.status,
      );

  static GrammarState initialValue() => GrammarState(
        errorMessage: '',
        grammarData: [],
        status: FormsStatus.pure,
      );
}
