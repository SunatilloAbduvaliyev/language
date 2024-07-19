import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../model/exception/firebase_exception.dart';
import '../../model/network_response.dart';

class AuthRepository {
  Future<NetworkResponse> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return NetworkResponse(
          errorMessage: 'no_internet_connection',
        );
      }
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user != null) {
        await user.updateDisplayName(name);
        return NetworkResponse(
          data: user,
        );
      } else {
        return NetworkResponse(
          errorMessage: "no_working_api",
        );
      }
    } on FirebaseAuthException catch (e) {
      return NetworkResponse(
        errorMessage: SignUpWithEmailAndPasswordFailure.fromCode(e.code).message,
      );
    } catch (error) {
      return NetworkResponse(
        errorMessage: error.toString(),
      );
    }
  }

  Future<NetworkResponse> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.none)) {
        return NetworkResponse(
          errorMessage: 'no_internet_connection',
        );
      }
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user != null) {
        return NetworkResponse(
          data: user,
        );
      } else {
        return NetworkResponse(
          errorMessage: "no_working_api",
        );
      }
    } on FirebaseAuthException catch (e) {
      return NetworkResponse(
        errorMessage: LogInWithEmailAndPasswordFailure.fromCode(e.code).message,
      );
    } catch (error) {
      return NetworkResponse(
        errorMessage: error.toString(),
      );
    }
  }

}