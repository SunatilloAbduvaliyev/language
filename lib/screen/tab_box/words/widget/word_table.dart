import 'package:english/data/model/word/word_model.dart';
import 'package:english/utils/style/app_text_style.dart';
import 'package:flutter/material.dart';

class WordTable extends StatefulWidget {
  const WordTable({
    super.key,
    required this.words,
  });

  final List<WordModel> words;

  @override
  State<WordTable> createState() => _WordTableState();
}

class _WordTableState extends State<WordTable> {
  List<bool> columnVisible = [
    true,
    true,
    true,
  ];
  late List<List<bool>> tableVisible;

  @override
  void initState() {
    super.initState();
    // `tableVisible` listi to'g'ri shaklda (ustunlar soni x qatorlar soni) yaratiladi
    tableVisible = List.generate(
      3, // qatorlar soni
          (i) => List.generate(widget.words.length, (j) => true), // ustunlar soni
    );
    debugPrint('init state table list ___________________ $tableVisible}');
  }

  @override
  Widget build(BuildContext context) {
    return  Table(
      border: TableBorder.all(),
      children: [
        TableRow(children: _buildHeaderRow()),
        ...List.generate(
          widget.words.length,
              (int index) => TableRow(
            children: [
              _buildCell(widget.words[index].english, 0, index),
              _buildCell(widget.words[index].phonetics, 1, index),
              _buildCell(widget.words[index].translateWord, 2, index),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _buildHeaderRow() {
    return [
      _buildHeader('English', 0),
      _buildHeader('Phonetic', 1),
      _buildHeader('Uzbek', 2),
    ];
  }

  Widget _buildHeader(String language, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          language,
          style: AppTextStyle.bold,
        ),
        IconButton(
          icon: Icon(
            columnVisible[index] ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              columnVisible[index] = !columnVisible[index];
              for (int i = 0; i < tableVisible[index].length; i++) {
                tableVisible[index][i] = columnVisible[index];
              }
            });
            debugPrint('bosh ustondagi eye bosilganda $tableVisible');
          },
        ),
      ],
    );
  }

  Widget _buildCell(String word, int columnIndex, int rowIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: tableVisible[columnIndex][rowIndex],
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(word, style: AppTextStyle.bold),
            ),
          ),
        ),
        Visibility(
          visible: !columnVisible[columnIndex],
          child: IconButton(
            icon: Icon(
              tableVisible[columnIndex][rowIndex]
                  ? Icons.visibility_off
                  : Icons.visibility,
            ),
            onPressed: () {
              setState(() {
                tableVisible[columnIndex][rowIndex] =
                !tableVisible[columnIndex][rowIndex];
              });
            },
          ),
        ),
      ],
    );
  }
}
