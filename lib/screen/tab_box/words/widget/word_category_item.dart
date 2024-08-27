import 'package:english/screen/tab_box/words/widget/category_item.dart';
import 'package:flutter/cupertino.dart';

class WordCategoryItems extends SliverPersistentHeaderDelegate {

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return const CategoryItem();
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
