import 'package:english/data/model/grammar/grammar_model.dart';
import 'package:english/data/model/word/word_model.dart';
import 'package:english/screen/add_word/add_word_screen.dart';
import 'package:english/screen/auth/login/login_screen.dart';
import 'package:english/screen/auth/register/register_screen.dart';
import 'package:english/screen/grammar_detail/grammar_detail_screen.dart';
import 'package:english/screen/learning_word_screen/learning_word_screen.dart';
import 'package:english/screen/tab_box/tab_box_screen.dart';
import 'package:english/screen/word_detail/word_detail_screen.dart';
import 'package:english/screen/word_game/word_game_screen.dart';
import 'package:english/utils/style/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AppRoute{
  static Route generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteName.login:
        return navigate(const LoginScreen());

      case RouteName.register:
        return navigate(const RegisterScreen());

      case RouteName.tabBoxScreen:
        return navigate(const TabBoxScreen());

      case RouteName.grammarDetail:
        return navigate( GrammarDetailScreen(grammarModel: settings.arguments as GrammarModel));

      case RouteName.addWord:
        return navigate(const AddWordScreen());

      case RouteName.wordDetail:
        return navigate(
          WordDetailScreen(
            wordModel: settings.arguments as WordModel,
          ),
        );

      case RouteName.learningWord:
        return navigate(const LearningWordScreen());

      case RouteName.wordGame:
        return navigate(const WordGameScreen());

      default:
        return navigate(
          Scaffold(
            body: Center(
              child: Text(
                "Default",
                style: AppTextStyle.bold,
              ),
            ),
          ),
        );
    }
  }
  static navigate(Widget widget)=>CupertinoPageRoute(builder: (context)=>widget);
}

class RouteName{
  static const String login = '/login';
  static const  String register = '/register';
  static const  String tabBoxScreen = '/tab_box';
  static const  String grammarDetail = '/grammar_detail';
  static const  String addWord = '/add_word';
  static const String wordDetail = '/word_detail';
  static const String learningWord = '/learning_word';
  static const String wordGame = '/word_game';
}