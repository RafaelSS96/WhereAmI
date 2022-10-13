import 'package:flutter/material.dart';
import 'package:where_are_u/utils/app_route.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Where am i?"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoute.placeForm);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: const Center(
        child:  CircularProgressIndicator(),
      ),
    );
  }
}
