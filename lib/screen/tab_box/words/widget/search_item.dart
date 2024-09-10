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
    debugPrint(
        '_________________________________________________________ user word list length ${widget.userListWord.length.toString()}');
    debugPrint(
        '_________________________________________________________ all word list length ${widget.allWords.length.toString()}');
    debugPrint(
        '_________________________________________________________ all list length ${searchList.length.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(
        '_________________________________________________________ search build run ${searchList.length.toString()}');
    return Center(
      child: Autocomplete<WordModel>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == ' ') {
            return const Iterable<WordModel>.empty();
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
                    onFieldSubmitted: (String value) {

                    },
                    scrollPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    style: AppTextStyle.bold,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          focusNode.unfocus();
                          textEditingController.text = '';
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
                      errorBorder: const OutlineInputBorder(
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
      ),
    );
  }
}
