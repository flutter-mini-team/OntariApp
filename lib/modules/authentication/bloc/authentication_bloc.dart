// import 'package:ontari_app/providers/bloc_provider.dart';

// import '../enum/login_state.dart';
// import '../wrapper/models/login_data.dart';

// class AuthenticationBloc extends BlocBase {
//   final AuthService auth;

//   AuthenticationBloc(this.auth);

//   Future<LoginState> _signIn(Future<LoginData?> signInMethod) async {
//     try {
//       final loginData = await signInMethod;
//       if (loginData != null) {
//         return LoginState.success;
//       }
//       return LoginState.fail;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<LoginState> loginWithGmail() async {
//     return _signIn(auth.loginWithGmail());
//   }

//   @override
//   void dispose() {}
// }
