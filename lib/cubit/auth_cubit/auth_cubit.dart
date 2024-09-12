import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/forms_status.dart';
import '../../data/model/network_response.dart';
import '../../data/repository/auth/auth_repository.dart';
import '../../services/services_locator.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.initialValue());
  late List<ConnectivityResult> connectivityResult;

  Future<void> register({
    required String email,
    required String password,
    required String name,
  }) async {
    connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      emit(state.copyWith(
          status: FormsStatus.error, errorMessage: "no_internet_connection"));
    } else {
      emit(
        state.copyWith(
          status: FormsStatus.loading,
        ),
      );
      NetworkResponse response =
          await getIt<AuthRepository>().registerWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );
      if (response.errorMessage.isEmpty) {
        emit(
          state.copyWith(
            status: FormsStatus.success,
            user: response.data as User?,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: FormsStatus.error,
            errorMessage: response.errorMessage,
          ),
        );
      }
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      emit(state.copyWith(
          status: FormsStatus.error, errorMessage: "no_internet_connection"));
    } else {
      emit(
        state.copyWith(
          status: FormsStatus.loading,
        ),
      );
      NetworkResponse response =
          await getIt<AuthRepository>().signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (response.errorMessage.isEmpty) {
        emit(
          state.copyWith(
            status: FormsStatus.success,
            user: response.data as User?,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: FormsStatus.error,
            errorMessage: response.errorMessage,
          ),
        );
      }
    }
  }

  void initialState() {
    emit(AuthState.initialValue());
  }
}
