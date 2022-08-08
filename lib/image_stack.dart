import 'package:flutter/material.dart';

class ImageStack extends StatelessWidget {
  final String imageUrl;
  final double rotationAngle;
  final double opacity;

  const ImageStack({
    Key? key,
    required this.imageUrl,
    required this.rotationAngle,
    this.opacity = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotationAngle,
      child: Opacity(
        opacity: opacity,
        child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.white, width: 5),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).shadowColor,
                      offset: const Offset(5, 5),
                      blurRadius: 20.0,
                      spreadRadius: 2.0),
                  const BoxShadow(
                      color: Colors.white,
                      offset: Offset.zero,
                      blurRadius: 0.0,
                      spreadRadius: 0.0)
                ]),
            child: Image.network(imageUrl)),
      ),
    );
  }
}
