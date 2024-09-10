import 'package:english/screen/tab_box/words/widget/category_item.dart';
import 'package:english/screen/tab_box/words/widget/change_word_item.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:flutter/material.dart';

class WordCategoryItems extends SliverPersistentHeaderDelegate {

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return   Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ChangeWordItem(),
            10.boxW(),
            const CategoryItem(),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 50.0;

  @override
  double get minExtent => 50.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
