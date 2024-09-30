import 'package:easy_localization/easy_localization.dart';
import 'package:english/bloc/user_bloc/user_bloc.dart';
import 'package:english/bloc/user_bloc/user_state.dart';
import 'package:english/cubit/change_item_cubit/change_item_cubit.dart';
import 'package:english/screen/tab_box/words/widget/change_word_item.dart';
import 'package:english/screen/widgets/word_list_item.dart';
import 'package:english/screen/tab_box/words/widget/word_table.dart';
import 'package:english/screen/widgets/global_appbar.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:english/utils/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

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
          builder: (BuildContext context, int itemState) {
              return BlocBuilder<UserBloc, UserState>(
                builder: (BuildContext context, UserState state){
                  if(state.userData.favouriteWords.isEmpty){
                    return Lottie.asset(AppImages.empty);
                  }
                  else if (itemState == 0) {
                    return WordTable(
                      words: state.userData.favouriteWords,
                    );
                  }
                  return WordListItem(
                    isFavourite: true,
                    listWords: state.userData.favouriteWords,
                  );
                },
              );
          },
        ).paddingHorizontal(14),
      ).paddingBottom(10),
    );
  }
}
