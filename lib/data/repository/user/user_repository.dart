import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../../../utils/constants/constants.dart';
import '../../model/main_like/main_like_model.dart';
import '../../model/network_response.dart';
import '../../model/user/user_model.dart';

class UserRepository {
  Future<NetworkResponse> insertUser({required UserModel userModel}) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('like_dislike')
          .doc('Oxh6VznzNwRT6XecYPCQ').get();
      MainLikeModel  mainLikeModel = MainLikeModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
      userModel = userModel.copyWith(
        likes: mainLikeModel.likes,
      );
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
        debugPrint('_________________________________________insert usert copywith  uid ${insertUser.uid}');
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
      debugPrint('Sending updated userModel to Firestore: ${userModel.toUpdateJson()}');

      // Firestore-da foydalanuvchini yangilash
      await FirebaseFirestore.instance
          .collection(AppConstants.userTableName)
          .doc(userModel.uid)
          .update(userModel.toUpdateJson());

      // Yangilangan foydalanuvchi ma'lumotlarini olish
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection(AppConstants.userTableName)
          .doc(userModel.uid)
          .get();

      if (documentSnapshot.exists) {
        // Ma'lumotni UserModel ga aylantirish
        UserModel updatedUserModel =
        UserModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);

        // Ma'lumotni NetworkResponse orqali qaytarish
        return NetworkResponse(
          data: updatedUserModel,
        );
      } else {
        // Agar hujjat topilmasa, xatolik xabari qaytariladi
        return NetworkResponse(
          errorMessage: "Like ma'lumotlarida xato. Iltimos yangi account oching.",
        );
      }
    } catch (error) {
      // Agar xatolik yuz bersa, xatolik xabari qaytariladi
      return NetworkResponse(errorMessage: 'Error updating like: ${error.toString()}');
    }
  }



  Future<NetworkResponse> userUpdate({required UserModel userModel}) async {
    try {
      await FirebaseFirestore.instance
          .collection(AppConstants.userTableName)
          .doc(userModel.uid)
          .update(userModel.toUpdateJson());
      return NetworkResponse(data: userModel);
    } catch (error) {
      return NetworkResponse(
        errorMessage: error.toString(),
      );
    }
  }
}

