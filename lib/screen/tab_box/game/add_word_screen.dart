import 'package:easy_localization/easy_localization.dart';
import 'package:english/screen/widgets/global_appbar.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: "add_word".tr(),
      ),
      body: const CustomScrollView(
        slivers: [],
      ),
    );
  }
}
