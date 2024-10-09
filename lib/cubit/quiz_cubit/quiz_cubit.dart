import 'package:english/cubit/quiz_cubit/quiz_state.dart';
import 'package:english/data/model/forms_status.dart';
import 'package:english/data/model/quiz/quiz_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizState.initialValue());

  void startQuiz({
    required List<QuizModel> gameQuiz,
  }) =>
      emit(
        state.copyWith(
          gameQuiz: gameQuiz,
        ),
      );

  void checkResult({
    required QuizModel quizModel,
    required String checkAnswer,
  }) {
    int errorCount = state.errorCount, index = state.quizIndex;
    List<QuizModel> userQuiz = state.userQuiz;
    if (quizModel.trueAnswer == checkAnswer) {
      quizModel.copyWith(
        checkVariant: checkAnswer,
      );
    } else {
      errorCount++;
    }
    userQuiz.add(quizModel);
    index++;
    emit(
      state.copyWith(
        errorCount: errorCount,
        quizIndex: index,
        userQuiz: userQuiz,
        status:
            index == state.gameQuiz.length ? FormsStatus.success : FormsStatus.pure,
      ),
    );
  }

  void initialState()=>emit(QuizState.initialValue());
}
