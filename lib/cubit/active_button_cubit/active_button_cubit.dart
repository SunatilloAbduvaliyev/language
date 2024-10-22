import 'package:english/cubit/active_button_cubit/active_button_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActiveButtonCubit extends Cubit<ActiveButtonState> {
  ActiveButtonCubit() : super(ActiveButtonState.initialValue());

  void initialState() => emit(ActiveButtonState.initialValue());

  void changeState({
    bool isActive = false,
    dynamic data,
  }) =>
      emit(
        state.copyWith(
          isActive: isActive,
          data: data,
        ),
      );
}
