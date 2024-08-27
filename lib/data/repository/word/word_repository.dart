import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english/data/model/network_response.dart';
import 'package:english/data/model/word/word_model.dart';

class WordRepository {
  Future<NetworkResponse> fetchWords() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('word').get();
      List<WordModel> listWord = querySnapshot.docs
          .map(
            (e) => WordModel.fromJson(
              e.data() as Map<String, dynamic>,
            ),
          )
          .toList();
      return NetworkResponse(
        data: listWord,
      );
    } catch (error) {
      return NetworkResponse(
        errorMessage: error.toString(),
      );
    }
  }
}
