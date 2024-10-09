import 'package:english/data/model/user/user_quiz/user_quiz.dart';

import '../word/word_model.dart';

class UserModel {
  final String uid;
  final String firstName;
  final String lastName;
  final List<WordModel> words;
  final List<WordModel> favouriteWords;
  final String fcmToken;
  final String email;
  final Map<String, String> checkLike;
  final int learningEnglishIndex;
  final List<UserQuiz> userQuiz;

  UserModel({
    required this.userQuiz,
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.words,
    required this.fcmToken,
    required this.email,
    required this.favouriteWords,
    required this.checkLike,
    required this.learningEnglishIndex,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userQuiz: (json['user_quiz'] as List?)
              ?.map((e) => UserQuiz.fromJson(e))
              .toList() ??
          [],
      learningEnglishIndex: json['learning_english_index'] as int? ?? 0,
      uid: json['uid'] as String? ?? '',
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      words: (json['words'] as List?)
              ?.map((element) => WordModel.fromJson(element))
              .toList() ??
          [],
      favouriteWords: (json['favourite_words'] as List?)
              ?.map((element) => WordModel.fromJson(element))
              .toList() ??
          [],
      fcmToken: json['fcm_token'] as String? ?? '',
      email: json['email'] as String? ?? '',
      checkLike: (json['check_like'] as Map<String, dynamic>?)
              ?.map((key, value) => MapEntry(key, value as String)) ??
          {},
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'first_name': firstName,
        'last_name': lastName,
        'words': words.map((element) => element.toJson()).toList(),
        'favourite_words':
            favouriteWords.map((element) => element.toJson()).toList(),
        'fcm_token': fcmToken,
        'email': email,
        'check_like': checkLike,
        'learning_english_index': 0,
        'user_quiz': userQuiz.map((e) => e.toJson()).toList(),
      };

  Map<String, dynamic> toUpdateJson() => {
        'first_name': firstName,
        'last_name': lastName,
        'words': words.map((element) => element.toJson()).toList(),
        'favourite_words':
            favouriteWords.map((element) => element.toJson()).toList(),
        'fcm_token': fcmToken,
        'email': email,
        'check_like': checkLike,
        'learning_english_index': 0,
        'user_quiz': userQuiz.map((e) => e.toJson()).toList(),
      };

  UserModel copyWith({
    String? uid,
    String? firstName,
    String? lastName,
    List<WordModel>? words,
    List<WordModel>? favouriteWords,
    String? fcmToken,
    String? email,
    Map<String, String>? checkLike,
    int? learningEnglishIndex,
    List<UserQuiz>? userQuiz,
  }) {
    return UserModel(
      learningEnglishIndex: learningEnglishIndex ?? this.learningEnglishIndex,
      uid: uid ?? this.uid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      words: words ?? this.words,
      fcmToken: fcmToken ?? this.fcmToken,
      email: email ?? this.email,
      favouriteWords: favouriteWords ?? this.favouriteWords,
      checkLike: checkLike ?? this.checkLike,
      userQuiz: userQuiz ?? this.userQuiz,
    );
  }

  static UserModel initialValue() => UserModel(
        learningEnglishIndex: 0,
        uid: '',
        firstName: '',
        lastName: '',
        words: [],
        fcmToken: '',
        email: '',
        favouriteWords: [],
        checkLike: {"learning_english_word": 'kkkkk'},
        userQuiz: [],
      );
}
