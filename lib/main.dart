import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ontari_app/config/themes/app_color.dart';
import 'package:ontari_app/services/auth.dart';
import 'package:provider/provider.dart';

import 'config/routes/routes.dart';
import 'config/routes/router.dart' as router;
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: MaterialApp(
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
        initialRoute: Routes.listPage,
        onGenerateRoute: router.Router.generateRoute,
      ),
    );
  }
}
