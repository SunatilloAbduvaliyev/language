import 'package:flutter/material.dart';
import '../../../data/model/example/example_model.dart';
import '../../../utils/style/app_text_style.dart';

class ExampleItem extends StatefulWidget {
  const ExampleItem({
    super.key,
    required this.exampleModel,
    required this.textColor,
  });

  final List<ExampleModel> exampleModel;
  final Color textColor;

  @override
  State<ExampleItem> createState() => _ExampleItemState();
}

class _ExampleItemState extends State<ExampleItem> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stepper(
      connectorColor: WidgetStateProperty.all(widget.textColor),
      // controlsBuilder: (BuildContext context, ControlsDetails details) {
      //   return const SizedBox
      //       .shrink(); // Bu yerda default tugmalarni o'chirib qo'yamiz
      // },
      steps: [
        ...List.generate(
          widget.exampleModel.length,
          (int index) => Step(
            title: Text(
              widget.exampleModel[index].example,
              style: AppTextStyle.bold.copyWith(color: widget.textColor),
            ),
            content: Align(
              alignment: Alignment.topRight,
              child: Text(
                widget.exampleModel[index].exampleExplanation,
                style: AppTextStyle.medium.copyWith(color: widget.textColor),
              ),
            ),
          ),
        ),
      ],
      onStepTapped: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
      currentStep: _currentIndex,
      onStepContinue: () {
        if (_currentIndex != widget.exampleModel.length - 1) {
          setState(() {
            _currentIndex++;
          });
        }
      },
      onStepCancel: () {
        if (_currentIndex != 0) {
          setState(() {
            _currentIndex--;
          });
        }
      },
    );
  }
}
