import 'package:english/data/model/user/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserEvent {}

class InsertUserEvent extends UserEvent with EquatableMixin {
  final UserModel insertUserData;

  InsertUserEvent({required this.insertUserData});

  @override
  List<Object?> get props => [
        insertUserData,
      ];
}

class FetchUserData extends UserEvent with EquatableMixin {
  final String userDocId;

  FetchUserData({
    required this.userDocId,
  });

  @override
  List<Object?> get props => [
        userDocId,
      ];
}

class FetchAllUserData extends UserEvent {}
