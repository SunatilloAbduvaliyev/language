import 'package:easy_localization/easy_localization.dart';
import 'package:english/bloc/user_bloc/user_bloc.dart';
import 'package:english/cubit/auth_cubit/auth_cubit.dart';
import 'package:english/cubit/grammar_cubit/grammar_cubit.dart';
import 'package:english/cubit/like_cubit/like_cubit.dart';
import 'package:english/cubit/tab_box_cubit/tab_box_cubit.dart';
import 'package:english/screen/route.dart';
import 'package:english/utils/color/app_colors.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => UserBloc()),
        BlocProvider(create: (_) => TabBoxCubit()),
        BlocProvider(create: (_) => GrammarCubit()),
        BlocProvider(create: (_) => LikeCubit()),
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
        scaffoldBackgroundColor: AppColors.cF3F3F3
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
