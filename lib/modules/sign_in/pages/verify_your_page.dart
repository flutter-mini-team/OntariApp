import 'package:flutter/material.dart';
import 'package:ontari_app/config/themes/app_color.dart';
import 'package:ontari_app/config/themes/text_style.dart';
import 'package:ontari_app/constants/assets_path.dart';
import 'package:ontari_app/modules/landing_page.dart';
import 'package:ontari_app/widgets/stateless/common_button.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';

import '../../../services/auth.dart';
import '../../../widgets/stateless/show_alert_dialog.dart';

class VerifyYourPage extends StatefulWidget {
  const VerifyYourPage({Key? key}) : super(key: key);

  @override
  State<VerifyYourPage> createState() => _VerifyYourPageState();
}

class _VerifyYourPageState extends State<VerifyYourPage> {
  final OtpFieldController _controller = OtpFieldController();
  //late String verificationId = "";

  //+84789862417
  // void setData(verificationID) {
  //   setState(() {
  //     verificationId = verificationID;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // final auth = Provider.of<AuthBase>(context, listen: false);
    // try {
    //   auth.verifyPhoneNumber(context, setData);
    // } catch (e) {
    //   print(e.toString());
    // }
    // print(verificationId);
    return Scaffold(
      backgroundColor: DarkTheme.greyScale900,
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 140, bottom: 6),
              child: Text(
                'Phone Verification',
                style: TxtStyle.headline2BoldWhite,
              ),
            ),
            const Text(
              'We have sent code to your number\n(+62) 897 6464 0808',
              style: TxtStyle.bodySmallMediumGrey,
            ),
            const SizedBox(height: 48),
            OTPTextField(
              controller: _controller,
              length: 6,
              width: 360,
              fieldWidth: 48,
              otpFieldStyle: OtpFieldStyle(
                backgroundColor: DarkTheme.greyScale800,
                borderColor: DarkTheme.primaryBlue600,
              ),
              style: TxtStyle.headline4White,
              fieldStyle: FieldStyle.box,
              onChanged: (value) {},
              onCompleted: (pin) {
                if (pin.compareTo("111111") == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LandingPage(),
                    ),
                  );
                } else {
                  showAlertDialog(
                    context,
                    title: 'OTP',
                    content: 'The OTP code is incorrect, please check again',
                    defaultActionText: 'OK',
                  );
                }
              },
            ),
            const SizedBox(height: 64),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: ClassicButton(
                    widthRadius: 2.0,
                    width: 84,
                    height: 40,
                    radius: 10,
                    color: DarkTheme.primaryBlueButton900,
                    colorRadius: DarkTheme.primaryBlue900,
                    child: Center(
                        child: Text(
                      '111111',
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
      ),
    );
  }
}
