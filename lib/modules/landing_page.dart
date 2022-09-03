import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ontari_app/config/themes/app_color.dart';
import 'package:ontari_app/modules/root_page.dart';
import 'package:provider/provider.dart';

import 'authentication/pages/sign_in_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User?>(
      //stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          if (user == null) {
            return SignInPage();
          }
          return const RootPage();
        }
        return const Scaffold(
          backgroundColor: DarkTheme.greyScale900,
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
