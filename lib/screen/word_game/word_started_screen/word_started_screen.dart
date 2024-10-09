import 'package:easy_localization/easy_localization.dart';
import 'package:english/bloc/user_bloc/user_bloc.dart';
import 'package:english/cubit/word_cubit/word_cubit.dart';
import 'package:english/data/model/forms_status.dart';
import 'package:english/data/model/word/word_model.dart';
import 'package:english/screen/route.dart';
import 'package:english/screen/word_game/word_started_screen/widget/word_active_index.dart';
import 'package:english/screen/word_game/word_started_screen/widget/word_button.dart';
import 'package:english/screen/word_game/word_started_screen/widget/word_table.dart';
import 'package:english/screen/word_game/word_started_screen/widget/word_title.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:english/utils/ui_utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/user_bloc/user_state.dart';
import '../../../cubit/word_cubit/word_state.dart';
import '../../../cubit/word_game_cubit/word_game_cubit.dart';
import '../../../utils/images/app_images.dart';

class WordStartedGameScreen extends StatefulWidget {
  const WordStartedGameScreen({super.key});

  @override
  State<WordStartedGameScreen> createState() => _WordStartedGameScreenState();
}

class _WordStartedGameScreenState extends State<WordStartedGameScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Image.asset(
                AppImages.wordBackground,
                height: MediaQuery.sizeOf(context).height,
                fit: BoxFit.cover,
                width: width,
              ),
              Positioned(
                top: 30.h,
                right: 5,
                left: 5,
                child: wordTitle(
                  title:
                      "manual_word_game".tr(),
                ),
              ),
              Positioned(
                right: 5,
                left: 5,
                top: 120.h,
                child: wordTable(),
              ),
              Positioned(
                bottom: 200.h,
                right: 0,
                left: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    wordButton(onTap: () {
                      Navigator.pop(context);
                    }),
                    BlocBuilder<WordCubit, WordState>(
                      builder: (BuildContext context, WordState wordState) {
                        return BlocBuilder<UserBloc, UserState>(
                          builder: (BuildContext context, UserState userState) {
                            return wordButton(
                              isLoading:
                                  userState.status == FormsStatus.loading ||
                                      wordState.status == FormsStatus.loading,
                              title: 'get_started',
                              onTap: () {
                                List<WordModel> checkWord = [];
                                if (wordActiveIndex == -1) {
                                  showErrorMessage(
                                    message: 'no_check_word',
                                    context: context,
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  );
                                } else if (wordState.status ==
                                    FormsStatus.pure||wordState.status==FormsStatus.error) {
                                  showErrorMessage(
                                    message: "download_word",
                                    context: context,
                                    onTap: () {
                                      context.read<WordCubit>().fetchWord();
                                      Navigator.pop(context);
                                    },
                                  );
                                } else {
                                  if (wordActiveIndex == 1) {
                                    checkWord = context
                                        .read<WordCubit>()
                                        .state
                                        .listWord;
                                  } else if (wordActiveIndex == 2) {
                                    checkWord = context
                                        .read<UserBloc>()
                                        .state
                                        .userData
                                        .words;
                                  } else {
                                    checkWord = context
                                        .read<UserBloc>()
                                        .state
                                        .favouriteWord;
                                  }
                                  if (checkWord.isEmpty) {
                                    showErrorMessage(
                                      message: 'error_word_list',
                                      context: context,
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    );
                                  }else{
                                    context.read<WordGameCubit>().startGame(
                                      trueAnswer: checkWord[0].english,
                                      questionWord:
                                      checkWord[0].translateWord,
                                      wordIndex: 0,
                                      wordLength: checkWord.length,
                                    );
                                    Navigator.pushNamed(
                                        context, RouteName.wordGameScreen,
                                        arguments: checkWord);
                                  }
                                }
                              },
                            );
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
