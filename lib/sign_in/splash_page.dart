import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ontari_app/config/themes/app_color.dart';
import 'package:ontari_app/config/themes/text_style.dart';
import 'package:ontari_app/widgets/stless/indicator_home.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkTheme.greyScale900,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Expanded(
              flex: 8,
              child:
                  Center(child: Text('Ontari.', style: TxtStyle.titleSplash))),
          //Padding(padding: EdgeInsets.only(top: 277)),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 34.0),
              child: Text(
                textAlign: TextAlign.center,
                'Lorem ipsum dolor sit amet, consectetur adipiscing\nelit. Tincidunt et, volutpat duis amet, risus.',
                style: TxtStyle.bodyTextSmall,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(120, 37, 120, 30),
            child: IndicatorHome(
              color: DarkTheme.white,
              radius: 10,
              height: 5,
            ),
          ),
        ],
      ),
    );
  }
}
