import 'package:flutter/cupertino.dart';
import 'package:ontari_app/services/auth.dart';

import 'validators.dart';

class EmailSignInChangeModel with GeneralValidator, ChangeNotifier {
  EmailSignInChangeModel({
    required this.auth,
    this.email = '',
    this.password = '',
  });
  final AuthBase auth;
  String email;
  String password;

  Future<void> submitSignIn() async {
    try {
      await auth.signInWithEmailAndPassword(email, password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> submitSignUp() async {
    try {
      await auth.createUserWithEmailAndPassword(email, password);
    } catch (e) {
      rethrow;
    }
  }

  bool get canSubmit {
    return emailValidator.isValid(email) && passwordValidator.isValid(password);
  }

  void updateEmail(String email) => updateWith(email: email);
  void updatePassword(String password) => updateWith(password: password);

  void updateWith({
    String? email,
    String? password,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;

    notifyListeners();
  }
}
