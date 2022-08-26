import 'package:flutter/cupertino.dart';
import 'package:ontari_app/services/auth.dart';

import 'validators.dart';

class PhoneSignInChangeModel with GeneralValidator, ChangeNotifier {
  PhoneSignInChangeModel({
    required this.auth,
    this.phone = '',
  });
  final AuthBase auth;
  String phone;

  // Future<void> submitSignIn() async {
  //   try {
  //     await auth.signInWithEmailAndPassword(email, password);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  bool get canSubmit {
    return emailValidator.isValid(phone);
  }

  void updatePhone(String phone) => updateWith(phone: phone);

  void updateWith({
    String? phone,
  }) {
    this.phone = phone ?? this.phone;
    notifyListeners();
  }
}
