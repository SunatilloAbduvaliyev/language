import 'package:english/utils/extension/extension.dart';
import 'package:english/utils/images/app_images.dart';
import 'package:english/utils/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class LetterButton extends StatefulWidget {
  final String letter;
  final VoidCallback onTap;
  final bool isActive;

  const LetterButton({
    super.key,
    required this.letter,
    required this.onTap,
    required this.isActive,
  });

  @override
  State<LetterButton> createState() => _LetterButtonState();
}

class _LetterButtonState extends State<LetterButton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.isActive ? 0 : 1,
      duration: const Duration(milliseconds: 500),
      child: ZoomTapAnimation(
        onTap: widget.onTap,
        child: Stack(
                children: [
                  Image.asset(
                    AppImages.word,
                    width: 100.w,
                    height: 100.h,
                  ),
                  Positioned(
                    top: 15.h,
                    left: 40.w,
                    right: 0,
                    bottom: 0,
                    child: Text(
                      widget.letter,
                      style: AppTextStyle.bold.copyWith(
                        fontSize: 40,
                        color: Colors.white,
                        shadows: [
                          const Shadow(
                            blurRadius: 5.0, // Soya tarqalishi
                            color: Colors.red, // Soya rangi (qizil)
                            offset: Offset(2.0, 2.0), // Soya yo'nalishi,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
