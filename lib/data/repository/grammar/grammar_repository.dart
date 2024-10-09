import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english/data/model/basic_grammar/basic_grammar_model.dart';
import '../../../utils/constants/constants.dart';
import '../../model/network_response.dart';

class GrammarRepository {
  Future<NetworkResponse> fetchAllGrammar() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection(AppConstants.grammarTableName)
          .get();

      List<BasicGrammarModel> grammarData = snapshot.docs
          .map((doc) => BasicGrammarModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      grammarData.sort((a,b)=>a.sortId.compareTo(b.sortId));
      return NetworkResponse(
        data: grammarData,
      );
    } catch (error) {
      return NetworkResponse(
        errorMessage: error.toString(),
      );
    }
  }

}
