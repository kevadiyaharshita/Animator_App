import 'dart:math';

import 'package:animator_app/helper/json_helper.dart';
import 'package:animator_app/modals/planetmodal.dart';
import 'package:animator_app/utils/MyRoutes.dart';
import 'package:flutter/material.dart';

class PlanetHomePage extends StatefulWidget {
  const PlanetHomePage({super.key});

  @override
  State<PlanetHomePage> createState() => _PlanetHomePageState();
}

class _PlanetHomePageState extends State<PlanetHomePage>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation rotateAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 60),
        animationBehavior: AnimationBehavior.preserve);

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
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://i.pinimg.com/564x/e2/15/9d/e2159ddc554a0f0b9aa64ed16346311c.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: FutureBuilder(
            future: JsonHelper.jsonhelper.getPlanetData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<PlanetModal> pm = snapshot.data!;
                return AnimatedBuilder(
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: (pi * rotateAnimation.value),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Transform.rotate(
                            angle: -(pi * rotateAnimation.value),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(pm[8].image),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),

                          //Mercury
                          Stack(
                            children: [
                              Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                ),
                              ),
                              Positioned(
                                bottom: -5,
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(pm[0].image),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          //Venus
                          Stack(
                            children: [
                              Container(
                                width: 190,
                                height: 190,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                ),
                              ),
                              Positioned(
                                child: Container(
                                  height: 65,
                                  width: 65,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(pm[1].image),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          //Earth
                          Stack(
                            children: [
                              Container(
                                width: 270,
                                height: 270,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                ),
                              ),
                              Positioned(
                                // left: -5,
                                bottom: 10,
                                child: Container(
                                  height: 75,
                                  width: 75,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(pm[2].image),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Mars
                          Stack(
                            children: [
                              Container(
                                width: 340,
                                height: 340,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                ),
                              ),
                              Positioned(
                                right: -5,
                                top: 60,
                                child: Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(pm[3].image),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // jupitar
                          Stack(
                            children: [
                              Transform.scale(
                                scale: 1.09,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 495,
                                left: 280,
                                // right: -5,
                                child: Container(
                                  height: 125,
                                  width: 125,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(pm[4].image),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Saturn
                          Stack(
                            children: [
                              Transform.scale(
                                scale: 1.36,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 150,
                                top: 30,
                                child: Container(
                                  height: 135,
                                  width: 135,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(pm[5].image),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Uranus
                          Stack(
                            children: [
                              Transform.scale(
                                scale: 1.56,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                right: 250,
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(pm[6].image),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Neptune
                          Stack(
                            children: [
                              Transform.scale(
                                scale: 1.8,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(pm[7].image),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  animation: rotateAnimation,
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

// ListView.builder(
// itemCount: snapshot.data!.length,
// itemBuilder: (context, index) {
// PlanetModal pm = snapshot.data![index];
// return Card(
// child: ListTile(
// title: Text('${pm.name}'),
// ),
// );
// },
// );
