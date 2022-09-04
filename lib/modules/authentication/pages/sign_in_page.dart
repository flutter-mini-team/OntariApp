import 'package:flutter/material.dart';
import 'package:ontari_app/themes/app_color.dart';
import 'package:ontari_app/themes/text_style.dart';
import 'package:ontari_app/modules/authentication/pages/sign_up_page.dart';
import 'package:ontari_app/widgets/stateless/common_avatar.dart';
import 'package:ontari_app/widgets/stateless/common_button.dart';
import 'package:ontari_app/widgets/stateful/common_textfield.dart';

import '../../../../utils/showSnackBar.dart';
import '../../../assets/assets_path.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  TextFieldEmail buildTextFieldEmail() {
    return TextFieldEmail(
      emailController: _emailController,
      emailFocusNode: _emailFocusNode,
      childPrefixIcon: const CustomAvatar(
        width: 15,
        height: 12,
        assetName: AssetPath.iconEmail,
      ),
    );
  }

  bool _onChanged = false;
  bool _isObscure = true;
  TextFieldPassword buildTextFieldPassword() {
    return TextFieldPassword(
      assetPrefixIcon: AssetPath.iconLock,
      passwordController: _passwordController,
      passwordFocusNode: _passwordFocusNode,
      onChanged: (value) {
        _onChanged = true;
        setState(() {});
      },
      obscureText: _isObscure,
      suffixIcon: _passwordController.text.isEmpty
          ? Container(width: 0)
          : Align(
              widthFactor: 0.5,
              heightFactor: 0.5,
              child: _onChanged
                  ? CustomAvatar(
                      width: 20,
                      height: 15,
                      assetName: _isObscure
                          ? AssetPath.iconEye
                          : AssetPath.iconHideEye,
                      onTap: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    )
                  : const Text(''),
            ),
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
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 40.0),
                child: Text('Ontari.', style: TxtStyle.titleSplash),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: buildTextFieldEmail(),
              ),
              buildTextFieldPassword(),
              buildForgotPassword(),
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
                  width: size.width,
                  widthRadius: 0,
                  radius: 12,
                  height: 52,
                  color: DarkTheme.primaryBlueButton900,
                  colorRadius: DarkTheme.primaryBlueButton900,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AssetPath.iconGoogle),
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text('Sign In with Google'),
                      ),
                    ],
                  ),
                ),
              ),
              ClassicButton(
                width: size.width,
                widthRadius: 0,
                radius: 12,
                height: 52,
                color: DarkTheme.primaryBlueButton900,
                colorRadius: DarkTheme.primaryBlueButton900,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AssetPath.iconFacebook),
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text('Sign In with Facebook'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ClassicButton(
                onTap: () {},
                width: size.width,
                widthRadius: 0,
                radius: 12,
                height: 52,
                color: DarkTheme.primaryBlueButton900,
                colorRadius: DarkTheme.primaryBlueButton900,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.phone, color: DarkTheme.green),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text('Sign In with Phone number'),
                    ),
                  ],
                ),
              ),
              buildGoToSignUpPage(context),
            ],
          ),
        ),
      ),
    );
  }

  Align buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          print('aaaa');
        },
        child: const Text('Forgot password?', style: TxtStyle.headline4blue),
      ),
    );
  }

  Padding buildGoToSignUpPage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Don\'t have an account? ', style: TxtStyle.Term),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUpPage(),
                ),
              );
            },
            child: const Text('Create Here', style: TxtStyle.create),
          ),
        ],
      ),
    );
  }

  void snackBarSuccess() {
    return showSnackBar(
      context,
      "Sign in Successfully",
      Image.asset(AssetPath.iconChecked, color: DarkTheme.green),
    );
  }
}
