import 'package:english/cubit/word_cubit/word_state.dart';
import 'package:english/data/model/forms_status.dart';
import 'package:english/data/model/network_response.dart';
import 'package:english/data/repository/word/word_repository.dart';
import 'package:english/services/services_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WordCubit extends Cubit<WordState> {
  WordCubit() : super(WordState.initialValue());

  Future<void> fetchWord() async {
    emit(
      state.copyWith(
        status: FormsStatus.loading,
      ),
    );
    NetworkResponse response = await getIt<WordRepository>().fetchWords();
    if (response.errorMessage.isEmpty) {
      emit(
        state.copyWith(status: FormsStatus.success, listWord: response.data),
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
}
