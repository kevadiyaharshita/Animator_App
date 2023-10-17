import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';

import '../modals/planetmodal.dart';

class JsonHelper {
  JsonHelper._();
  static final JsonHelper jsonhelper = JsonHelper._();

  Future<List> getPlanetData() async {
    String data = await rootBundle.loadString('assets/json/planet_data.json');
    List planet = jsonDecode(data);
    log('json Data : ${planet.runtimeType}');
    List allPlanet = planet.map((e) => PlanetModal.fromMap(planet: e)).toList();
    log('data Gated');
    return allPlanet;
  }
}
