import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ontari_app/config/themes/app_color.dart';
import 'package:ontari_app/config/themes/text_style.dart';
import 'package:ontari_app/constants/assets_path.dart';
import 'package:ontari_app/models/model_local.dart';
import 'package:ontari_app/modules/setting/components/items_arrow_setting.dart';
import 'package:ontari_app/modules/setting/components/items_toggle_setting.dart';
import 'package:ontari_app/widgets/stless/common_button.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../widgets/stful/indicator_slider.dart';
import '../../widgets/stful/toggle_switch_button.dart';
import '../../widgets/stless/class_preview.dart';
import '../../widgets/stless/common_avatar.dart';
import '../../widgets/stless/common_bodyitem.dart';
import '../../widgets/stless/common_textfield.dart';
import '../../widgets/stless/discount.dart';
import '../../widgets/stless/indicator_home.dart';

import '../../widgets/stless/mentor.dart';
import '../../widgets/stless/terms.dart';
import '../activity/components/completed_progress.dart';
import '../activity/components/items_activity.dart';
import '../category/components/category_office.dart';
import '../category/components/items_category_office.dart';
import '../setting/components/item_account.dart';
import '../setting/components/items_download_video.dart';
import '../setting/components/items_language.dart';
import '../setting/components/items_my_favorite.dart';

class CommonWidgetPage extends StatefulWidget {
  const CommonWidgetPage({Key? key}) : super(key: key);

  @override
  State<CommonWidgetPage> createState() => _CommonWidgetPageState();
}

class _CommonWidgetPageState extends State<CommonWidgetPage> {
  bool check = false;
  int _currentIndex = 0;
  late PageController _pageController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextEditingController text = TextEditingController();

    return Scaffold(
      //backgroundColor: DarkTheme.greyScale900,
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(top: 50)),
            ClassicButton(
              onTap: () {},
              width: size.width / 1.3,
              radius: 12,
              widthRadius: 0,
              colorRadius: DarkTheme.white,
              height: size.height / 12,
              color: DarkTheme.primaryBlue900,
              child: const Center(child: Text('Sign in')),
            ),

            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            ClassicButton(
              onTap: () => print('Size: ${size}'),
              width: size.width / 1.3,
              widthRadius: 0,
              radius: 12,
              height: size.height / 12,
              color: DarkTheme.primaryBlue900,
              colorRadius: DarkTheme.white,
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
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width / 7,
                  height: size.width / 7,
                  child: const CircleButton(
                    widthIcon: 20,
                    heightIcon: 20,
                    bgColor: DarkTheme.primaryBlue900,
                    assetPath: AssetPath.iconPlay,
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                SquareButton(
                  edge: size.width / 7,
                  radius: 10,
                  bgColor: DarkTheme.primaryBlue900,
                  child: ImageIcon(
                    color: DarkTheme.white,
                    AssetImage(AssetPath.iconClose),
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                ClassicButton(
                  widthRadius: 0.0,
                  width: size.width / 3.5,
                  height: size.width / 15,
                  radius: 7,
                  color: DarkTheme.white,
                  colorRadius: DarkTheme.primaryBlue900,
                  child: const Center(
                      child: Text(
                    'Change Avatar',
                    style: TxtStyle.buttonSmallSemiBold,
                  )),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                IndicatorHome(
                  width: size.width / 4,
                  height: size.width / 90,
                  color: DarkTheme.primaryBlue900,
                  radius: 100,
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClassicButton(
                  width: size.width / 2.4,
                  radius: 12,
                  widthRadius: 0,
                  colorRadius: DarkTheme.white,
                  height: size.height / 12,
                  color: DarkTheme.primaryBlue900,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssetPath.iconGoogle,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text('Google'),
                      ),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                const ToggleSwitchButton(),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                const IndicatorSlider(edge: 10, count: 3),
              ],
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            CustomTextField(
              height: 52,
              //size: size / 1.2,
              title: 'Email address',
              hintText: 'Enter your email address',
              keyboardType: TextInputType.emailAddress,
              //assetIcon: AssetPath.iconEmail,
              childPrefixIcon: CustomAvatar(
                width: size.width / 24,
                height: size.width / 30,
                assetName: AssetPath.iconEmail,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            TextFieldPassword(
              size: size,
              //height: 52,
              title: 'Password',
              hintText: 'Enter your password',
              assetPrefixIcon: AssetPath.iconLock,
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            // search bar
            CustomTextField(
              height: 52,
              title: 'Search bar',
              hintText: 'Search your focus...',
              keyboardType: TextInputType.emailAddress,
              //assetIcon: AssetPath.iconSearch,
              childPrefixIcon: CustomAvatar(
                width: size.width / 22.5,
                height: size.width / 22.5,
                assetName: AssetPath.iconSearch,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Terms(size: size),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomAvatar(
                  height: size.width / 1.3,
                  width: size.width / 2,
                  assetName: AssetPath.imgAvatar,
                ),
                const Padding(padding: EdgeInsets.only(left: 10)),
                const InputCode(),
              ],
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Discount(),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Mentor(
                  assetName: AssetPath.imgMentor,
                  title: 'Teaching Fashion',
                  name: 'Bianca Lovata',
                  onTap: () {},
                ),
                //Class Preview
                const ClassPreview(
                  title: 'Entertainment',
                  assetName: AssetPath.imgPreview2,
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: SizedBox(
                height: 192,
                child: ListView.builder(
                  itemCount: mentor.length,
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    return index == 0
                        ? Mentor(
                            assetName: mentor[index].imageUrl,
                            name: mentor[index].name,
                            title: mentor[index].title,
                            onTap: () {},
                          )
                        : Padding(
                            padding: const EdgeInsets.only(left: 14.0),
                            child: Mentor(
                              assetName: mentor[index].imageUrl,
                              name: mentor[index].name,
                              title: mentor[index].title,
                              onTap: () {},
                            ),
                          );
                  },
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ItemsActivity(
                assetName: AssetPath.imgContent,
                title: 'James Haritz',
                name: 'Teaches Social Psychology',
                percent: 0.53,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: ItemsCategoryOffice(
                assetName: AssetPath.imgContent4,
                title: 'Alexander Felycia',
                name: 'Teaches Social Psychology',
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: CategoryOffice(
                assetIcon: AssetPath.iconBell,
                title: 'Business',
                countMentor: '12 Mentors',
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: ItemLanguage(
                assetName: AssetPath.iconUS,
                nameLang: 'United States',
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: BodyItem(
                assetName: AssetPath.imgBackgroundItems,
                height: 32,
                widthImg: 32,
                child: Center(
                  child: Image(
                    image: AssetImage(AssetPath.iconTime),
                    width: 10,
                    height: 10,
                  ),
                ),
                mid: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Center(
                    child: Text(
                      '11 Hours of Demand Video',
                      style: TxtStyle.headline4SemiBoldWhite,
                    ),
                  ),
                ),
                right: Text(''),
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: BodyItem(
                height: 80,
                widthImg: 112,
                assetName: AssetPath.imgCourseList,
                mid: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Introduction Mentor\nand Course 👋🏻',
                        style: TxtStyle.titleCourseList,
                      ),
                      Text(
                        'Course Part 1',
                        style: TxtStyle.headline5MediumWhite,
                      ),
                    ],
                  ),
                ),
                right: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 0.8,
                        color: DarkTheme.white.withOpacity(0.2),
                      ),
                    ),
                    child: const Image(
                      image: AssetImage(AssetPath.iconDownload),
                    ),
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0, bottom: 8),
                    child: SizedBox(
                      width: 36,
                      height: 18,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: DarkTheme.greyScale700,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          '10:09',
                          style: TxtStyle.textTimeCourse,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClassicButton(
                    onTap: () {},
                    width: 132,
                    radius: 10,
                    widthRadius: 0.0,
                    colorRadius: DarkTheme.yellow.withOpacity(0.1),
                    height: 32,
                    color: DarkTheme.yellow.withOpacity(0.1),
                    child: const Center(
                        child: Text(
                      'COURSE PART 1',
                      style: TxtStyle.textCourse,
                    )),
                  ),
                  SizedBox(
                    width: 152,
                    height: 65,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            AssetPath.imgContentCourse,
                            fit: BoxFit.cover,
                          ),
                        ),
                        ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 0.4, sigmaY: 0.4),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                'Social Psychology',
                                style: TxtStyle.currentPlan,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: ItemsDownloadVideo(
                assetName: AssetPath.imgContentDownload,
                part: 'Course Part 1',
                title: 'Introduction Mentor and\nCourse',
                name: 'Beatrix Annabel',
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ItemsArrowSetting(
                onTap: () {},
                title: 'Change Phone Number',
                assetName: AssetPath.iconUser,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: ItemsToggleSetting(
                title: 'Notification',
                assetName: AssetPath.iconBell,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ItemsMyFavorite(
                onTap: () {},
                assetName: AssetPath.imgContent3,
                title: 'Alexander Jane',
                name: 'Teaches Social Psychology',
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: SettingAccount(
                onTap: () {
                  print('aaa');
                },
                fullName: 'Barly Vallendito',
                userName: 'barlyvallendito',
                assetName: AssetPath.imgAvatar,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: CompletedProgress(),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          ],
        ),
      ),
    );
  }
}
