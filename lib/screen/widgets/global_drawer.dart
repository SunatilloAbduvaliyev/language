import 'package:english/screen/widgets/change_language_button.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/user_bloc/user_bloc.dart';
import '../../bloc/user_bloc/user_state.dart';
import '../../data/model/forms_status.dart';
import '../../utils/style/app_text_style.dart';

Widget globalDrawer(BuildContext context){
  return Drawer(
    child: Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 60.h),
      child: BlocConsumer<UserBloc, UserState>(
        builder: (BuildContext ctx, UserState state) {
          return ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              10.boxW(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(state.userData.firstName,
                    style: AppTextStyle.bold,
                  ),
                  Text(state.userData.lastName,
                    style: AppTextStyle.bold,
                  ),
                  10.boxH(),
                  changeLanguageButton(context),
                ],
              ),
            ],
          );
        },
        listenWhen: (lastState, currentState) =>
        currentState.status == FormsStatus.error,
        listener: (BuildContext context, UserState state) {},
      ),
    ),
  );
}