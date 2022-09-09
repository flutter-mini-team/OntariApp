import '../../../../utils/validators.dart';

class EmailSignInModel with EmailAndPasswordValidator {
  EmailSignInModel({
    this.email = '',
    this.password = '',
  });
  final String email;
  final String password;

  // bool get canSubmit {
  //   return emailValidator.isValid(email) &&
  //       passwordValidator.isValid(password) &&
  //       !isLoading;
  // }

  // String? get passwordErrorText {
  //   bool showErrorText = submitted && !passwordValidator.isValid(password);
  //   return showErrorText ? invalidPasswordErrorText : null;
  // }

  // String? get emailErrorText {
  //   bool showErrorText = submitted && !emailValidator.isValid(email);
  //   return showErrorText ? invalidEmailErrorText : null;
  // }

  EmailSignInModel copyWith({
    String? email,
    String? password,
  }) {
    return EmailSignInModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
