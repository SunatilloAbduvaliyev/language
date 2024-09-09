import 'package:easy_localization/easy_localization.dart';
import 'package:english/data/model/word/word_model.dart';
import 'package:english/screen/route.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:english/utils/images/app_images.dart';
import 'package:english/utils/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchItem extends StatefulWidget {
  const SearchItem({
    super.key,
    required this.listWords,
    required this.title,
  });

  final List<WordModel> listWords;
  final String title;

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Autocomplete<WordModel>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == " ") {
            return const Iterable<WordModel>.empty();
          }
          return widget.listWords.where(
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
                      focusNode.unfocus();
                      textEditingController.clear();
                    },
                    scrollPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    style: AppTextStyle.bold,
                    decoration: InputDecoration(
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
