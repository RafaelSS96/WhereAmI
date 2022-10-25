import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/great_places.dart';
import '../utils/app_route.dart';
import '../screens/place_detail_screen.dart';
import '../screens/place_form_screen.dart';
import '../screens/places_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider
    (
      create: (context) => GreatPlaces() ,
      child: MaterialApp(
        title: 'Where are You?',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          secondaryHeaderColor: Colors.amber,
        ),
        home: const PlacesListScreen(),
        routes: {
          AppRoute.placeForm: (ctx) => const PlaceFormScreen(),
          AppRoute.placeDetail: (ctx) => const PlaceDetailScreen()
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
