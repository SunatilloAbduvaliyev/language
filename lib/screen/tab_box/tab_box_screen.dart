import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:english/bloc/user_bloc/user_event.dart';
import 'package:english/cubit/like_cubit/like_cubit.dart';
import 'package:english/screen/tab_box/add_word/add_word_screen.dart';
import 'package:english/screen/tab_box/chat_bot/chat_bot_screen.dart';
import 'package:english/screen/tab_box/grammar/grammer_screen.dart';
import 'package:english/screen/tab_box/quiz/quiz_screen.dart';
import 'package:english/screen/tab_box/words/words_screen.dart';
import 'package:english/utils/color/app_colors.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../bloc/user_bloc/user_bloc.dart';
import '../../cubit/auth_cubit/auth_cubit.dart';
import '../../cubit/grammar_cubit/grammar_cubit.dart';
import '../../cubit/tab_box_cubit/tab_box_cubit.dart';
import '../../data/model/forms_status.dart';
import '../../utils/images/app_images.dart';

class TabBoxScreen extends StatefulWidget {
  const TabBoxScreen({super.key});

  @override
  State<TabBoxScreen> createState() => _TabBoxScreenState();
}

class _TabBoxScreenState extends State<TabBoxScreen> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  List<Widget> screens = [
    const GrammarScreen(),
    const WordsScreen(),
    const AddWordScreen(),
    const QuizScreen(),
    const ChatBotScreen(),
  ];

  final List<String> explanations = [
    'This is the grammar screen. Here you can learn about English grammar rules.',
    'This is the words screen. Here you can add and manage your vocabulary.',
    'This is the add word screen. Here you can add new words to your list.',
    'This is the quiz screen. Here you can take quizzes to test your knowledge.',
    'This is the chat bot screen. Here you can chat with an AI bot to practice English.',
  ];

  void _initFetchUser(String docId) {
    context.read<UserBloc>().add(FetchUserData(userDocId: docId));
  }


  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      debugPrint('grammar chiqirilmoqda new isolate start');
      context.read<GrammarCubit>().fetAllGrammar();
      debugPrint('grammar chiqirilmoqda old isolate run');
      debugPrint('grammar chiqirilmoqda old isolate run');
      if (context.read<AuthCubit>().state.status == FormsStatus.pure) {
        String userDocUid = FirebaseAuth.instance.currentUser!.uid;
        _initFetchUser(userDocUid);
      }
    });
  }

  void _showExplanation(int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            explanations[index],
            style: const TextStyle(fontSize: 18),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TabBoxCubit, int>(
        builder: (context, state) {
          return IndexedStack(
            index: state,
            children: screens,
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<TabBoxCubit, int>(
        builder: (context, state) {
          return CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: state,
            items: <Widget>[
              SvgPicture.asset(
                AppImages.grammar,
                width: 25.w,
                height: 25.h,
              ),
              SvgPicture.asset(
                AppImages.words,
                width: 25.w,
                height: 25.h,
              ),
              SvgPicture.asset(
                AppImages.add,
                width: 25.w,
                height: 25.h,
              ),
              SvgPicture.asset(
                AppImages.quiz,
                width: 25.w,
                height: 25.h,
              ),
              SvgPicture.asset(
                AppImages.chat,
                width: 25.w,
                height: 25.h,
              ),
            ],
            color: AppColors.cF3F3F3,
            buttonBackgroundColor: AppColors.cF3F3F3,
            backgroundColor: Colors.blueAccent,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 600),
            onTap: (index) {
              context.read<TabBoxCubit>().changeIndex(index);
              //_showExplanation(index);
            },
            letIndexChange: (index) => true,
          );
        },
      ),
    );
  }
}
