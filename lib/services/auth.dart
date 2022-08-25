import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ontari_app/config/themes/app_color.dart';

import '../constants/assets_path.dart';

abstract class AuthBase {
  User? get currentUser;
  Stream<User?> authStateChanges();
  Future<User> signInWithGoogle();
  Future<User> signInWithFacebook();
  Future<User> createUserWithEmailAndPassword(String email, String password);
  Future<User> signInWithEmailAndPassword(String email, String password);
  //Future<void> verifyPhoneNumber(BuildContext context, Function setData);
  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  // @override
  // Future<void> verifyPhoneNumber(BuildContext context, Function setData) async {
  //   await _firebaseAuth.verifyPhoneNumber(
  //     phoneNumber: '+84789862417',
  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       showSnackBar(
  //         context,
  //         "Verification Completed",
  //         Image.asset(AssetPath.iconChecked, color: DarkTheme.green),
  //       );
  //     },
  //     verificationFailed: (FirebaseAuthException e) {
  //       showSnackBar(
  //         context,
  //         e.code,
  //         Image.asset(AssetPath.iconClose, color: DarkTheme.red),
  //       );
  //     },
  //     codeSent: (String verificationId, int? resendToken) async {
  //       // String smsCode = 'xxxx';
  //       // PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //       //     verificationId: verificationId, smsCode: smsCode);
  //       setData(verificationId);

  //       showSnackBar(
  //         context,
  //         "Verification code sent on the phone number",
  //         Image.asset(AssetPath.iconEmail, color: DarkTheme.yellow),
  //       );
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {
  //       showSnackBar(
  //         context,
  //         "Time out",
  //         Image.asset(AssetPath.iconTime),
  //       );
  //     },
  //   );
  // }

  // void showSnackBar(BuildContext context, String text, Image image) {
  //   final snackBar = SnackBar(
  //     content: ListTile(
  //       trailing: image,
  //       title: Text(text),
  //     ),
  //   );
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }

  @override
  Future<User> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null) {
        final userCredential = await _firebaseAuth
            .signInWithCredential(GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        ));
        return userCredential.user!;
      } else {
        throw FirebaseAuthException(
          code: 'ERROR_MISSING_GOOGLE_ID_TOKEN',
          message: 'Missing Google ID Token',
        );
      }
    } else {
      throw FirebaseAuthException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }
  }

  @override
  Future<User> signInWithFacebook() async {
    final fb = FacebookLogin();
    final response = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);
    switch (response.status) {
      case FacebookLoginStatus.success:
        final accessToken = response.accessToken!;
        final userCredential = await _firebaseAuth.signInWithCredential(
          FacebookAuthProvider.credential(accessToken.token),
        );
        return userCredential.user!;
      case FacebookLoginStatus.cancel:
        throw FirebaseAuthException(
          code: 'ERROR_ABORTED_BY_USER',
          message: 'Sign in aborted by user',
        );
      case FacebookLoginStatus.error:
        throw FirebaseAuthException(
          code: 'ERROR_FACEBOOK_LOGIN_FAILED',
          message: response.error!.developerMessage,
        );
      default:
        throw UnimplementedError();
    }
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithCredential(
      EmailAuthProvider.credential(email: email, password: password),
    );
    return userCredential.user!;
  }

  @override
  Future<User> createUserWithEmailAndPassword(
      String email, String password) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user!;
  }

  @override
  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    final facebookLogin = FacebookLogin();
    await facebookLogin.logOut();
    await _firebaseAuth.signOut();
  }
}
