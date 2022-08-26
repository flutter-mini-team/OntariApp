import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ontari_app/config/themes/app_color.dart';
import 'package:ontari_app/config/themes/text_style.dart';
import 'package:ontari_app/constants/assets_path.dart';
import 'package:ontari_app/modules/sign_in/pages/sign_up_page.dart';
import 'package:ontari_app/modules/sign_in/pages/verify_your_page.dart';
import 'package:ontari_app/widgets/stateless/common_avatar.dart';
import 'package:ontari_app/widgets/stateless/common_button.dart';
import 'package:ontari_app/widgets/stateful/common_textfield.dart';
import 'package:provider/provider.dart';

import '../../../services/auth.dart';
import '../../../utils/showSnackBar.dart';
import '../../../widgets/stateless/show_exception_alert_dialog.dart';
import '../models/email_sign_in_change_model.dart';
import '../sign_in_manager.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({
    Key? key,
    required this.manager,
    required this.isLoading,
    required this.model,
  }) : super(key: key);

  final SignInManager manager;
  final bool isLoading;
  final EmailSignInChangeModel model;

  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ValueNotifier<bool>>(
          create: (_) => ValueNotifier<bool>(false),
        ),
        ChangeNotifierProvider<EmailSignInChangeModel>(
          create: (_) => EmailSignInChangeModel(auth: auth),
        ),
      ],
      child: Consumer<ValueNotifier<bool>>(
        builder: (_, isLoading, __) => Provider<SignInManager>(
          create: (_) => SignInManager(auth: auth, isLoading: isLoading),
          child: Consumer2<SignInManager, EmailSignInChangeModel>(
            builder: (_, manager, model, __) => SignInPage(
              manager: manager,
              isLoading: isLoading.value,
              model: model,
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
      await model.submitSignIn();
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

  bool _onChanged = false;
  bool _isObscure = true;
  TextFieldPassword buildTextFieldPassword() {
    return TextFieldPassword(
      assetPrefixIcon: AssetPath.iconLock,
      passwordController: _passwordController,
      passwordFocusNode: _passwordFocusNode,
      onChanged: (value) {
        model.updatePassword(value);
        _onChanged = true;
        setState(() {});
      },
      onEditingComplete: _submit,
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

  void _emailEditingComplete() {
    final newFocus = model.emailValidator.isValid(model.email)
        ? _passwordFocusNode
        : _emailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  void _showSignInError(BuildContext context, Exception exception) {
    if (exception is FirebaseException &&
        exception.code == 'ERROR_ABORTED_BY_USER') {
      return;
    }
    showExceptionAlertDialog(
      context,
      title: 'Sign in failed',
      exception: exception,
    );
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      await widget.manager.signInWithGoogle();
      snackBarSuccess();
    } on Exception catch (e) {
      _showSignInError(context, e);
    }
  }

  Future<void> _signInWithFacebook(BuildContext context) async {
    try {
      await widget.manager.signInWithFacebook();
      snackBarSuccess();
    } on Exception catch (e) {
      _showSignInError(context, e);
    }
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
                child: widget.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ClassicButton(
                        onTap: () {
                          model.canSubmit ? _submit() : null;
                        },
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
                  onTap: () =>
                      widget.isLoading ? null : _signInWithGoogle(context),
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
                onTap: () =>
                    widget.isLoading ? null : _signInWithFacebook(context),
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
              const SizedBox(height: 16),
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
                widthRadius: 0,
                radius: 12,
                height: 52,
                color: DarkTheme.primaryBlueButton900,
                colorRadius: DarkTheme.primaryBlueButton900,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.phone,
                      color: DarkTheme.green,
                    ),
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
        child: const Text(
          'Forgot password?',
          style: TxtStyle.headline4blue,
        ),
      ),
    );
  }

  Padding buildGoToSignUpPage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Don\'t have an account? ',
            style: TxtStyle.Term,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUpPage.create(context),
                ),
              );
            },
            child: const Text(
              'Create Here',
              style: TxtStyle.create,
            ),
          ),
        ],
      ),
    );
  }

  void snackBarSuccess() {
    return showSnackBar(
      context,
      "Sign in Successfully",
      Image.asset(
        AssetPath.iconChecked,
        color: DarkTheme.green,
      ),
    );
  }
}
