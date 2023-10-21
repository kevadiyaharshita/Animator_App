import 'package:animator_app/modals/planetmodal.dart';
import 'package:flutter/material.dart';

Widget detail_Data({required PlanetModal pm}) {
  return Container(
    height: 374,
    padding: EdgeInsets.only(top: 0, right: 10, left: 10, bottom: 0),
    child: SingleChildScrollView(
      child: Column(
        children: [
          //distance
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'DISTANCE FROM EARTH : \t',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${pm.distancefromEarth} KM',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ],
          ),

          //velocity
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'VELOCITY \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t:  ',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${pm.velocity} ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              Spacer(),
            ],
          ),

          //size
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SIZE\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t:  ',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${pm.size} ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              Spacer(),
            ],
          ),

          // satelatite
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SATELLITE\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t:  ',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${pm.satellites} ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              Spacer(),
            ],
          ),

          //temprature
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'TEMPERETURE\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t:  ',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${pm.temperature} ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              Spacer(),
            ],
          ),

          //orbitalspeed
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ORBITALSPEED\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t:  ',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${pm.orbitalSpeed} ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              Spacer(),
            ],
          ),

          //orbitalspeed
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SURFACEAREA \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t:  ',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${pm.surfaceArea} ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              Spacer(),
            ],
          ),

          //orbitalspeed
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ROTATION PERIOD\t\t\t\t\t\t\t\t\t\t\t\t:  ',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '${pm.rotationPeriod} ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              Spacer(),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          //Discription
          Text(
            "DISCRIPTION",
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '${pm.description} ',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ],
      ),
    ),
  );
}
