import 'package:easy_localization/easy_localization.dart';
import 'package:english/screen/route.dart';
import 'package:english/screen/tab_box/game/widget/game_button.dart';
import 'package:english/screen/widgets/global_appbar.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:english/utils/images/app_images.dart';
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
            Row(
              children: [
                gameButton(
                  onTap: (){
                    Navigator.pushNamed(context, RouteName.wordStartedScreen,);
                  },
                  imagePath: AppImages.wordLogo,
                  title: "word_game",
                ),
              ],
            )
          ],
        ).paddingHorizontal(14));
  }
}
