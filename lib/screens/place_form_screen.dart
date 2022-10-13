import 'package:flutter/material.dart';
import 'package:where_are_u/widgets/image_imput.dart';

class PlaceFormScreen extends StatefulWidget {
  const PlaceFormScreen({Key? key}) : super(key: key);

  @override
  State<PlaceFormScreen> createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {



 void _submitform () {}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Novo Lugar"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: const <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: "Título"),
                    ),
                    SizedBox(height: 10),
                    ImageImputWidget(),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).secondaryHeaderColor,  
              onPrimary: Colors.black,
              elevation: 0,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap
            ),
            
            onPressed: _submitform,
            icon: const Icon(Icons.add),
            label: const Text("Adicionar!"),
          )
        ],
      ),
    );
  }
}
