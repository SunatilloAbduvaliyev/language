import 'package:flutter/cupertino.dart';
import 'package:flutter_tts/flutter_tts.dart';

// TtsState ni enum ko'rinishida aniqlash
enum TtsState { playing, stopped, paused, continued }

class TextToSpeechService {
  late FlutterTts _flutterTts;
  TtsState _ttsState = TtsState.stopped;

  TextToSpeechService() {
    _initTts();
  }

  // Ovoz holati uchun getter'lar
  bool get isPlaying => _ttsState == TtsState.playing;
  bool get isStopped => _ttsState == TtsState.stopped;
  bool get isPaused => _ttsState == TtsState.paused;
  bool get isContinued => _ttsState == TtsState.continued;

  void _initTts() {
    _flutterTts = FlutterTts();

    _flutterTts.setStartHandler(() {
      _ttsState = TtsState.playing;
    });

    _flutterTts.setCompletionHandler(() {
      _ttsState = TtsState.stopped;
    });

    _flutterTts.setCancelHandler(() {
      _ttsState = TtsState.stopped;
    });

    _flutterTts.setPauseHandler(() {
      _ttsState = TtsState.paused;
    });

    _flutterTts.setContinueHandler(() {
      _ttsState = TtsState.continued;
    });

    _flutterTts.setErrorHandler((msg) {
      _ttsState = TtsState.stopped;
      debugPrint("Error: $msg");
    });
  }

  Future<void> speak(String text) async {
    if (text.isNotEmpty) {
      await _flutterTts.setVolume(0.5); // Volume, pitch va rate ni sozlash
      await _flutterTts.setSpeechRate(0.5);
      await _flutterTts.setPitch(1.0);
      await _flutterTts.speak(text);
    }
  }

  Future<void> stop() async {
    var result = await _flutterTts.stop();
    if (result == 1) {
      _ttsState = TtsState.stopped;
    }
  }

  Future<void> pause() async {
    var result = await _flutterTts.pause();
    if (result == 1) {
      _ttsState = TtsState.paused;
    }
  }
}
