import 'package:english/data/model/forms_status.dart';
import 'package:english/data/model/grammar/grammar_model.dart';
import 'package:english/data/model/network_response.dart';
import 'package:english/data/repository/grammar/grammar_repository.dart';
import 'package:english/services/services_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'grammar_state.dart';

class GrammarCubit extends Cubit<GrammarState> {
  GrammarCubit() : super(GrammarState.initialValue());

  Future<void> fetAllGrammar({bool isUpdate = true}) async {
    if (isUpdate) {
      emit(state.copyWith(status: FormsStatus.loading));
    }
    NetworkResponse response =
        await getIt<GrammarRepository>().fetchAllGrammar();
    if (response.errorMessage.isEmpty) {
      debugPrint(
          '____________________________________________ data ${(response.data as List<GrammarModel>).length.toString()}  ');
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

  Future<void> updateGrammar({
    required GrammarModel grammarModel,
  }) async {
    emit(state.copyWith(status: FormsStatus.updateLoading));
    NetworkResponse response = await getIt<GrammarRepository>().updateGrammar(
      grammarModel: grammarModel,
    );
    if (response.errorMessage.isEmpty) {
      fetAllGrammar(isUpdate: false);
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
