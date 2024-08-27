import 'package:easy_localization/easy_localization.dart';
import 'package:english/bloc/user_bloc/user_bloc.dart';
import 'package:english/bloc/user_bloc/user_event.dart';
import 'package:english/bloc/user_bloc/user_state.dart';
import 'package:english/data/model/example/example_model.dart';
import 'package:english/data/model/forms_status.dart';
import 'package:english/data/model/user/user_model.dart';
import 'package:english/screen/widgets/global_appbar.dart';
import 'package:english/screen/widgets/global_button.dart';
import 'package:english/screen/widgets/global_input.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:english/utils/style/app_text_style.dart';
import 'package:english/utils/ui_utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/word/word_model.dart';

class AddWordScreen extends StatefulWidget {
  const AddWordScreen({super.key});

  @override
  State<AddWordScreen> createState() => _AddWordScreenState();
}

class _AddWordScreenState extends State<AddWordScreen> {
  final TextEditingController enWordController = TextEditingController();
  final TextEditingController phoneticsController = TextEditingController();
  final TextEditingController translateController = TextEditingController();
  final TextEditingController exampleController = TextEditingController();
  final TextEditingController translateExampleController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<ExampleModel> exampleList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GlobalAppBar(
        title: "add_word",
        navigatePop: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'en_word'.tr(),
                style: AppTextStyle.bold,
              ),
              5.boxH(),
              GlobalInput(
                controller: enWordController,
                title: "en_word_title".tr(),
              ),
              20.boxH(),
              Text(
                'phonetics'.tr(),
                style: AppTextStyle.bold,
              ),
              5.boxH(),
              GlobalInput(
                controller: phoneticsController,
                title: "phonetics_title".tr(),
              ),
              20.boxH(),
              Text(
                'translate_word'.tr(),
                style: AppTextStyle.bold,
              ),
              5.boxH(),
              GlobalInput(
                controller: translateController,
                title: "translate_word_title".tr(),
              ),
              20.boxH(),
              Text(
                'example'.tr(),
                style: AppTextStyle.bold,
              ),
              5.boxH(),
              GlobalInput(
                isExample: true,
                controller: exampleController,
                title: "example_one_title".tr(),
              ),
              5.boxH(),
              GlobalInput(
                isExample: true,
                controller: translateExampleController,
                title: "example_two_title".tr(),
              ),
              5.boxH(),
              Row(
                children: [
                  const Expanded(
                    child: SizedBox(),
                  ),
                  globalButton(
                    title: "local_add_example".tr(),
                    onTap: () {
                      ExampleModel exampleModel = ExampleModel(
                        example: exampleController.text,
                        exampleExplanation: translateExampleController.text,
                      );
                      exampleList.add(exampleModel);
                      exampleController.clear();
                      translateExampleController.clear();
                    },
                  ),
                ],
              ),
              10.boxH(),
              BlocConsumer<UserBloc, UserState>(
                builder: (BuildContext context, UserState state) {
                  return Center(
                    child: SizedBox(
                      width: 250.w,
                      child: globalButton(
                        isLoading: state.status == FormsStatus.loading,
                        title: "add_word_title".tr(),
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            WordModel wordModel = WordModel.initialValue();
                            wordModel = wordModel.copyWith(
                              english: enWordController.text,
                              phonetics: phoneticsController.text,
                              exampleEn: exampleList,
                              translateWord: translateController.text,
                              uid: enWordController.text.substring(0, 1),
                            );
                            List<WordModel> listWord =
                                List.from(state.userData.words);
                            listWord.add(wordModel);
                            UserModel userModel = state.userData;
                            userModel = userModel.copyWith(
                              words: listWord,
                            );
                            context.read<UserBloc>().add(
                                  UserUpdateEvent(
                                    userModel: userModel,
                                  ),
                                );
                          }
                        },
                      ),
                    ),
                  );
                },
                listenWhen: (oldState, currentState) =>
                    currentState.status == FormsStatus.success ||
                    currentState.status == FormsStatus.error,
                listener: (BuildContext context, UserState state) {
                  if (state.status == FormsStatus.error) {
                    showErrorMessage(
                      message: "add_error_word".tr(),
                      context: context,
                      onTap: () {
                        context.read<UserBloc>().add(UserInitialEvent());
                      },
                    );
                  }else{
                    enWordController.clear();
                    translateController.clear();
                    phoneticsController.clear();
                  }
                },
              )
            ],
          ).paddingAll(14.w),
        ),
      ),
    );
  }
}
