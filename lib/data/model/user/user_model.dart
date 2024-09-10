import '../word/word_model.dart';
import 'like_dislike/like_dislike_model.dart';

class UserModel {
  final String uid;
  final String firstName;
  final String lastName;
  final List<WordModel> words;
  final List<WordModel> favouriteWords;
  final String fcmToken;
  final List<LikeDislikeModel> likes;
  final String email;
  final Map<String, String> checkLike;

  UserModel({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.words,
    required this.fcmToken,
    required this.likes,
    required this.email,
    required this.favouriteWords,
    required this.checkLike,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
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
    likes: (json['likes'] as List?)?.map((e)=>LikeDislikeModel.fromJson(e)).toList() ?? [],
      email: json['email'] as String? ?? '',
      checkLike: (json['check_like'] as Map<String, dynamic>?)?.map(
              (key, value) => MapEntry(key, value as String)) ?? {},
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'uid': uid,
        'first_name': firstName,
        'last_name': lastName,
        'words': words.map((element) => element.toJson()).toList(),
        'favourite_words':favouriteWords.map((element) => element.toJson()).toList(),
        'fcm_token': fcmToken,
        'likes':likes.map((element) => element.toJson()).toList(),
        'email':email,
        'check_like':checkLike,
      };
  Map<String, dynamic> toUpdateJson() =>
      {
        'first_name': firstName,
        'last_name': lastName,
        'words': words.map((element) => element.toJson()).toList(),
        'favourite_words':favouriteWords.map((element) => element.toJson()).toList(),
        'fcm_token': fcmToken,
        'likes':likes.map((element) => element.toJson()).toList(),
        'email':email,
        'check_like':checkLike,
      };

  UserModel copyWith({
    String? uid,
    String? firstName,
    String? lastName,
    List<WordModel>? words,
    List<WordModel>? favouriteWords,
    String? fcmToken,
    List<LikeDislikeModel>? likes,
    String? email,
    Map<String, String>? checkLike,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      words: words ?? this.words,
      fcmToken: fcmToken ?? this.fcmToken,
      likes: likes ?? this.likes,
      email: email ?? this.email,
      favouriteWords: favouriteWords ?? this.favouriteWords,
      checkLike: checkLike ?? this.checkLike,
    );
  }

  static UserModel initialValue() =>
      UserModel(
        uid: '',
        firstName: '',
        lastName: '',
        words: [],
        fcmToken: '',
        likes: [],
        email: '',
        favouriteWords: [],
        checkLike: {"learning_english_word":'kkkkk'},
      );
}
