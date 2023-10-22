import 'dart:math';

import 'package:animator_app/components/details_data_of_planet.dart';
import 'package:animator_app/controllers/favourite_controller.dart';
import 'package:animator_app/modals/planetmodal.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation rotateAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 60),
      animationBehavior: AnimationBehavior.preserve,
    );

    rotateAnimation = Tween(begin: 0, end: 1.99).animate(
      animationController,
    );
    animationController.forward();
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;

    PlanetModal pm = ModalRoute.of(context)!.settings.arguments as PlanetModal;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://i.pinimg.com/564x/43/87/80/43878074311d7469f695b7b097ede81e.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 30,
                child: Row(
                  children: [
                    SizedBox(
                      width: 18,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: 290,
                    ),
                    Consumer<FavouriteController>(builder: (context, p, _) {
                      return IconButton(
                          onPressed: () {
                            p.addFavourite(name: pm.name);
                          },
                          icon: Icon(
                            (p.checkStatus(name: pm.name))
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.white,
                            size: 30,
                          ));
                    }),
                    SizedBox(
                      width: 18,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 200,
                child: Container(
                  height: h - 236,
                  width: w - 36,
                  margin: EdgeInsets.all(18),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xff132646).withOpacity(0.8),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 120,
                      ),
                      Text(
                        pm.name.toUpperCase(),
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      detail_Data(pm: pm),
                    ],
                  ),
                ),
              ),
              AnimatedBuilder(
                animation: rotateAnimation,
                builder: (context, child) {
                  return Positioned(
                    bottom: 480,
                    child: Hero(
                      tag: pm.image,
                      child: Transform.rotate(
                        angle: (pi * rotateAnimation.value),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(pm.image),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
