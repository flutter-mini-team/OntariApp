import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ontari_app/config/themes/app_color.dart';
import 'package:ontari_app/config/themes/text_style.dart';
import 'package:ontari_app/constants/assets_path.dart';
import 'package:ontari_app/modules/sign_in/pages/sign_in_page.dart';
import 'package:ontari_app/modules/sign_in/pages/verify_your_page.dart';
import 'package:ontari_app/widgets/stateless/common_avatar.dart';
import 'package:ontari_app/widgets/stateless/common_button.dart';
import 'package:ontari_app/widgets/stateless/common_textfield.dart';
import 'package:ontari_app/widgets/stateless/terms.dart';
import 'package:provider/provider.dart';

import '../../../services/auth.dart';
import '../../../widgets/stateless/show_exception_alert_dialog.dart';
import '../models/email_sign_in_change_model.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key, required this.model}) : super(key: key);

  final EmailSignInChangeModel model;

  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return ChangeNotifierProvider<EmailSignInChangeModel>(
      create: (_) => EmailSignInChangeModel(auth: auth),
      child: Consumer<EmailSignInChangeModel>(
        builder: (_, model, __) => SignUpPage(model: model),
      ),
    );
  }

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  EmailSignInChangeModel get model => widget.model;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    try {
      await widget.model.submitSignUp();
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      showExceptionAlertDialog(
        context,
        title: 'Sign in failed',
        exception: e,
      );
    }
  }

  TextFieldEmail buildTextFieldEmail() {
    return TextFieldEmail(
      emailController: _emailController,
      emailFocusNode: _emailFocusNode,
      onChanged: (value) {
        model.updateEmail(value);
      },
      onEditingComplete: () => _emailEditingComplete(),
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
      onChanged: (value) {
        model.updatePassword(value);
      },
      onEditingComplete: _submit,
    );
  }

  void _emailEditingComplete() {
    final newFocus = model.emailValidator.isValid(model.email)
        ? _passwordFocusNode
        : _emailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
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
                onTap: () => model.canSubmit ? _submit() : null,
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
