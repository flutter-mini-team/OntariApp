import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ontari_app/config/themes/app_color.dart';

import 'config/routes/routes.dart';
import 'config/routes/router.dart' as router;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: DarkTheme.greyScale900,
      statusBarBrightness: Brightness.light,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: DarkTheme.greyScale50,
        scaffoldBackgroundColor: DarkTheme.greyScale50,
        fontFamily: 'manrope',
        textTheme: Theme.of(context)
            .textTheme
            .apply(bodyColor: DarkTheme.white, displayColor: DarkTheme.white),
      ),
      //home: const MyHomePage(),
      initialRoute: Routes.listPage,
      onGenerateRoute: router.Router.generateRoute,
    );
  }
}
