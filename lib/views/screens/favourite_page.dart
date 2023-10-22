import 'dart:math';

import 'package:animator_app/controllers/favourite_controller.dart';
import 'package:animator_app/helper/json_helper.dart';
import 'package:animator_app/modals/planetmodal.dart';
import 'package:animator_app/utils/MyRoutes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage>
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
    return Container(
      width: s.width,
      height: s.height,
      // decoration: BoxDecoration(
      //     image: DecorationImage(
      //         image: NetworkImage(
      //             'https://i.pinimg.com/564x/43/87/80/43878074311d7469f695b7b097ede81e.jpgs'),
      //         fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            "Favourite",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: FutureBuilder(
              future: JsonHelper.jsonhelper.getPlanetData(),
              builder: (context, snapshot) {
                return (snapshot.hasData)
                    ? Consumer<FavouriteController>(
                        builder: (context, p, _) {
                          List<PlanetModal> pm = snapshot.data!;
                          List<PlanetModal> allFavouritePlanet = [];
                          pm.forEach((element) {
                            if (p.getAllFavourite.contains(element.name)) {
                              allFavouritePlanet.add(element);
                            }
                          });
                          return (allFavouritePlanet.isNotEmpty)
                              ? GridView.builder(
                                  itemCount: p.getAllFavourite.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 2 / 2.5,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                            MyRoutes.detail_page,
                                            arguments:
                                                allFavouritePlanet[index]);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xff132646)
                                              .withOpacity(0.8),
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                        child: Column(
                                          children: [
                                            AnimatedBuilder(
                                              animation: rotateAnimation,
                                              builder: (context, child) {
                                                return Hero(
                                                  tag: allFavouritePlanet[index]
                                                      .image,
                                                  child: Transform.rotate(
                                                    angle: (pi *
                                                        rotateAnimation.value),
                                                    child: Image(
                                                      image: AssetImage(
                                                          allFavouritePlanet[
                                                                  index]
                                                              .image),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                            Text(
                                              allFavouritePlanet[index].name,
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : Text(
                                  "Nodata Found",
                                  style: TextStyle(color: Colors.white),
                                );
                        },
                      )
                    : CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}
