import 'package:easy_localization/easy_localization.dart';
import 'package:english/data/model/word/word_model.dart';
import 'package:english/screen/route.dart';
import 'package:english/utils/color/app_colors.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:english/utils/images/app_images.dart';
import 'package:english/utils/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchItem extends StatefulWidget {
  const SearchItem({
    super.key,
    required this.allWords,
    required this.userListWord,
  });

  final List<WordModel> allWords;
  final List<WordModel> userListWord;

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  List<WordModel> searchList = [];

  @override
  void initState() {
    super.initState();
    searchList.addAll(widget.allWords);
    searchList.addAll(widget.userListWord);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Autocomplete<WordModel>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text.isEmpty) {
            return searchList; // Barcha elementlarni qaytarish
          }
          return searchList.where(
            (e) => e.english.toLowerCase().contains(
                  textEditingValue.text.toLowerCase(),
                ),
          );
        },
        onSelected: (WordModel selectedWord) {
          Navigator.pushNamed(context, RouteName.wordDetail,
              arguments: selectedWord);
        },
        displayStringForOption: (WordModel option) => option.english,
        fieldViewBuilder: (
          BuildContext context,
          TextEditingController textEditingController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted,
        ) {
          return Container(
            height: 70.h,
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
            ),
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: textEditingController,
                    focusNode: focusNode,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (String value){
                      textEditingController.clear();
                      focusNode.unfocus();
                    },
                    scrollPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    style: AppTextStyle.bold,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          focusNode.unfocus();
                          textEditingController.clear();
                        },
                        icon: const Icon(
                          Icons.clear_outlined,
                          size: 24,
                          color: AppColors.c000000,
                        ),
                      ),
                      hintText: "search".tr(),
                      hintStyle: AppTextStyle.bold,
                      fillColor: Colors.white,
                      filled: true,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.white,
                        ),
                      ),
                      disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                10.boxW(),
                SvgPicture.asset(
                  AppImages.search,
                  width: 30.w,
                  height: 30.h,
                ),
                10.boxW(),
              ],
            ),
          );
        },
        optionsViewBuilder: (
          BuildContext context,
          AutocompleteOnSelected<WordModel> onSelected,
          Iterable<WordModel> options,
        ) {
          return Align(
            alignment: Alignment.topLeft,
            child: Material(
              elevation: 4,
              child: Container(
                width: 300.w,
                height: 200.h,
                color: Colors.white,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    final WordModel option = options.elementAt(index);

                    return ListTile(
                      title: Text(
                        option.english,
                        style: AppTextStyle.bold.copyWith(
                          color: AppColors.c000000,
                          fontSize: 18,
                        ),
                      ),
                      onTap: () => onSelected(option),
                      leading: const Icon(
                        Icons.search,
                        color: AppColors.c000000,
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
