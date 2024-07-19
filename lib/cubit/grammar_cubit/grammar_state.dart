import 'package:english/data/model/forms_status.dart';

import '../../data/model/grammar/grammar_model.dart';

class GrammarState {
  final String errorMessage;
  final List<GrammarModel> grammarData;
  final FormsStatus status;

  GrammarState({
    required this.errorMessage,
    required this.grammarData,
    required this.status,
  });

  GrammarState copyWith({
    String? errorMessage,
    List<GrammarModel>? grammarData,
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
