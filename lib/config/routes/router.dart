import 'package:flutter/material.dart';

import '../../modules/common_widget/common_widget_page.dart';
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
      // case 'Splash':
      // {
      //     return MaterialPageRoute(builder: (_) => OnBoardingPage());

      // }
      // case 'OnBoardingPage':
      //   {
      //     return MaterialPageRoute(builder: (_) => OnBoardingPage());
      //   }
      // case 'SignInPage':
      //   {
      //     return MaterialPageRoute(builder: (_) => SignInPage());
      //   }
      // case 'SignUpPage':
      //   {
      //     return MaterialPageRoute(builder: (_) => SignUpPage());
      //   }
      // case 'FavoriteGenrePage':
      //   {
      //     return MaterialPageRoute(builder: (_) => FavoriteGenrePage());
      //   }
      // case 'ConfirmNewPage':
      //   {
      //     return MaterialPageRoute(builder: (_) => ConfirmNewPage());
      //   }
      // case 'HomePage':
      //   {
      //     return MaterialPageRoute(builder: (_) => HomePage());
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
      //     return MaterialPageRoute(builder: (_) => RootPage());
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
