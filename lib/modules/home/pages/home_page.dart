import 'package:flutter/material.dart';
import 'package:ontari_app/resource/token_manager.dart';
import 'package:ontari_app/themes/text_style.dart';
import 'package:ontari_app/widgets/stateless/class_preview.dart';
import 'package:ontari_app/widgets/stateless/common_button.dart';

import '../../../assets/assets_path.dart';
import '../../../themes/app_color.dart';
import '../../../models/model_local.dart';
import '../../../widgets/stateless/common_avatar.dart';
import '../../../widgets/stateful/common_textfield.dart';
import '../../../widgets/stateless/discount.dart';
import '../../../widgets/stateless/mentor.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(TokenManager().accessToken);
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      backgroundColor: DarkTheme.greyScale900,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: CircleAvatar(
                              radius: 100,
                              backgroundImage: AssetImage(AssetPath.imgAvatar),
                            ),
                          ),
                          SquareButton(
                            bgColor: DarkTheme.greyScale800,
                            edge: 40,
                            radius: 10,
                            child: ImageIcon(
                              size: 13,
                              color: DarkTheme.white,
                              AssetImage(AssetPath.iconBell),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 21),
                      const Text(
                        'Hi, Michael Owen',
                        style: TxtStyle.headline2BoldWhite,
                      ),
                      const Text(
                        'Welcome back to ontari, Explore Course',
                        style: TxtStyle.headline5MediumWhite,
                      ),
                      const SizedBox(height: 16),
                      TextFieldSearchBar(
                        textController: searchController,
                        hintText: 'Search your focus...',
                        childPrefixIcon: const CustomAvatar(
                          width: 15,
                          height: 16,
                          assetName: AssetPath.iconSearch,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Discount(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Best Mentors',
                            style: TxtStyle.headline3SemiBoldWhite,
                          ),
                          TextButton(
                            onPressed: () {
                              //print('aaa');
                            },
                            child: const Text(
                              'See all',
                              style: TxtStyle.headline6MediumBlue,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      buildListMentors(),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Class Preview',
                            style: TxtStyle.headline3SemiBoldWhite,
                          ),
                          TextButton(
                            onPressed: () {
                              //print('aaa');
                            },
                            child: const Text(
                              'See all',
                              style: TxtStyle.headline6MediumBlue,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      buildGridViewPreview(),
                    ],
                  ),
                  //pageView
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GridView buildGridViewPreview() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      mainAxisSpacing: 23,
      crossAxisSpacing: 23,
      childAspectRatio: 5 / 6.299,
      //primary: false,
      physics: const ScrollPhysics(),
      children: preview
          .map(
            (e) => ClassPreview(
              title: e.title,
              assetName: e.imageUrl,
            ),
          )
          .toList(),
    );
  }

  SizedBox buildListMentors() {
    return SizedBox(
      height: 192,
      child: ListView.builder(
        itemCount: mentor.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return index == 0
              ? Mentor(
                  assetName: mentor[index].imageUrl,
                  name: mentor[index].name,
                  title: mentor[index].title,
                  onTap: () {},
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Mentor(
                    assetName: mentor[index].imageUrl,
                    name: mentor[index].name,
                    title: mentor[index].title,
                    onTap: () {},
                  ),
                );
        },
      ),
    );
  }
}
