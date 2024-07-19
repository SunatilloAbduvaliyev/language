import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../utils/constants/constants.dart';
import '../../model/grammar/grammar_model.dart';
import '../../model/network_response.dart';

class GrammarRepository {
  Future<NetworkResponse> fetchAllGrammar() async {
    try {
      // Initialize Firebase
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection(AppConstants.grammarTableName)
          .get();

      List<GrammarModel> grammarData = snapshot.docs
          .map((doc) => GrammarModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      return NetworkResponse(
        data: grammarData,
      );
    } catch (error) {
      throw Exception(error);
      return NetworkResponse(
        errorMessage: error.toString(),
      );
    }
  }
}
