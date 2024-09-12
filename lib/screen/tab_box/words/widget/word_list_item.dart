import 'package:english/bloc/user_bloc/user_bloc.dart';
import 'package:english/bloc/user_bloc/user_event.dart';
import 'package:english/bloc/user_bloc/user_state.dart';
import 'package:english/data/model/forms_status.dart';
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
  });

  final List<WordModel> listWords;

  @override
  State<WordListItem> createState() => _WordListItemState();
}

class _WordListItemState extends State<WordListItem> {
  TextToSpeechService textToSpeechService = TextToSpeechService();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listWords.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index){
        return ListTile(
          onTap: () {
            Navigator.pushNamed(
              context,
              RouteName.wordDetail,
              arguments: widget.listWords[index],
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
                      widget.listWords[index].english,
                      style: AppTextStyle.bold,
                    ),
                    5.boxH(),
                    Text(
                      widget.listWords[index].translateWord,
                      style: AppTextStyle.bold,
                    ),
                  ],
                ),
              ),
              BlocBuilder<UserBloc, UserState>(
                builder: (BuildContext context, UserState state) {
                  return IconButton(
                    onPressed: () {
                      if (state.userData.checkLike
                          .containsKey(widget.listWords[index].english)) {
                        context.read<UserBloc>().add(
                          UserLikeWordUpdateEvent(
                            isTrue: true,
                            wordModel: widget.listWords[index],
                            userModel: state.userData,
                          ),
                        );
                      } else {
                        context.read<UserBloc>().add(
                          UserLikeWordUpdateEvent(
                            wordModel: widget.listWords[index],
                            userModel: state.userData,
                          ),
                        );
                      }
                    },
                    icon: state.status == FormsStatus.updateLoading
                        ? const CupertinoActivityIndicator(
                      color: AppColors.c000000,
                    )
                        : Icon(
                      state.userData.checkLike.containsKey(
                          widget.listWords[index].english)
                          ? Icons.star
                          : Icons.star_border,
                      color: Colors.yellow,
                      size: 30,
                    ),
                  );
                },
              ),
            ],
          ),
          leading: toSpeakButton(speakText: widget.listWords[index].english),
        );
      },
    );
  }
}
