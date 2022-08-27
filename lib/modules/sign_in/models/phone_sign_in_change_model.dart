import 'package:flutter/cupertino.dart';
import 'package:ontari_app/services/auth.dart';

import 'validators.dart';

class PhoneSignInChangeModel with GeneralValidator, ChangeNotifier {
  PhoneSignInChangeModel({
    required this.auth,
    this.phone = '',
    this.smsCode = '',
    this.verificationId = '',
  });
  final AuthBase auth;
  String phone;
  String smsCode;
  String verificationId;

  Future<void> submitSignIn() async {
    try {
      await auth.signInWithPhoneNumber(verificationId, smsCode);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> verifyPhoneNumber(BuildContext context) async {
    try {
      await auth.verifyPhoneNumber(context, phone, updateVerificationId);
    } catch (e) {
      rethrow;
    }
  }

  bool get canSend {
    return phoneValidator.isValid(phone);
  }

  void updatePhone(String phone) => updateWith(phone: phone);

  void updateSmsCode(String smsCode) => updateWith(smsCode: smsCode);

  void updateVerificationId(String verificationId) =>
      updateWith(verificationId: verificationId);

  void updateWith({
    String? phone,
    String? smsCode,
    String? verificationId,
  }) {
    this.phone = phone ?? this.phone;
    this.smsCode = smsCode ?? this.smsCode;
    this.verificationId = verificationId ?? this.verificationId;
    notifyListeners();
  }
}
