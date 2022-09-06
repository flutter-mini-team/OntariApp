import '../models/login_data.dart';

abstract class AuthService {
  Future<LoginData?> loginWithGmail();
  Future<LoginData?> loginWithFacebook();
  // Future<LoginData?> loginWithEmailAndPass(RegisterUser user);
//  Future<LoginData>loginWithPhone(String phone,String pwd);
}
