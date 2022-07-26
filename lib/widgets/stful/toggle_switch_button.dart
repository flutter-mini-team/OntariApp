
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/themes/app_color.dart';

class ToggleSwitchButton extends StatefulWidget {
  const ToggleSwitchButton({Key? key}) : super(key: key);

  @override
  State<ToggleSwitchButton> createState() =>
      _ToggleSwitchButtonState();
}

class _ToggleSwitchButtonState extends State<ToggleSwitchButton> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8,
      child: CupertinoSwitch(
        value: value,
        activeColor: DarkTheme.primaryBlue900,
        onChanged: (value) => setState(() {
          this.value = value;
        }),
      ),
    );
  }
}