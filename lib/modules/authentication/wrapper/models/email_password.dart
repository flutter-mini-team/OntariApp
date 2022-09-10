class UserModel {
  UserModel({
    this.email = '',
    this.password = '',
  });
  final String email;
  final String password;

  UserModel copyWith({
    String? email,
    String? password,
  }) {
    return UserModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
