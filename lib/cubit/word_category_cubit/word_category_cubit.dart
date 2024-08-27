import 'package:flutter_bloc/flutter_bloc.dart';

class WordCategoryCubit extends Cubit<int> {
  WordCategoryCubit() : super(0);

  void changeWord(int index) => emit(index);
}
