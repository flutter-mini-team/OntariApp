import 'package:ontari_app/modules/authentication/wrapper/models/email_password.dart';

class Register {
  final UserModel? data;

  Register({this.data});

  Map<String, dynamic> toJson() {
    final val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('email', data?.email);
    writeNotNull('password', data?.password);

    return val;
  }
}
