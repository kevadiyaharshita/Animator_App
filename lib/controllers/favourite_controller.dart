import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteController extends ChangeNotifier {
  List<String> _allFavourite = [];
  SharedPreferences prefences;
  FavouriteController({required this.prefences}) {
    _allFavourite = getAllFavourite;
  }

  addFavourite({required String name}) {
    if (_allFavourite.contains(name)) {
      _allFavourite.remove(name);
    } else {
      _allFavourite.add(name);
    }
    prefences.setStringList('allfavouriteplanets', _allFavourite);
    notifyListeners();
  }

  bool checkStatus({required String name}) {
    if (_allFavourite.contains(name)) {
      return true;
    } else {
      return false;
    }
  }

  get getAllFavourite {
    _allFavourite = prefences.getStringList('allfavouriteplanets') ?? [];
    return _allFavourite;
  }
}
