import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeItemCubit extends Cubit<int>{
  ChangeItemCubit():super(0);

  void changeItem(int index)=>emit(index);
}