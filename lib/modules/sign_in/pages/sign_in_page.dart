import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ontari_app/config/themes/app_color.dart';
import 'package:ontari_app/config/themes/text_style.dart';
import 'package:ontari_app/constants/assets_path.dart';
import 'package:ontari_app/widgets/stateless/common_avatar.dart';
import 'package:ontari_app/widgets/stateless/common_button.dart';
import 'package:ontari_app/widgets/stateless/common_textfield.dart';
import 'package:ontari_app/widgets/stateless/indicator_home.dart';




class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: DarkTheme.greyScale900,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 35.0),
                child: Text('Ontari.', style: TxtStyle.titleSplash),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: CustomTextField(
                  height: 52,
                  title: 'Email address',
                  hintText: 'Enter your email address',
                  keyboardType: TextInputType.emailAddress,
                  childPrefixIcon: CustomAvatar(
                    width: 15,
                    height: 12,
                    assetName: AssetPath.iconEmail,
                  ),
                ),
              ),
              TextFieldPassword(
                size: size,
                title: 'Password',
                hintText: 'Enter your password',
                assetPrefixIcon: AssetPath.iconLock,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    print('aaaa');
                  },
                  child: const Text(
                    'Forgot password?',
                    style: TxtStyle.headline4blue,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ClassicButton(
                  width: size.width,
                  radius: 12,
                  widthRadius: 0,
                  colorRadius: DarkTheme.primaryBlue600,
                  height: 52,
                  color: DarkTheme.primaryBlue600,
                  child: const Center(child: Text('Sign in')),
                ),
              ),
              const Text(
                'Or continue with social account',
                style: TxtStyle.headline5MediumWhite,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 16),
                child: ClassicButton(
                  onTap: () => print('Size: ${size}'),
                  width: size.width,
                  widthRadius: 0,
                  radius: 12,
                  height: 52,
                  color: DarkTheme.primaryBlueButton900,
                  colorRadius: DarkTheme.primaryBlueButton900,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssetPath.iconGoogle,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text('Sign In with Google'),
                      ),
                    ],
                  ),
                ),
              ),
              ClassicButton(
                onTap: () => print('Size: ${size}'),
                width: size.width,
                widthRadius: 0,
                radius: 12,
                height: 52,
                color: DarkTheme.primaryBlueButton900,
                colorRadius: DarkTheme.primaryBlueButton900,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AssetPath.iconFacebook,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text('Sign In with Facebook'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 53.0),
                child: RichText(
                  text: const TextSpan(
                    text: 'Don\'t have an account? ',
                    style: TxtStyle.Term,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Create Here',
                        style: TxtStyle.create,
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(100, 20, 100, 0),
                child: IndicatorHome(
                  color: DarkTheme.white,
                  radius: 10,
                  height: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
