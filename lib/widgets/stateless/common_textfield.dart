import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ontari_app/constants/assets_path.dart';

import '../../config/themes/app_color.dart';
import '../../config/themes/text_style.dart';
import 'common_avatar.dart';
import 'indicator_home.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    this.title = '',
    required this.hintText,
    this.keyboardType,
    this.height = 0,
    this.heightSizedbox = 16,
    this.childPrefixIcon,
  }) : super(key: key);
  final String title;
  final double? height, heightSizedbox;
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
        SizedBox(height: widget.heightSizedbox),
        SizedBox(
          height: widget.height,
          child: TextField(
            controller: text,
            onChanged: (value) {
              _onChanged = false;
              setState(() {});
            },
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: DarkTheme.greyScale900,
                  width: 2,
                ),
              ),
              filled: true,
              fillColor: DarkTheme.greyScale800,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
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
                      icon: const Align(
                        widthFactor: 0.5,
                        heightFactor: 0.5,
                        child: CustomAvatar(
                          width: 15,
                          height: 15,
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
        const SizedBox(height: 16),
        SizedBox(
          width: widget.size!.width,
          height: 52,
          child: TextField(
            onChanged: (value) {
              onChanged = false;
              setState(() {});
            },
            obscureText: _isObscure,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: DarkTheme.greyScale900,
                  width: 2,
                ),
              ),
              filled: true,
              fillColor: DarkTheme.greyScale800,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
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
                  width: 15,
                  height: 16,
                  assetName: widget.assetPrefixIcon!,
                ),
              ),
              suffixIcon: Align(
                widthFactor: 0.5,
                heightFactor: 0.5,
                child: !onChanged!
                    ? CustomAvatar(
                        width: 25,
                        height: 18,
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
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        keyboardAppearance: Brightness.dark,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TxtStyle.headline4White,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: DarkTheme.greyScale800,
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
        ),
      ),
    );
  }
}
