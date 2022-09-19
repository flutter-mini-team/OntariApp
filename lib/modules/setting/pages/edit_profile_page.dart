import 'package:flutter/material.dart';
import 'package:ontari_app/themes/app_color.dart';
import 'package:ontari_app/themes/text_style.dart';
import 'package:ontari_app/modules/setting/widgets/title_option_setting.dart';
import 'package:ontari_app/modules/setting/widgets/title_setting.dart';
import 'package:ontari_app/widgets/stateless/common_avatar.dart';
import 'package:ontari_app/widgets/stateless/common_bodyitem.dart';
import 'package:ontari_app/widgets/stateless/common_button.dart';
import 'package:ontari_app/widgets/stateful/common_textfield.dart';

import '../../../assets/assets_path.dart';
import '../../../models/user.dart';
import '../bloc/user_detail_bloc.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _lastController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final _bloc = UserDetailBloc();

  @override
  void initState() {
    super.initState();
    _bloc.getUserDeTail();
  }

  Widget buildTextFieldFirstName(String displayFirstName) {
    _firstController.text = displayFirstName;
    return buildTextFieldString(
      'First Name',
      'Enter your First Name',
      AssetPath.iconUser,
      _firstController,
    );
  }

  Widget buildTextFieldLastName(String displayLastName) {
    _userController.text = displayLastName;
    return buildTextFieldString(
      'Last Name',
      'Enter your Last Name',
      AssetPath.iconUser,
      _lastController,
    );
  }

  Widget buildTextFieldUserName(String displayUserName) {
    _userController.text = displayUserName;
    return buildTextFieldString(
      'Username',
      'Enter your Username',
      AssetPath.iconUser,
      _userController,
    );
  }

  TextFieldEmail buildTextFieldEmail(String displayEmail) {
    _emailController.text = displayEmail;
    return TextFieldEmail(
      emailController: _emailController,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _firstController.dispose();
    _lastController.dispose();
    _userController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkTheme.greyScale900,
      body: StreamBuilder<User>(
          stream: _bloc.userStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final detail = snapshot.data!;
              return SafeArea(
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
                      const TitleOptionSettings(
                        title: 'EDIT AVATAR',
                        height: 32,
                        color: DarkTheme.primaryBlueButton,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: BodyItemNetwork(
                          assetName: detail.imgUrl!,
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
                      const TitleOptionSettings(
                        title: 'EDIT INFORMATION',
                        height: 32,
                        color: DarkTheme.primaryBlueButton,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 24.0),
                              child: buildTextFieldFirstName(
                                  detail.displayFirstName),
                            ),
                            buildTextFieldLastName(detail.displayLastName),
                            const SizedBox(height: 24),
                            buildTextFieldUserName(detail.displayUserName),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 24.0),
                              child: buildTextFieldEmail(detail.displayEmail),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            if (snapshot.hasError) {
              return const SliverFillRemaining(
                child: Center(
                  child: Text('Something went wrong'),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
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
            width: 15,
            height: 15,
            assetName: assetName,
          ),
          textController: controller,
        ),
      ],
    );
  }
}
