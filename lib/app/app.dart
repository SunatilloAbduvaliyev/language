import 'package:easy_localization/easy_localization.dart';
import 'package:english/bloc/user_bloc/user_bloc.dart';
import 'package:english/cubit/active_button_cubit/active_button_cubit.dart';
import 'package:english/cubit/auth_cubit/auth_cubit.dart';
import 'package:english/cubit/change_item_cubit/change_item_cubit.dart';
import 'package:english/cubit/grammar_cubit/grammar_cubit.dart';
import 'package:english/cubit/quiz_cubit/quiz_cubit.dart';
import 'package:english/cubit/tab_box_cubit/tab_box_cubit.dart';
import 'package:english/cubit/word_category_cubit/word_category_cubit.dart';
import 'package:english/cubit/word_cubit/word_cubit.dart';
import 'package:english/screen/route.dart';
import 'package:english/utils/color/app_colors.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/word_game_cubit/word_game_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => UserBloc()),
        BlocProvider(create: (_) => TabBoxCubit()),
        BlocProvider(create: (_) => GrammarCubit()..fetAllGrammar()),
        BlocProvider(create: (_) => WordCategoryCubit()),
        BlocProvider(create: (_) => WordCubit()..fetchWord()),
        BlocProvider(create: (_)=>ChangeItemCubit()),
        BlocProvider(create: (_)=>WordGameCubit()),
        BlocProvider(create: (_)=>QuizCubit()),
        BlocProvider(create: (_)=>ActiveButtonCubit())
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    width = context.getWidth();
    height = context.getHeight();
    return  MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.cF3F3F3,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent,
          ),
          backgroundColor: AppColors.cF3F3F3
        )
      ),
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoute.generateRoute,
      initialRoute: RouteName.login,
    );
  }
}
