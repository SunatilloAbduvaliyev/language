import 'package:easy_localization/easy_localization.dart';
import 'package:english/screen/route.dart';
import 'package:english/screen/tab_box/words/widget/word_category_item.dart';
import 'package:english/screen/widgets/global_drawer.dart';
import 'package:english/utils/style/app_text_style.dart';
import 'package:flutter/material.dart';

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
        ],
      ),
    );
    ;
  }
}
