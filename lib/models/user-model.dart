class User {
  int userID;
  String username;
  String about;

  User({this.userID, this.username, this.about});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        userID: json['user_id'] as int,
        username: json['username'] as String,
        about: json['about'] as String);
  }

  Map<String, dynamic> toJson() =>
      {'user_id': userID, 'username': username, 'about': about};
}
