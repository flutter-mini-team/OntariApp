import 'package:flutter/material.dart';
import 'package:ontari_app/models/model_local.dart';
import 'package:ontari_app/modules/activity/pages/activity_page.dart';
import 'package:ontari_app/modules/category/pages/category_page.dart';
import 'package:ontari_app/modules/common/common_widget_page.dart';
import 'package:ontari_app/modules/details/pages/detail_mentor_page.dart';
import 'package:ontari_app/modules/details/pages/detail_playing_course.dart';
import 'package:ontari_app/modules/setting/pages/change_language_page.dart';
import 'package:ontari_app/modules/setting/pages/download_video_page.dart';
import 'package:ontari_app/modules/setting/pages/edit_profile_page.dart';
import 'package:ontari_app/modules/setting/pages/my_favorite_page.dart';
import 'package:ontari_app/modules/sign_in/pages/select_plan_page.dart';
import 'package:ontari_app/modules/sign_in/pages/sign_in_page.dart';
import 'package:ontari_app/modules/sign_in/pages/sign_up_page.dart';
import 'package:ontari_app/modules/sign_in/pages/splash_page.dart';
import 'package:ontari_app/modules/sign_in/pages/verify_your_page.dart';

import '../../modules/home/pages/home_page.dart';

import '../../modules/root_page.dart';
import '../../widgets/stateful/pages.dart';

class Router {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'CommonWidgetPage':
        {
          return MaterialPageRoute(builder: (_) => const CommonWidgetPage());
        }
      case 'ListPage':
        {
          return MaterialPageRoute(builder: (_) => const ListPage());
        }
      case 'SplashPage':
        {
          return MaterialPageRoute(builder: (_) => const SplashPage());
        }
      // case 'SignInPage':
      //   {
      //     return MaterialPageRoute(builder: (_) => const SignInPage());
      //   }
      case 'SignUpPage':
        {
          return MaterialPageRoute(builder: (_) => const SignUpPage());
        }
      case 'VerifyYourPage':
        {
          return MaterialPageRoute(builder: (_) => const VerifyYourPage());
        }
      case 'SelectPlanPage':
        {
          return MaterialPageRoute(builder: (_) => const SelectPlanPage());
        }
      case 'HomePage':
        {
          return MaterialPageRoute(builder: (_) => const RootPage());
        }
      case 'ActivityPage':
        {
          return MaterialPageRoute(builder: (_) => const RootPage(bottom: 1));
        }
      case 'CategoryPage':
        {
          return MaterialPageRoute(builder: (_) => const RootPage(bottom: 2));
        }
      case 'SettingPage':
        {
          return MaterialPageRoute(builder: (_) => const RootPage(bottom: 3));
        }
      case 'LanguagePage':
        {
          return MaterialPageRoute(builder: (_) => const LanguagePage());
        }
      case 'FavoritePage':
        {
          return MaterialPageRoute(builder: (_) => const MyFavoritePage());
        }
      case 'DownloadVideoPage':
        {
          return MaterialPageRoute(builder: (_) => const DownloadVideoPage());
        }
      case 'EditProfilePage':
        {
          return MaterialPageRoute(builder: (_) => const EditProfilePage());
        }
      case 'DetailMentorPage':
        {
          return MaterialPageRoute(builder: (_) => const DetailMentorPage());
        }
      case 'PlayingCoursePage':
        {
          return MaterialPageRoute(
            builder: (_) => const PlayingCoursePage(
              //modelCourse: courseItem[0],
            ),
          );
        }
      case 'FullScreenPage':
        {
          return MaterialPageRoute(builder: (_) => const SplashPage());
        }
      default:
        {
          return MaterialPageRoute(
            builder: (_) => Scaffold(
              body:
                  Center(child: Text('No route defined for ${settings.name}')),
            ),
          );
        }
    }
  }
}
