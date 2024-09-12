import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/images/app_images.dart';

class WordGameScreen extends StatefulWidget {
  const WordGameScreen({super.key});

  @override
  State<WordGameScreen> createState() => _WordGameScreenState();
}

class _WordGameScreenState extends State<WordGameScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              AppImages.wordBackground,
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}
