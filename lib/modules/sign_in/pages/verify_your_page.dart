import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ontari_app/config/themes/app_color.dart';
import 'package:ontari_app/config/themes/text_style.dart';
import 'package:ontari_app/widgets/stateless/common_button.dart';
import 'package:ontari_app/widgets/stateless/common_textfield.dart';




class VerifyYourPage extends StatelessWidget {
  const VerifyYourPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkTheme.greyScale900,
      body: Column(
        //mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(24, 140, 152, 6),
            child:
                Text('Phone Verification', style: TxtStyle.headline2BoldWhite),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(24, 0, 120, 48),
            child: Text('We have sent code to your number\n(+62) 897 6464 0808',
                style: TxtStyle.bodySmallMediumGrey),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 9.0),
            child: SizedBox(
              height: 55,
              child: Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, int index) {
                    return const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: InputCode(),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 64),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(24, 0, 12, 0),
                child: ClassicButton(
                  widthRadius: 2.0,
                  width: 84,
                  height: 40,
                  radius: 10,
                  color: DarkTheme.primaryBlueButton900,
                  colorRadius: DarkTheme.primaryBlue900,
                  child: Center(
                      child: Text(
                    '1111',
                    style: TxtStyle.headline4White2,
                  )),
                ),
              ),
              Text(
                'Use code from your phone',
                style: TxtStyle.headline5MediumWhite,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
