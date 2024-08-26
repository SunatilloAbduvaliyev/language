import 'package:easy_localization/easy_localization.dart';
import 'package:english/cubit/grammar_cubit/grammar_cubit.dart';
import 'package:english/screen/tab_box/grammar/widget/build_widgets/grammar_build_error.dart';
import 'package:english/screen/tab_box/grammar/widget/build_widgets/grammar_build_loading.dart';
import 'package:english/screen/tab_box/grammar/widget/build_widgets/grammar_build_succes.dart';
import 'package:english/screen/widgets/global_appbar.dart';
import 'package:english/screen/widgets/global_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/grammar_cubit/grammar_state.dart';
import '../../../data/model/forms_status.dart';

class GrammarScreen extends StatelessWidget {
  const GrammarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const GlobalDrawer(),
      appBar: GlobalAppBar(title: 'learn_grammar'.tr(),),
      body: BlocBuilder<GrammarCubit, GrammarState>(
        builder: (context, state) {
          if (state.status == FormsStatus.loading) {
            return grammarBuildLoading();
          } else if (state.status == FormsStatus.success || state.status == FormsStatus.updateLoading) {
            return grammarBuildSuccess(state.grammarData);
          }
          return grammarBuildError(state.errorMessage);
        },
      ),
    );
  }
}

