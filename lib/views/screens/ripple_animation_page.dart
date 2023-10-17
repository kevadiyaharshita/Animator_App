import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RippleAnimationPage extends StatefulWidget {
  const RippleAnimationPage({super.key});

  @override
  State<RippleAnimationPage> createState() => _RippleAnimationPageState();
}

class _RippleAnimationPageState extends State<RippleAnimationPage>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;

  var listRadious = [150.0, 200.0, 250.0, 300.0, 350.0];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(seconds: 4), lowerBound: 0.5);
    // animation = Tween(begin: 0.0, end: 1.0).animate(animationController);

    animationController.addListener(() {
      setState(() {});
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            buildMyContainer(listRadious[0]),
            buildMyContainer(listRadious[1]),
            buildMyContainer(listRadious[2]),
            buildMyContainer(listRadious[3]),
            buildMyContainer(listRadious[4]),
            Icon(
              CupertinoIcons.heart_solid,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  Widget buildMyContainer(radious) {
    return Container(
      height: radious * animationController.value,
      width: radious * animationController.value,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue.withOpacity(1.0 - animationController.value),
      ),
    );
  }
}
