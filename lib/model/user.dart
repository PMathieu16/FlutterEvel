import 'dart:convert';

class User {
  int? userId;
  String? userName;
  String? userPassword;

  User({
    this.userId,
    this.userName,
    this.userPassword,
  });

  User copyWith({
    int? userId,
    String? userName,
    String? userPassword,
  }) {
    return User(
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userPassword: userPassword ?? this.userPassword,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (userId != null) {
      result.addAll({'userId': userId});
    }
    if (userName != null) {
      result.addAll({'userName': userName});
    }
    if (userPassword != null) {
      result.addAll({'userPassword': userPassword});
    }

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['userId']?.toInt(),
      userName: map['userName'],
      userPassword: map['userPassword'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(userId: $userId, userName: $userName, userPassword: $userPassword)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.userId == userId && other.userName == userName && other.userPassword == userPassword;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ userName.hashCode ^ userPassword.hashCode;
  }
}
