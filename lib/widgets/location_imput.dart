import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationImputWidget extends StatefulWidget {
  const LocationImputWidget({Key? key}) : super(key: key);

  @override
  State<LocationImputWidget> createState() => _LocationImputWidgetState();
}

class _LocationImputWidgetState extends State<LocationImputWidget> {
  String? _previewImageURL;

Future<void> _getCurrentUserLocation () async {
  final locData = await Location().getLocation();
  print (locData.latitude);
  print (locData.longitude);
}


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _previewImageURL == null
              ? const Text("Localização não informada.")
              : Image.network(
                  _previewImageURL!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton.icon(
              onPressed: _getCurrentUserLocation,
              icon: const Icon(Icons.location_on),
              label: Text(
                "Localização atual.",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.map),
              label: Text(
                "Selecione no mapa.",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        )
      ],
    );
  }
}
