import 'package:ontari_app/providers/bloc_provider.dart';

import '../enum/login_state.dart';
import '../wrapper/models/login_data.dart';
import '../wrapper/service/auth_service.dart';

class AuthenticationBloc extends BlocBase {
  final AuthService auth;

  AuthenticationBloc(this.auth);

  Future<LoginState> _signIn(Future<LoginData?> signInMethod) async {
    try {
      final loginData = await signInMethod;
      if (loginData != null) {
        return LoginState.success;
      }
      return LoginState.fail;
    } catch (e) {
      rethrow;
    }
  }

  Future<LoginState> signInWithGmail() async {
    return _signIn(auth.loginWithGmail());
  }

  Future<LoginState> signInWithFacebook() async {
    return _signIn(auth.loginWithFacebook());
  }

  // Future<LoginState> signInWithEmailAndPassword(
  //   String email,
  //   String password,
  // ) async {
  //   return _signIn(auth.loginWithEmailAndPassword(email,password));
  // }

  @override
  void dispose() {}
}
