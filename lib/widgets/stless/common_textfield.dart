import 'package:flutter/material.dart';
import 'package:ontari_app/constants/assets_path.dart';

import '../../config/themes/app_color.dart';
import '../../config/themes/text_style.dart';
import 'common_avatar.dart';
import 'indicator_home.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    this.size,
    required this.title,
    required this.hintText,
    this.keyboardType,
    this.childPrefixIcon,
  }) : super(key: key);
  final String title;
  final Size? size;
  final hintText, keyboardType;
  final Widget? childPrefixIcon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool? _onChanged = true;
  final TextEditingController text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: TxtStyle.titleInput),
        const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
        SizedBox(
          width: widget.size!.width,
          child: TextField(
            controller: text,
            onChanged: (value) {
              _onChanged = false;
              setState(() {});
            },
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: DarkTheme.greyScale900,
                  width: 2,
                ),
              ),
              filled: true,
              fillColor: DarkTheme.greyScale800,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: DarkTheme.primaryBlue600,
                  width: 2,
                ),
              ),
              hintText: widget.hintText,
              hintStyle: TxtStyle.hintText,
              prefixIcon: Align(
                widthFactor: 0.5,
                heightFactor: 0.5,
                child: widget.childPrefixIcon,
              ),
              suffixIcon: !_onChanged!
                  ? IconButton(
                      icon: Align(
                        widthFactor: 0.5,
                        heightFactor: 0.5,
                        child: CustomAvatar(
                          width: widget.size!.width / 26,
                          height: widget.size!.width / 32,
                          assetName: AssetPath.iconClose,
                        ),
                      ),
                      onPressed: () {
                        text.clear();
                        setState(() {
                          _onChanged = true;
                        });
                      },
                    )
                  : const Text(''),
            ),
          ),
        ),
      ],
    );
  }
}

class TextFieldPassword extends StatefulWidget {
  const TextFieldPassword({
    Key? key,
    this.size,
    this.title,
    this.hintText,
    this.assetPrefixIcon,
  }) : super(key: key);
  final String? title;
  final Size? size;
  final String? hintText;
  final String? assetPrefixIcon;

  @override
  State<TextFieldPassword> createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
  bool? onChanged = true;
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title!, style: TxtStyle.titleInput),
        const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
        SizedBox(
          width: widget.size!.width,
          child: TextField(
            onChanged: (value) {
              onChanged = false;
              setState(() {});
            },
            obscureText: _isObscure,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: DarkTheme.greyScale900,
                  width: 2,
                ),
              ),
              filled: true,
              fillColor: DarkTheme.greyScale800,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: DarkTheme.primaryBlue600,
                  width: 2,
                ),
              ),
              hintText: widget.hintText!,
              hintStyle: TxtStyle.hintText,
              prefixIcon: Align(
                widthFactor: 0.5,
                heightFactor: 0.5,
                child: CustomAvatar(
                    width: widget.size!.width / 20,
                    height: widget.size!.width / 20,
                    assetName: widget.assetPrefixIcon!),
              ),
              suffixIcon: Align(
                widthFactor: 0.5,
                heightFactor: 0.5,
                child: !onChanged!
                    ? CustomAvatar(
                        width: widget.size!.width / 14,
                        height: widget.size!.width / 18,
                        assetName: _isObscure
                            ? AssetPath.iconEye
                            : AssetPath.iconHideEye,
                        onTap: () {
                          setState(() {
                            _isObscure ? _isObscure = false : _isObscure = true;
                          });
                        },
                      )
                    : Text(''),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class InputCode extends StatefulWidget {
  const InputCode({
    Key? key,
  }) : super(key: key);

  @override
  State<InputCode> createState() => _InputCodeState();
}

class _InputCodeState extends State<InputCode> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 55,
      height: 55,
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TxtStyle.headline4White,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: DarkTheme.greyScale800,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: DarkTheme.primaryBlue600,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
