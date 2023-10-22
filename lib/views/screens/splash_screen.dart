import 'dart:async';

import 'package:flutter/material.dart';

import '../../utils/MyRoutes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer.periodic(
      Duration(seconds: 4),
      (timer) {
        Navigator.of(context).pushReplacementNamed(MyRoutes.home);
        timer.cancel();
      },
    );
    Size s = MediaQuery.of(context).size;
    return Container(
      height: s.height,
      width: s.width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://i.pinimg.com/564x/43/18/63/4318638413e2bdcc20d944888037c77c.jpg'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
