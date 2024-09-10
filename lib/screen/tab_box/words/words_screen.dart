import 'package:easy_localization/easy_localization.dart';
import 'package:english/bloc/user_bloc/user_bloc.dart';
import 'package:english/cubit/change_item_cubit/change_item_cubit.dart';
import 'package:english/cubit/word_category_cubit/word_category_cubit.dart';
import 'package:english/data/model/forms_status.dart';
import 'package:english/screen/route.dart';
import 'package:english/screen/tab_box/words/widget/LoadingWordTable.dart';
import 'package:english/screen/tab_box/words/widget/empty_item.dart';
import 'package:english/screen/tab_box/words/widget/search_item.dart';
import 'package:english/screen/tab_box/words/widget/word_category_item.dart';
import 'package:english/screen/tab_box/words/widget/word_list_item.dart';
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
      drawer: globalDrawer(context),
      appBar: GlobalAppBar(
        title: "add_word".tr(),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (BuildContext ctx) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  child: Text(
                    'add_word'.tr(),
                    style: AppTextStyle.medium,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.addWord);
                  },
                ),
                PopupMenuItem<String>(
                  child: Text(
                    'learning_word'.tr(),
                    style: AppTextStyle.medium,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.learningWord);
                  },
                ),
              ];
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: BlocBuilder<WordCubit, WordState>(
              builder: (context, wordState) {
                return BlocBuilder<UserBloc, UserState>(
                  builder: (context, userState) {
                    if (wordState.status == FormsStatus.success &&
                        userState.status == FormsStatus.success) {
                      return SearchItem(
                        allWords: wordState.listWord,
                        userListWord: userState.userData.words,
                      ).paddingHorizontal(14);
                    } else {
                      return const CircularProgressIndicator(); // Show a loading indicator
                    }
                  },
                );
              },
            ),
          ),
          SliverPersistentHeader(
            delegate: WordCategoryItems(),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<WordCategoryCubit, int>(
              builder: (BuildContext ctx, int state) {
                if (state == 0) {
                  return BlocBuilder<WordCubit, WordState>(
                    builder: (BuildContext ctx, WordState state) {
                      if (state.listWord.isEmpty) {
                        return emptyItem();
                      }
                      if (state.status == FormsStatus.loading) {
                        return const LoadingWordTable().paddingHorizontal(14);
                      }
                      return context.watch<ChangeItemCubit>().state == 0
                          ? WordTable(words: state.listWord)
                              .paddingHorizontal(14.w)
                          : WordListItem(
                              listWords: state.listWord,
                            ).paddingHorizontal(14);
                    },
                  );
                } else if (state == 1) {
                  return BlocBuilder<UserBloc, UserState>(
                    builder: (BuildContext ctx, UserState state) {
                      if (state.userData.words.isEmpty) {
                        return emptyItem();
                      }
                      if (state.status == FormsStatus.loading) {
                        return const LoadingWordTable().paddingHorizontal(14);
                      }
                      return context.watch<ChangeItemCubit>().state == 0
                          ? WordTable(words: state.userData.words)
                              .paddingHorizontal(14.w)
                          : WordListItem(
                              listWords: state.userData.words,
                            ).paddingHorizontal(14);
                    },
                  );
                }
                return BlocBuilder<UserBloc, UserState>(
                  builder: (BuildContext ctx, UserState state) {
                    if (state.userData.favouriteWords.isEmpty) {
                      return emptyItem();
                    }
                    if (state.status == FormsStatus.loading) {
                      return const LoadingWordTable().paddingHorizontal(14);
                    }
                    return context.watch<ChangeItemCubit>().state == 0
                        ? WordTable(words: state.userData.favouriteWords)
                            .paddingHorizontal(14.w)
                        : WordListItem(
                            listWords: state.userData.favouriteWords,
                          ).paddingHorizontal(14);
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
