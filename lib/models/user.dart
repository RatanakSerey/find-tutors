class User {
  final String userId;
  final String username;
  final String email;
  User({this.userId, this.username, this.email});

  factory User.fromMap(Map map) {
    return User(
      userId: map['userId'],
      email: map['email'],
      username: map['username'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'username': username,
      'email': email,
    };
  }
}
