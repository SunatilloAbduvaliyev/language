import 'package:english/bloc/user_bloc/user_bloc.dart';
import 'package:english/bloc/user_bloc/user_event.dart';
import 'package:english/bloc/user_bloc/user_state.dart';
import 'package:english/data/model/word/word_model.dart';
import 'package:english/screen/route.dart';
import 'package:english/screen/widgets/to_speak_button.dart';
import 'package:english/services/text_to_speech_service.dart';
import 'package:english/utils/color/app_colors.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:english/utils/style/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WordListItem extends StatefulWidget {
  const WordListItem({
    super.key,
    required this.listWords,
    this.isFavourite = false,
  });

  final List<WordModel> listWords;
  final bool isFavourite;

  @override
  State<WordListItem> createState() => _WordListItemState();
}

class _WordListItemState extends State<WordListItem> {
  TextToSpeechService textToSpeechService = TextToSpeechService();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          itemCount: widget.listWords.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int generateIndex) {
            return ListTile(
              onTap: () {
                debugPrint(
                    "index and english: ______________________________ index $generateIndex , english: ${widget.listWords[generateIndex].english}");
                Navigator.pushNamed(
                  context,
                  RouteName.wordDetail,
                  arguments: widget.listWords[generateIndex],
                );
              },
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.listWords[generateIndex].english,
                          style: AppTextStyle.bold,
                        ),
                        5.boxH(),
                        Text(
                          widget.listWords[generateIndex].translateWord,
                          style: AppTextStyle.bold,
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<UserBloc, UserState>(
                    builder: (BuildContext context, UserState state) {
                      return Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              debugPrint(
                                  "index and english: ______________________________ index $generateIndex , english: ${widget.listWords[generateIndex].english}");
                              if (state.userData.checkLike.containsKey(
                                  widget.listWords[generateIndex].english)) {
                                context.read<UserBloc>().add(
                                      UserLikeWordUpdateEvent(
                                        index: generateIndex,
                                        isTrue: true,
                                        wordModel:
                                            widget.listWords[generateIndex],
                                        userModel: state.userData,
                                      ),
                                    );
                              } else {
                                context.read<UserBloc>().add(
                                      UserLikeWordUpdateEvent(
                                        index: generateIndex,
                                        wordModel:
                                            widget.listWords[generateIndex],
                                        userModel: state.userData,
                                      ),
                                    );
                              }
                            },
                            icon: state.favouriteWordLoading
                                    .contains(generateIndex)
                                ? const CupertinoActivityIndicator(
                                    color: AppColors.c000000,
                                  )
                                : Icon(
                                    state.userData.checkLike.containsKey(
                                      widget.listWords[generateIndex].english,
                                    )
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: Colors.yellow,
                                    size: 30,
                                  ),
                          ),
                          10.boxW(),
                          Visibility(
                            visible: widget.listWords[generateIndex].isLike,
                            child: IconButton(
                              onPressed: () {
                                context.read<UserBloc>().add(
                                      UserWordDeleteEvent(
                                        index: generateIndex,
                                        userData: state.userData,
                                        isFavourite: widget.isFavourite,
                                      ),
                                    );
                              },
                              icon: state.wordDeleteLoading
                                      .contains(generateIndex)
                                  ? const CupertinoActivityIndicator()
                                  : const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                      size: 24,
                                    ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
              leading: toSpeakButton(
                  speakText: widget.listWords[generateIndex].english),
            );
          },
        ),
      ],
    );
  }
}
