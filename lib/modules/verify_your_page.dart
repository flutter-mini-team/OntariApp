import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ontari_app/config/themes/text_style.dart';

import '../config/themes/app_color.dart';

class VerifyYourPage extends StatelessWidget {
  const VerifyYourPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkTheme.greyScale900,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        //mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.fromLTRB(24, 140, 152, 6),
            child:
                Text('Phone Verification', style: TxtStyle.headline2BoldWhite),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(24, 0, 120, 48),
            child: Text('We have sent code to your number\n(+62) 897 6464 0808',
                style: TxtStyle.bodySmallMediumGrey),
          ),
        ],
      ),
    );
  }
}
