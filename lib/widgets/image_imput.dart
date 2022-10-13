import 'package:flutter/material.dart';

class ImageImputWidget extends StatefulWidget {
  const ImageImputWidget({Key? key}) : super(key: key);

  @override
  State<ImageImputWidget> createState() => _ImageImputWidgetState();
}

class _ImageImputWidgetState extends State<ImageImputWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 180,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          alignment: Alignment.center,
          child: const Text("Sem imagem."),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt),
            label: const Text("Tirar foto."),
          ),
        )
      ],
    );
  }
}
