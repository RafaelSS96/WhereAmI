import 'dart:math';
import 'dart:io';
import 'package:flutter/material.dart';
import '../models/place.dart';
import '../utils/db_utils.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  Future<void> loadPlaces() async {
    final dataList = await DbUtil.getData("greatPlaces");
    _items = dataList.map(
      (item) => Place(
        id: item['id'],
        title: item['title'],
        image: File(item['image']),
        location: null,
      ),
    ).toList();
    notifyListeners();
  }

  int get itemsCount {
    return _items.length;
  }

  Place itemByIndex(int index) {
    return _items[index];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: Random().nextDouble().toString(),
      title: title,
      image: image,
      location: null,
    );

    _items.add(newPlace);
    DbUtil.insert(
      "greatPlaces",
      {
        "id": newPlace.id,
        "title": newPlace.title,
        "image": newPlace.image.path,
      },
    );
    notifyListeners();
  }
}
