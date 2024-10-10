import 'package:flutter/material.dart';

class QuizGameScreen extends StatefulWidget {
  const QuizGameScreen({super.key});

  @override
  _QuizGameScreenState createState() => _QuizGameScreenState();
}

class _QuizGameScreenState extends State<QuizGameScreen> {
  int? selectedOptionIndex; // Bu tanlangan variantni saqlash uchun

  void selectOption(int index) {
    setState(() {
      selectedOptionIndex = index; // Tanlangan variantni yangilash
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress bar
              LinearProgressIndicator(
                value: 0.7,  // Example: 70% to'ldirilgan
                backgroundColor: Colors.grey[800],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
              ),
              SizedBox(height: 30),

              // Savol containeri
              Container(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blueAccent.withOpacity(0.7), Colors.purpleAccent.withOpacity(0.7)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.3),
                      blurRadius: 30,
                      spreadRadius: 5,
                      offset: Offset(15, 10),
                    ),
                  ],
                  border: Border.all(color: Colors.white.withOpacity(0.7), width: 2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Savol:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Bu yerda savol bo‘ladi. Masalan: Flutter nima?',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              // Javob variantlari
              Column(
                children: [
                  OptionButton(
                    optionText: "A variant: To'g'ri",
                    gradientColors: [Colors.greenAccent, Colors.teal],
                    isSelected: selectedOptionIndex == 0, // Tanlangan holatni tekshirish
                    onTap: () => selectOption(0),
                  ),
                  OptionButton(
                    optionText: "B variant: Noto'g'ri",
                    gradientColors: [Colors.redAccent, Colors.pinkAccent],
                    isSelected: selectedOptionIndex == 1,
                    onTap: () => selectOption(1),
                  ),
                  OptionButton(
                    optionText: "C variant: Noto'g'ri",
                    gradientColors: [Colors.orangeAccent, Colors.deepOrange],
                    isSelected: selectedOptionIndex == 2,
                    onTap: () => selectOption(2),
                  ),
                  OptionButton(
                    optionText: "D variant: Noto'g'ri",
                    gradientColors: [Colors.purpleAccent, Colors.deepPurple],
                    isSelected: selectedOptionIndex == 3,
                    onTap: () => selectOption(3),
                  ),
                ],
              ),
              Spacer(),

              // Keyingi tugmasi
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,  // Tugma rangi
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  // Keyingi savolga o'tish logikasi
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Keyingi',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Option Button Widget
class OptionButton extends StatelessWidget {
  final String optionText;
  final List<Color> gradientColors;
  final bool isSelected;
  final VoidCallback onTap;

  OptionButton({
    required this.optionText,
    required this.gradientColors,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isSelected ? [Colors.lightGreen, Colors.green] : gradientColors,  // Tanlanganida rang o'zgarishi
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: isSelected ? Colors.greenAccent : Colors.blueAccent,
              width: 2,
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  optionText,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (isSelected)
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ), // Tanlangan variantda check iconi qo'shish
              ],
            ),
          ),
        ),
      ),
    );
  }
}
