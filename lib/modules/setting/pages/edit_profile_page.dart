import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ontari_app/themes/app_color.dart';
import 'package:ontari_app/themes/text_style.dart';
import 'package:ontari_app/modules/setting/widgets/title_option_setting.dart';
import 'package:ontari_app/modules/setting/widgets/title_setting.dart';
import 'package:ontari_app/widgets/stateless/common_avatar.dart';
import 'package:ontari_app/widgets/stateless/common_bodyitem.dart';
import 'package:ontari_app/widgets/stateless/common_button.dart';
import 'package:ontari_app/widgets/stateful/common_textfield.dart';

import '../../../assets/assets_path.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({Key? key}) : super(key: key);

  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _lastController = TextEditingController();
  final TextEditingController _userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkTheme.greyScale900,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TitleSetting(title: 'Edit Profile'),
                    ClassicButton(
                      onTap: () {},
                      width: 60,
                      height: 32,
                      radius: 12,
                      widthRadius: 0,
                      colorRadius: DarkTheme.primaryBlue600,
                      color: DarkTheme.primaryBlue600,
                      child: const Center(child: Text('Save')),
                    ),
                  ],
                ),
              ),
              TitleOptionSettings(
                title: 'EDIT AVATAR',
                height: 32,
                color: DarkTheme.primaryBlueButton,
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: BodyItem(
                  assetName: AssetPath.imgAvatar,
                  height: 64,
                  widthImg: 64,
                  mid: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        ClassicButton(
                          widthRadius: 2,
                          width: 117,
                          height: 32,
                          radius: 7,
                          color: DarkTheme.greyScale800,
                          colorRadius: DarkTheme.primaryBlue600,
                          child: Center(
                            child: Text(
                              'Change Avatar',
                              style: TxtStyle.headline6MediumBlue,
                            ),
                          ),
                        ),
                        Text(
                          'Edit avatar are visible only on ontari.',
                          style: TxtStyle.headline6MediumGrey,
                        ),
                      ],
                    ),
                  ),
                  right: const Text(''),
                ),
              ),
              TitleOptionSettings(
                title: 'EDIT INFORMATION',
                height: 32,
                color: DarkTheme.primaryBlueButton,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: buildTextFieldString(
                        'First Name',
                        'Enter your First Name',
                        AssetPath.iconUser,
                        _firstController,
                      ),
                    ),
                    buildTextFieldString(
                      'Last Name',
                      'Enter your Last Name',
                      AssetPath.iconUser,
                      _lastController
                    ),
                    const SizedBox(height: 24),
                    buildTextFieldString(
                      'Username',
                      'Enter your Username',
                      AssetPath.iconUser,
                      _userController,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: buildTextFieldEmail(
                        'Email address',
                        'Enter your Email address',
                        AssetPath.iconEmail,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextFieldString(
    String title,
    String hintText,
    String assetName,
    TextEditingController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TxtStyle.headline4SemiBoldWhite),
        const SizedBox(height: 10),
        TextFieldSearchBar(
          hintText: hintText,
          childPrefixIcon: CustomAvatar(
            width: 12,
            height: 12,
            assetName: assetName,
          ),
          textController: controller,
        ),
      ],
    );
  }

  TextFieldEmail buildTextFieldEmail(
      String title, String hintText, String assetName) {
    return TextFieldEmail(
      //emailController: _emailController,
      //emailFocusNode: _emailFocusNode,
      //onChanged: ,
      //onEditingComplete: ,
      childPrefixIcon: const CustomAvatar(
        width: 15,
        height: 12,
        assetName: AssetPath.iconEmail,
      ),
    );
  }
}
