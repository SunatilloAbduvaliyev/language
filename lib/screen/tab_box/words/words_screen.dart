import 'package:easy_localization/easy_localization.dart';
import 'package:english/bloc/user_bloc/user_bloc.dart';
import 'package:english/cubit/word_category_cubit/word_category_cubit.dart';
import 'package:english/screen/route.dart';
import 'package:english/screen/tab_box/words/widget/empty_item.dart';
import 'package:english/screen/tab_box/words/widget/word_category_item.dart';
import 'package:english/screen/tab_box/words/widget/word_table.dart';
import 'package:english/screen/widgets/global_drawer.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:english/utils/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/user_bloc/user_state.dart';
import '../../../cubit/word_cubit/word_cubit.dart';
import '../../../cubit/word_cubit/word_state.dart';
import '../../widgets/global_appbar.dart';

class WordsScreen extends StatelessWidget {
  const WordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const GlobalDrawer(),
      appBar: GlobalAppBar(
        title: "add_word".tr(),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  child: Text(
                    'add_word'.tr(),
                    style: AppTextStyle.medium,
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, RouteName.addWord);
                  },
                ),
                const PopupMenuItem<String>(
                  value: 'Option 2',
                  child: Text('Option 2'),
                ),
              ];
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: WordCategoryItems(),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<WordCategoryCubit, int>(
                builder: (BuildContext context, int state) {
              if (state == 0) {
                return BlocBuilder<WordCubit, WordState>(
                  builder: (BuildContext context, WordState state) {
                    if(state.listWord.isEmpty){
                      return emptyItem();
                    }
                    return WordTable(words: state.listWord)
                        .paddingHorizontal(14.w);
                  },
                );
              } else if (state == 1) {
                return BlocBuilder<UserBloc, UserState>(
                  builder: (BuildContext context, UserState state) {
                    if(state.userData.words.isEmpty){
                      return emptyItem();
                    }
                    return WordTable(words: state.userData.words)
                        .paddingHorizontal(14.w);
                  },
                );
              }
              return BlocBuilder<UserBloc, UserState>(
                builder: (BuildContext context, UserState state) {
                  if(state.userData.favouriteWords.isEmpty){
                    return emptyItem();
                  }
                  return WordTable(words: state.userData.favouriteWords)
                      .paddingHorizontal(14.w);
                },
              );
            }),
          )
        ],
      ),
    );
  }
}
