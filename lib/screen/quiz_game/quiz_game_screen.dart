import 'package:flutter/material.dart';

void showQuizBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return QuizBottomSheet();
    },
  );
}

class QuizBottomSheet extends StatefulWidget {
  @override
  _QuizBottomSheetState createState() => _QuizBottomSheetState();
}

class _QuizBottomSheetState extends State<QuizBottomSheet> {
  String? _selectedOption; // Tanlangan variantni saqlash uchun

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'What is the meaning of UI UX Design?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          QuizOption(
            optionText: 'A. User Interface and User Experience',
            value: 'A',
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value;
              });
            },
          ),
          QuizOption(
            optionText: 'B. User Introface and User Experience',
            value: 'B',
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value;
              });
            },
          ),
          QuizOption(
            optionText: 'C. User Interface and Using Experience',
            value: 'C',
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value;
              });
            },
          ),
          QuizOption(
            optionText: 'D. User Interface and User Experience',
            value: 'D',
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value;
              });
            },
          ),
          QuizOption(
            optionText: 'E. Using Interface and Using Experience',
            value: 'E',
            groupValue: _selectedOption,
            onChanged: (value) {
              setState(() {
                _selectedOption = value;
              });
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // BottomSheetni yopish
            },
            child: Text('Submit Quiz'),
          ),
        ],
      ),
    );
  }
}

class QuizOption extends StatelessWidget {
  final String optionText;
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  const QuizOption({
    super.key,
    required this.optionText,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(optionText),
      leading: Radio<String>(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }
}