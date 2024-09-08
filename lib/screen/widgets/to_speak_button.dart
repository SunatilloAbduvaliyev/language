import 'package:english/services/text_to_speech_service.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:english/utils/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget toSpeakButton({required speakText}) {
  TextToSpeechService textToSpeechService = TextToSpeechService();
  return GestureDetector(
    onTap: () {
      textToSpeechService.speak(speakText);
    },
    child: Container(
      width: 40.w,
      height: 40.h,
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Colors.blueAccent,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        AppImages.audio,
        width: 24.w,
        height: 24.h,
        colorFilter: const ColorFilter.mode(
          Colors.white,
          BlendMode.srcIn,
        ),
      ),
    ),
  );
}
