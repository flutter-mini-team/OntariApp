import '../models/login_data.dart';

abstract class AuthService {
  Future<LoginData?> loginWithGmail();
  Future<LoginData?> loginWithFacebook();
  //Future<LoginData?> loginWithEmailAndPassword(RegisterUser user);
}
