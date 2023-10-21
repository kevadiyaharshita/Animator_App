import 'dart:async';
import 'dart:math';

import 'package:animator_app/helper/json_helper.dart';
import 'package:animator_app/modals/planetmodal.dart';
import 'package:animator_app/utils/MyRoutes.dart';
import 'package:circle_list/circle_list.dart';
import 'package:flutter/material.dart';

import '../../components/planet_item.dart';
import '../../utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  int angle = 0;
  int planet1 = 0;
  int planet2 = 0;
  int index = 0;
  String direction = '';
  nextPlanet() {
    if (direction == 'next') {
      if ((currentIndex % 8) % 2 == 0) {
        planet2 = planet2 % 8 + 2 as int;
      } else {
        planet1 = planet1 % 8 + 2;
      }
    } else {
      setState(() {
        planet2 = currentIndex;
        planet1 = currentIndex;
      });
      if ((currentIndex % 8) % 2 == 0) {
        planet1 = currentIndex % 8;
        planet2 = (planet2 + 1) % 8;
      } else {
        planet1 = (planet1 + 1) % 8;
        planet2 = currentIndex % 8;
      }
    }
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      var stop = 0;
      index % 2 == 0 ? stop = 360 : stop = 180;
      if (angle.abs() == stop) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          angle += 10;
        });
      }
    });
    setState(() {
      angle.abs() == 360 ? angle = 0 : angle = angle.abs();
      index++;
      currentIndex = index % 8;
      direction = 'next';
    });
  }

  prevPlanet() {
    if (direction == 'prev') {
      if ((currentIndex % 8) % 2 == 0) {
        planet2 = (planet2 - 2) % 8;
      } else {
        planet1 = (planet1 - 2) % 8;
      }
    } else {
      setState(() {
        planet2 = currentIndex;
        planet1 = currentIndex;
      });
      if ((currentIndex % 8) % 2 == 0) {
        planet1 = currentIndex % 8;
        planet2 = (planet2 - 1) % 8;
      } else {
        planet1 = (planet1 - 1) % 8;
        planet2 = currentIndex % 8;
      }
    }
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      var stop = 0;
      index % 2 == 0 ? stop = 0 : stop = 180;
      if (angle.abs() == stop) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          angle -= 10;
        });
      }
    });
    setState(() {
      angle == 360 ? angle = 0 : angle = angle.abs();
      index--;
      currentIndex = index % 8;
      direction = 'prev';
    });
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Scaffold(
        backgroundColor: darkBlue,
        body: FutureBuilder(
          future: JsonHelper.jsonhelper.getPlanetData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<PlanetModal> pm = snapshot.data!;
              return SizedBox(
                width: w,
                height: h,
                child: Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 50,
                      // left: 20,
                      right: 20,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(MyRoutes.planethomepage);
                            },
                            icon: Icon(
                              Icons.preview,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(MyRoutes.planethomepage);
                            },
                            icon: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: -300,
                      child: CircleList(
                          outerRadius: 836 / 2,
                          innerRadius: 800 / 2,
                          initialAngle: -1.55 - (currentIndex * 0.15),
                          children: List.generate(
                              8 * 5,
                              (index) => AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: currentIndex == index
                                            ? white.withOpacity(0.3)
                                            : transparent),
                                    child: AnimatedContainer(
                                      width: 10,
                                      height: 10,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: currentIndex == index
                                              ? white
                                              : white.withOpacity(0.3)),
                                    ),
                                  ))),
                    ),
                    //planets name
                    Positioned(
                      top: 220,
                      child: AnimatedOpacity(
                        duration: const Duration(microseconds: 200),
                        curve: Curves.easeInOut,
                        opacity: angle <= 180 && angle > 0
                            ? angle / 180
                            : angle > 180 && angle <= 360
                                ? angle / 360
                                : (180 - angle) / 180,
                        child: Hero(
                          tag: pm[currentIndex].name!,
                          child: Material(
                            color: transparent,
                            child: Column(
                              children: [
                                Text(pm[currentIndex].name!.toUpperCase(),
                                    style: const TextStyle(
                                        color: white,
                                        // fontFamily: 'Montserrat',
                                        letterSpacing: 1.2,
                                        fontSize: 42,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 5),
                                Text(
                                    currentIndex != 2
                                        ? 'Neighbor'
                                        : 'Our Lovely Home',
                                    style: const TextStyle(
                                        color: white,
                                        fontSize: 14,
                                        // fontFamily: 'Montserrat',
                                        letterSpacing: 1.2,
                                        fontWeight: FontWeight.normal)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    //planets
                    Positioned(
                      height: 500,
                      width: 620,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () {
                          currentIndex != 8
                              ? nextPlanet()
                              : ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: darkBlue,
                                    elevation: 1,
                                    margin: EdgeInsets.all(20),
                                    behavior: SnackBarBehavior.floating,
                                    content: Text(
                                      'No Data found!!',
                                      style: TextStyle(
                                          color: white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                );
                        },
                        onLongPress: () {
                          Navigator.of(context).pushNamed(MyRoutes.detail_page,
                              arguments: pm[currentIndex]);
                        },
                        child: Hero(
                          tag: pm[currentIndex].image!,
                          child: Container(
                            width: 620,
                            color: transparent,
                            child: Transform.rotate(
                              angle: -angle * pi / 180,
                              alignment: Alignment.bottomCenter,
                              child: Stack(
                                alignment: Alignment.center,
                                clipBehavior: Clip.none,
                                children: [
                                  // 1
                                  Positioned(
                                    width: 620,
                                    height: 620,
                                    top: 0,
                                    child: Transform.rotate(
                                      alignment: Alignment.center,
                                      angle: -angle * pi / 180,
                                      child: AnimatedOpacity(
                                        opacity: angle > 180 && angle <= 360
                                            ? angle / 360
                                            : angle < 180
                                                ? (180 - angle) / 180
                                                : 0,
                                        duration:
                                            const Duration(milliseconds: 900),
                                        child: PlanetItem(
                                            image: pm[planet1 % 8].image),
                                      ),
                                    ),
                                  ),
                                  //2
                                  Positioned(
                                    width: 620,
                                    height: 620,
                                    // top: 0,
                                    bottom: -500,
                                    child: Transform.rotate(
                                      alignment: Alignment.center,
                                      angle: -angle * pi / 180,
                                      child: AnimatedOpacity(
                                        opacity: angle > 0 && angle <= 180
                                            ? angle / 180
                                            : 0,
                                        duration:
                                            const Duration(milliseconds: 900),
                                        child: PlanetItem(
                                            image: pm[planet2 % 8].image),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }
}
