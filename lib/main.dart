import 'package:animator_app/controllers/favourite_controller.dart';
import 'package:animator_app/utils/MyRoutes.dart';
import 'package:animator_app/views/screens/detail_page.dart';
import 'package:animator_app/views/screens/planet_home_page.dart';
import 'package:animator_app/views/screens/ripple_animation_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'views/screens/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavouriteController(prefences: preferences),
      child: MyApp(),
    ),
  );
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
      initialRoute: MyRoutes.home,
      routes: {
        MyRoutes.home: (context) => HomePage(),
        MyRoutes.RippleAnimationpage: (context) => RippleAnimationPage(),
        MyRoutes.planethomepage: (context) => PlanetHomePage(),
        MyRoutes.detail_page: (context) => DetailPage(),
      },
    );
  }
}
