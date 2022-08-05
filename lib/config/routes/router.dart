import 'package:flutter/material.dart';
import 'package:ontari_app/modules/activity/activity_page.dart';
import 'package:ontari_app/modules/category/category_page.dart';
import 'package:ontari_app/modules/select_plan_page.dart';
import 'package:ontari_app/modules/setting/setting_page.dart';
import 'package:ontari_app/modules/splash_page.dart';

import '../../modules/common_widget/common_widget_page.dart';
import '../../modules/home/home_page.dart';
import '../../modules/sign_in_page.dart';
import '../../modules/sign_up_page.dart';
import '../../modules/verify_your_page.dart';
import '../../root_page.dart';
import '../../widgets/stful/pages.dart';

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
      case 'SignInPage':
        {
          return MaterialPageRoute(builder: (_) => const SignInPage());
        }
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

      // case 'FavoriteGenrePage':
      //   {
      //     return MaterialPageRoute(builder: (_) => FavoriteGenrePage());
      //   }
      // case 'ConfirmNewPage':
      //   {
      //     return MaterialPageRoute(builder: (_) => ConfirmNewPage());
      //   }

      // case 'MovieInfoPage':
      //   {
      //     return MaterialPageRoute(builder: (_) => MovieInfoPage());
      //   }
      // case 'SelectCinemaPage':
      //   {
      //     return MaterialPageRoute(builder: (_) => SelectCinemaPage());
      //   }case 'SelectSeatPage':
      //   {
      //     return MaterialPageRoute(builder: (_) => SelectSeatPage());
      //   }
      // case 'CheckOutMoviePage':
      //   {
      //     return MaterialPageRoute(builder: (_) => CheckOutMoviePage());
      //   }
      // case 'MyTicketPage':
      //   {
      //     return MaterialPageRoute(builder: (_) => MyTicketPage());
      //   }
      // case 'TicketDetailPage':
      //   {
      //     return MaterialPageRoute(builder: (_) => TicketDetailPage());
      //   }
      // case 'MyWalletPage':
      //   {
      //     return MaterialPageRoute(builder: (_) => MyWalletPage());
      //   }
      // case 'TopUpPage':
      //   {
      //     return MaterialPageRoute(builder: (_) => TopUpPage());
      //   }
      // case 'ProfilePage':
      //   {
      //     return MaterialPageRoute(builder: (_) => ProfilePage());
      //   }
      // case 'EditProfilePage':
      //   {
      //     return MaterialPageRoute(builder: (_) => EditProfilePage());
      //   }

      // case 'RootPage':
      //   {
      //     return MaterialPageRoute(builder: (_) => const RootPage());
      //   }

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
