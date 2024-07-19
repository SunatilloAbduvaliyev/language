import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../../../utils/constants/constants.dart';
import '../../model/network_response.dart';
import '../../model/user/user_model.dart';

class UserRepository {
  Future<NetworkResponse> insertUser({required UserModel userModel}) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // User ma'lumotlarini UID bilan saqlash
        await FirebaseFirestore.instance
            .collection(AppConstants.userTableName)
            .doc(user.uid)
            .set(userModel.toJson());

        // DocID ni yangilash
        await FirebaseFirestore.instance
            .collection(AppConstants.userTableName)
            .doc(user.uid)
            .update({"uid": user.uid});

        // Yangilangan UserModel yaratish
        UserModel insertUser = userModel.copyWith(uid: user.uid);
        debugPrint('_________________________________________insert usert copywith ${insertUser.toString()}');
        return NetworkResponse(
          data: insertUser,
        );
      } else {
        return NetworkResponse(
          errorMessage: "Foydalanuvchi avtorizatsiyadan o'tmagan",
        );
      }
    } catch (error) {
      return NetworkResponse(
        errorMessage: error.toString(),
      );
    }
  }

  Future<NetworkResponse> fetchAllUsers() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection(AppConstants.userTableName)
          .get();

      List<UserModel> users = snapshot.docs
          .map((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      return NetworkResponse(
        data: users,
      );
    } catch (error) {
      return NetworkResponse(
        errorMessage: error.toString(),
      );
    }
  }

  Future<NetworkResponse> fetchDocIdUser({required String docId}) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection(AppConstants.userTableName)
          .doc(docId)
          .get();

      if (documentSnapshot.exists) {
        UserModel userModel = UserModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
        return NetworkResponse(
          data: userModel,
        );
      } else {
        return NetworkResponse(
          errorMessage: "Foydalanuvchi topilmadi",
        );
      }
    } catch (error) {
      return NetworkResponse(
        errorMessage: error.toString(),
      );
    }
  }
  Future<NetworkResponse> likeUpdate({required UserModel userModel}) async {
    try {
      // UserModel JSON'ini chop etish
      debugPrint('Sending updated userModel to Firestore: ${userModel.toUpdateJson()}');

      await FirebaseFirestore.instance
          .collection(AppConstants.userTableName)
          .doc(userModel.uid)
          .update(userModel.toUpdateJson());

      return NetworkResponse(data: userModel);
    } catch (error) {
      throw Exception(error);
      return NetworkResponse(errorMessage: error.toString());
    }
  }
}

