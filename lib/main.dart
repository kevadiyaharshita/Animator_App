import 'package:animator_app/utils/MyRoutes.dart';
import 'package:animator_app/views/screens/planet_home_page.dart';
import 'package:animator_app/views/screens/ripple_animation_page.dart';
import 'package:flutter/material.dart';

import 'views/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: MyRoutes.planethomepage,
      routes: {
        MyRoutes.home: (context) => HomePage(),
        MyRoutes.RippleAnimationpage: (context) => RippleAnimationPage(),
        MyRoutes.planethomepage: (context) => PlanetHomePage(),
      },
    );
  }
}
