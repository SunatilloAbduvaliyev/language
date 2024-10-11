import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/user_bloc/user_bloc.dart';
import '../../../utils/images/app_images.dart';
import '../../../utils/style/app_text_style.dart';
import '../../widgets/circle_image.dart';

Widget buildQuizItem({
  required int index,
  required BuildContext context,
  required VoidCallback onTap,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                circleImage(
                  imagePath: AppImages.quizImage,
                ),
                RichText(
                  text: TextSpan(
                    text: "quiz".tr(),
                    style: AppTextStyle.bold.copyWith(
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: "  ${(index + 1).toString()}",
                        style: AppTextStyle.bold.copyWith(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  context
                              .read<UserBloc>()
                              .state
                              .userData
                              .learningEnglishIndex >=
                          index
                      ? Icons.lock_open
                      : Icons.lock,
                  size: 24,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
