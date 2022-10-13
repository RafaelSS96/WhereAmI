import 'package:flutter/material.dart';
import 'package:where_are_u/screens/place_form_screen.dart';
import 'package:where_are_u/utils/app_route.dart';
import '../screens/places_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Where are You?',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        secondaryHeaderColor: Colors.amber,
      ),
      home: const PlacesListScreen(),
      routes: {
        AppRoute.place_form: (ctx) => const PlaceFormScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
