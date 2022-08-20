import 'package:flutter/material.dart';
import 'package:ontari_app/config/themes/app_color.dart';
import 'package:ontari_app/config/themes/text_style.dart';
import 'package:ontari_app/constants/assets_path.dart';
import 'package:ontari_app/modules/sign_in/pages/verify_your_page.dart';
import 'package:ontari_app/widgets/stateless/common_avatar.dart';
import 'package:ontari_app/widgets/stateless/common_button.dart';
import 'package:ontari_app/widgets/stateless/common_textfield.dart';
import 'package:ontari_app/widgets/stateless/terms.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  TextFieldEmail buildTextFieldEmail() {
    return TextFieldEmail(
      emailController: _emailController,
      emailFocusNode: _emailFocusNode,
      //onChanged: ,
      //onEditingComplete: ,
      childPrefixIcon: const CustomAvatar(
        width: 15,
        height: 12,
        assetName: AssetPath.iconEmail,
      ),
    );
  }

  TextFieldPassword buildTextFieldPassword() {
    return TextFieldPassword(
      assetPrefixIcon: AssetPath.iconLock,
      passwordController: _passwordController,
      passwordFocusNode: _passwordFocusNode,
      //onChanged: ,
      //onEditingComplete: ,
    );
  }

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: Text('Sign Up', style: TxtStyle.titleSplash),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: buildTextFieldEmail(),
              ),
              buildTextFieldPassword(),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 28),
                child: Terms(size: size),
              ),
              ClassicButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VerifyYourPage(),
                    ),
                  );
                },
                width: size.width,
                radius: 12,
                widthRadius: 0,
                colorRadius: DarkTheme.primaryBlue600,
                height: 52,
                color: DarkTheme.primaryBlue600,
                child: const Center(child: Text('Sign up')),
              ),
              const SizedBox(height: 24),
              const Text(
                'Or continue with social account',
                style: TxtStyle.headline5MediumWhite,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClassicButton(
                    onTap: () => print('Size: ${size}'),
                    width: 151,
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
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text('Google'),
                        ),
                      ],
                    ),
                  ),
                  ClassicButton(
                    onTap: () => print('Size: ${size}'),
                    width: 151,
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
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text('Facebook'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TxtStyle.Term,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Sign in',
                      style: TxtStyle.create,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
