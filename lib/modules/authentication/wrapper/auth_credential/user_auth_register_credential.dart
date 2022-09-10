import 'package:ontari_app/modules/authentication/wrapper/models/email_password.dart';
import 'package:ontari_app/modules/authentication/wrapper/models/register.dart';

import 'auth_credential.dart';

class UserAuthRegisterCredential extends AuthCredential {
  UserAuthRegisterCredential({this.user}) : super(_url);

  static const String _url = '/register';

  @override
  Map<String, dynamic> asMap() {
    return Register(data: user).toJson();
  }

  final UserModel? user;
}
