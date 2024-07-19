import 'package:english/bloc/user_bloc/user_bloc.dart';
import 'package:english/cubit/grammar_cubit/grammar_cubit.dart';
import 'package:english/data/model/user/user_model.dart';
import 'package:english/screen/tab_box/grammar/widget/build_widgets/grammar_build_error.dart';
import 'package:english/screen/tab_box/grammar/widget/build_widgets/grammar_build_loading.dart';
import 'package:english/screen/tab_box/grammar/widget/build_widgets/grammar_build_succes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/grammar_cubit/grammar_state.dart';
import '../../../cubit/like_cubit/like_cubit.dart';
import '../../../data/model/forms_status.dart';

class GrammarScreen extends StatelessWidget {
  const GrammarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<GrammarCubit, GrammarState>(
        builder: (context, state) {
          if (state.status == FormsStatus.loading) {
            return grammarBuildLoading();
          } else if (state.status == FormsStatus.success) {
            return grammarBuildSuccess(state.grammarData);
          }
          return grammarBuildError(state.errorMessage);
        },
        listenWhen: (oldState, currentState) => currentState.status == FormsStatus.success,
        listener: (BuildContext context, GrammarState state) {
          UserModel userModel = context.read<UserBloc>().state.userData;

          // InsertLike'ga chaqirishdan oldin userModel'ni chop etish
          debugPrint('UserModel before insertLike: ${userModel.toUpdateJson()}');

          context.read<LikeCubit>().insertLike(index: userModel.likes.length, userModel: userModel);
        },
      ),
    );
  }
}

