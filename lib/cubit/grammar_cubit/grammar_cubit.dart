import 'package:english/data/model/forms_status.dart';
import 'package:english/data/model/network_response.dart';
import 'package:english/data/repository/grammar/grammar_repository.dart';
import 'package:english/services/services_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'grammar_state.dart';

class GrammarCubit extends Cubit<GrammarState> {
  GrammarCubit() : super(GrammarState.initialValue());

  Future<void> fetAllGrammar() async {
    emit(state.copyWith(status: FormsStatus.loading));
    NetworkResponse response =
        await getIt<GrammarRepository>().fetchAllGrammar();
    if (response.errorMessage.isEmpty) {
      debugPrint('data keldi');
      emit(
        state.copyWith(
          status: FormsStatus.success,
          grammarData: response.data,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: FormsStatus.error,
          errorMessage: response.errorMessage,
        ),
      );
    }
  }

  void initialState()=>emit(GrammarState.initialValue());
}
