import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:where_are_u/providers/grate_places.dart';
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
      body: Consumer<GreatPlaces>(
        child: const Center(
          child: Text('Nenhum local salvo!'),
        ),
        builder: (ctx, greatPlaces, child) => greatPlaces.itemsCount == 0
            ? child!
            : ListView.builder(
                itemCount: greatPlaces.itemsCount,
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(
                      greatPlaces.itemByIndex(i).image,
                    ),
                  ),
                  title: Text(greatPlaces.itemByIndex(i).title),
                  onTap: () {},
                ),
              ),
      ),
    );
  }
}
