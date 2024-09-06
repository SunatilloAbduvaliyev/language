import 'package:english/services/text_to_speech_service.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:flutter/material.dart';


Widget toSpeakButton({
  required speakText
}){
  TextToSpeechService textToSpeechService = TextToSpeechService();
  return  GestureDetector(
    onTap: () {
      textToSpeechService.speak(speakText);
    },
    child: Container(
      width: 40.w,
      height: 40.h,
      decoration: const BoxDecoration(
        color: Colors.blueAccent,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.multitrack_audio_sharp,
        size: 24,
        color: Colors.white,
      ),
    ),
  );
}