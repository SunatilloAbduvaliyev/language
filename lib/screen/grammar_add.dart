import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:english/data/model/grammar/grammaer_local_data.dart';
import 'package:english/utils/style/app_text_style.dart';
import 'package:flutter/material.dart';


class GrammarAddScreen extends StatelessWidget {
  const GrammarAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: grammarLocal.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            title: Text(
              grammarLocal[index].subjectName,
              style: AppTextStyle.semiBold,
            ),
            onTap: ()async{
              DocumentReference docId = await FirebaseFirestore.instance
                  .collection('grammar').add(grammarLocal[index].toJson());
              await FirebaseFirestore.instance
                  .collection('grammar')
                  .doc(docId.id)
                  .update({"doc_id":docId.id});
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("addd"),duration: Duration(milliseconds: 200),)
              );
            },
          );
        },
      ),
    );
  }
}
