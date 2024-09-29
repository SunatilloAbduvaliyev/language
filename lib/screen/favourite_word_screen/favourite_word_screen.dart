import 'package:easy_localization/easy_localization.dart';
import 'package:english/bloc/user_bloc/user_bloc.dart';
import 'package:english/cubit/change_item_cubit/change_item_cubit.dart';
import 'package:english/screen/tab_box/words/widget/change_word_item.dart';
import 'package:english/screen/widgets/word_list_item.dart';
import 'package:english/screen/tab_box/words/widget/word_table.dart';
import 'package:english/screen/widgets/global_appbar.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteWordScreen extends StatefulWidget {
  const FavouriteWordScreen({super.key});

  @override
  State<FavouriteWordScreen> createState() => _FavouriteWordScreenState();
}

class _FavouriteWordScreenState extends State<FavouriteWordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: "favourite".tr(),
        navigatePop: true,
        actions: [
          const ChangeWordItem(),
          30.boxW(),
        ],
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<ChangeItemCubit, int>(
          builder: (BuildContext context, int state) {
            if (state == 0) {
              return WordTable(
                words: context.read<UserBloc>().state.userData.favouriteWords,
              );
            }
            return WordListItem(
              listWords: context.read<UserBloc>().state.userData.favouriteWords,
            );
          },
        ).paddingHorizontal(14),
      ).paddingBottom(10),
    );
  }
}
