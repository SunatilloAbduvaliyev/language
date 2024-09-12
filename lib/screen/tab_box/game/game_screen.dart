import 'package:easy_localization/easy_localization.dart';
import 'package:english/screen/route.dart';
import 'package:english/screen/widgets/global_appbar.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:english/utils/style/app_text_style.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GlobalAppBar(
          title: "add_word".tr(),
        ),
        body: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteName.wordGame);
              },
              child: Text(
                'Word Game',
                style: AppTextStyle.bold,
              ),
            )
          ],
        ).paddingHorizontal(14));
  }
}
