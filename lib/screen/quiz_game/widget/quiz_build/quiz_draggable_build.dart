import 'package:english/utils/color/app_colors.dart';
import 'package:english/utils/extension/extension.dart';
import 'package:english/utils/style/app_text_style.dart';
import 'package:flutter/material.dart';

class QuizDraggableBuild extends StatefulWidget {
  const QuizDraggableBuild({super.key});

  @override
  State<QuizDraggableBuild> createState() => _QuizDraggableBuildState();
}

class _QuizDraggableBuildState extends State<QuizDraggableBuild> {
  List<String> sentenceWords = [
    'Flutter',
    'is',
    'awesome',
    'and',
    'very',
    'good'
  ];
  List<String?> targetWords = [
    null,
    null,
    null,
    null,
    null,
    null
  ]; // To store dropped words
  List<String> draggableWords = [
    'awesome',
    'Flutter',
    'is',
    'and',
    'very',
    'good'
  ]; // Shuffled words
  List<bool> isCorrect = [
    true,
    true,
    true,
    true,
    true,
    true
  ]; // To track if each word is correct

  Widget buildDraggableContainer({
    required String word,
    required Color color,
    required bool isDragging,
  }) {
    final textStyle = AppTextStyle.bold.copyWith(
      fontSize: 18.w,
      color: Colors.white,
    );
    final textWidth = (TextPainter(
      text: TextSpan(text: word, style: textStyle),
      textDirection: TextDirection.ltr,
    )..layout())
        .size
        .width;

    return Container(
      margin: const EdgeInsets.all(8),
      width: textWidth + 20,
      // Dynamic width based on text size
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: Text(
            word,
            style: textStyle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        width.boxW(),
        20.boxH(),
        Text(
          'Sudrab gapni to\'ldiring:',
          style: AppTextStyle.bold.copyWith(
            fontSize: 20,
          ),
        ),
        20.boxH(),
        Wrap(
          children: List.generate(
            sentenceWords.length,
            (index) {
              return DragTarget<String>(
                onWillAccept: (receivedWord) => targetWords[index] == null,
                onAccept: (receivedWord) {
                  setState(
                    () {
                      targetWords[index] =
                          receivedWord; // Store the dragged word
                      draggableWords
                          .remove(receivedWord); // Remove from draggable words
                      isCorrect[index] = receivedWord ==
                          sentenceWords[index]; // Check correctness
                    },
                  );
                },
                builder: (context, accepted, rejected) {
                  final textWidth = (TextPainter(
                    text: TextSpan(
                      text: targetWords[index],
                      style: AppTextStyle.bold.copyWith(
                        fontSize: 18.w,
                      ),
                    ),
                    textDirection: TextDirection.ltr,
                  )..layout())
                      .size
                      .width;
                  return Container(
                    margin:  EdgeInsets.all(5.h),
                    width: targetWords[index] == null ? 100 : textWidth + 20,
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: targetWords[index] != null
                          ? (isCorrect[index]
                              ? Colors.greenAccent
                              : Colors.redAccent)
                          : Colors.white,
                      border: Border.all(color: Colors.blueAccent, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        targetWords[index] ?? '_____',
                        style: AppTextStyle.bold.copyWith(
                          fontSize: 18.w,
                          color: targetWords[index] == null
                              ? AppColors.c000000
                              : Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        40.boxH(),
        Text(
          'So\'zlarni pastdan torting:',
          style: AppTextStyle.bold.copyWith(
            fontSize: 20,
          ),
        ),
        20.boxH(),
        Wrap(
          children: draggableWords.map((word) {
            return Draggable<String>(
              data: word,
              feedback: buildDraggableContainer(
                word: word,
                color: Colors.blueAccent.withOpacity(0.7),
                isDragging: true,
              ),
              childWhenDragging: buildDraggableContainer(
                word: word,
                color: Colors.grey.shade300,
                isDragging: true,
              ),
              child: buildDraggableContainer(
                word: word,
                color: Colors.blueAccent,
                isDragging: false,
              ),
            );
          }).toList(),
        ),
        40.boxH(),
        ElevatedButton(
          onPressed: () {
            // Check the sentence correctness
            bool isAllCorrect = true;
            for (int i = 0; i < sentenceWords.length; i++) {
              if (sentenceWords[i] != targetWords[i]) {
                isCorrect[i] = false;
                isAllCorrect = false;
                draggableWords.add(targetWords[
                    i]!); // Add incorrect word back to draggable list
                targetWords[i] =
                    null; // Clear the incorrect word from the target
              } else {
                isCorrect[i] = true;
              }
            }

            setState(() {});

            // Show result
            if (isAllCorrect) {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Natija'),
                  content: const Text('To\'g\'ri!'),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            } else {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Natija'),
                  content: const Text(
                    'Xato! Qayta urinib ko\'ring. Xato so\'zlar qizil bilan belgilandi va qaytarildi.',
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            }
          },
          child: const Text('Tekshirish'),
        ),
      ],
    );
  }
}
