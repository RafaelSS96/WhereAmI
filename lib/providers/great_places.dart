import 'dart:math';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/place.dart';
import '../utils/db_utils.dart';
import '../utils/location_utils.dart';

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
        location: PlaceLocation(
              latitude: item['latitude'],
              longitude: item['longitude'],
              address: item['address'],
            ),
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

  void addPlace(String title, File image, LatLng position) async  {

String address = await LocationUtil.getAddressFrom(position);

    final newPlace = Place(
      id: Random().nextDouble().toString(),
      title: title,
      image: image,
      location: PlaceLocation(
        latitude: position.latitude,
        longitude: position.longitude,
        address: address,
      ),
    );

    _items.add(newPlace);
    DbUtil.insert(
      "greatPlaces",
      {
        "id": newPlace.id,
        "title": newPlace.title,
        "image": newPlace.image.path,
        "latidude" : position.latitude,
        "longitude" : position.longitude,
        "address": address
      },
    );
    notifyListeners();
  }
}
