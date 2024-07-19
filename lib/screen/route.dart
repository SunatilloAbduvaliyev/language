import 'package:english/screen/auth/login/login_screen.dart';
import 'package:english/screen/auth/register/register_screen.dart';
import 'package:english/screen/grammar_add.dart';
import 'package:english/screen/tab_box/tab_box_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AppRoute{
  static Route generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteName.grammarAdd:
        return navigate(const GrammarAddScreen());
      case RouteName.login:
        return navigate(const LoginScreen());

      case RouteName.register:
        return navigate(const RegisterScreen());

      case RouteName.tabBoxScreen:
        return navigate(const TabBoxScreen());


      default:
        return navigate(const Scaffold());
    }
  }
  static navigate(Widget widget)=>CupertinoPageRoute(builder: (context)=>widget);
}

class RouteName{
  static const String grammarAdd = '/add';
  static const String login = '/login';
  static const  String register = '/register';
  static const  String tabBoxScreen = '/tab_box';

}