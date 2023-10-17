import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            TweenAnimationBuilder(
              tween: Tween(
                begin: 20.0,
                end: 400.0,
              ),
              duration: Duration(seconds: 2),
              builder: (context, value, child) {
                return AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  height: value,
                  width: value,
                  decoration: BoxDecoration(
                    color: Colors.primaries[value ~/ 100],
                    borderRadius: BorderRadius.circular(50),
                  ),
                );
              },
            ),
            TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: 60.0),
              duration: const Duration(seconds: 4),
              builder: (context, value, child) {
                return Opacity(
                  opacity: value / 100,
                  child: Text(
                    "Flutter\nDeveloper",
                    style: TextStyle(
                        fontSize: value.toDouble(),
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
