import 'package:catalogapp/pages/cart_page.dart';
import 'package:catalogapp/pages/login_page.dart';
import 'package:catalogapp/pages/splash_page.dart';
import 'package:catalogapp/utils/routes.dart';
import 'package:catalogapp/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'core/store.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //debug banner ban karva mate

      // home: homepage(),//routes
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.DarkTheme(context),

      // initialRoute: MyRoutes.homeroute,
      // routes: {
      //   "/": (context) => const LoginPage(),
      //   MyRoutes.homeroute: (context) => HomePage(),
      //   MyRoutes.loginroute: (context) => const LoginPage(),
      // },

      initialRoute: MyRoutes.splashroute,
      routes: {
        "/": (context) => HomePage(),
        MyRoutes.splashroute: (context) => const splashpage(),
        MyRoutes.homeroute: (context) => HomePage(),
        MyRoutes.loginroute: (context) => const LoginPage(),
        MyRoutes.cartroute: (context) => const Cartpage(),
      },
    );
  }
}
// 3:49 time day12
