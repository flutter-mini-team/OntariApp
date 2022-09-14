class User {
  final String email;
  final String password;

  User({
    this.email = '',
    this.password = '',
  });

  User copyWith({
    String? email,
    String? password,
  }) {
    return User(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
