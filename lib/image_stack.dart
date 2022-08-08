import 'package:flutter/material.dart';

enum StackStyle {
  card(0.1),
  zigZag(-0.2);

  final double value;
  const StackStyle(this.value);
}

class ImageStack extends StatelessWidget {
  final List<String> imageCollection;
  final StackStyle stackStyle;

  const ImageStack(
      {Key? key, required this.imageCollection, required this.stackStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: imageCollection
            .asMap()
            .entries
            .map((item) => imageHolder(item.value, item.key * stackStyle.value))
            .toList());
  }

  Widget imageHolder(String imageUrl, double rotationAngle) {
    return Transform.rotate(
      angle: rotationAngle,
      child: Opacity(
        opacity: 1.0,
        child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              //border: Border.all(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(5),
              // boxShadow: const <BoxShadow>[
              //   BoxShadow(
              //       color: Colors.black,
              //       offset: Offset(5, 5),
              //       blurRadius: 20.0,
              //       spreadRadius: 2.0),
              //   BoxShadow(
              //       color: Colors.white,
              //       offset: Offset.zero,
              //       blurRadius: 0.0,
              //       spreadRadius: 0.0)
              // ]
            ),
            child: Image.network(imageUrl)),
      ),
    );
  }
}
