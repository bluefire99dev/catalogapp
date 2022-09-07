// import 'dart:async';
// import 'package:catalogapp/utils/routes.dart';
// import 'package:flutter/material.dart';

// class splashpage extends StatefulWidget {
//   const splashpage({Key? key}) : super(key: key);

//   @override
//   State<splashpage> createState() => _splashpageState();
// }

// @override
// class _splashpageState extends State<splashpage> {
//   void initstate() {
//     super.initState();
//     Timer(
//       const Duration(seconds: 5),
//       () => Navigator.pushNamedAndRemoveUntil(
//         context,
//         MyRoutes.homeroute,
//         (route) => false,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Material(
//       child: Center(
//         child: CircleAvatar(
//           // backgroundColor: Colors.amber,
//           radius: 100.0,
//           backgroundImage: AssetImage("assets/images/splash.jpg"),
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';

import 'package:catalogapp/utils/routes.dart';
import 'package:flutter/material.dart';

class splashpage extends StatefulWidget {
  const splashpage({Key? key}) : super(key: key);

  @override
  State<splashpage> createState() => _splashpageState();
}

class _splashpageState extends State<splashpage> {
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 5),
      () => Navigator.pushNamed(context, MyRoutes.loginroute),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: CircleAvatar(
          radius: 100,
          backgroundImage: AssetImage("assets/images/splash.jpg"),
        ),
      ),
    );
  }
}
