import 'package:flutter/material.dart';

enum StackStyle {
  card(0.1),
  zigZag(0.15);

  final double value;
  const StackStyle(this.value);
}

class ImageStack extends StatelessWidget {
  final List<String> imageCollection;
  final StackStyle stackStyle;
  final double frameWidth;
  final double frameHeight;
  final Color frameBorderColor;
  final double frameBorderWidth;
  final BorderStyle frameBorderStyle;

  const ImageStack(
      {Key? key,
      required this.imageCollection,
      required this.stackStyle,
      this.frameWidth = 250,
      this.frameHeight = 250,
      this.frameBorderColor = Colors.white,
      this.frameBorderWidth = 0.0,
      this.frameBorderStyle = BorderStyle.none})
      : super(key: key);

  double calculateRotationAngle(int itemKey) {
    switch (stackStyle) {
      case StackStyle.card:
        return itemKey * stackStyle.value;
      case StackStyle.zigZag:
        return itemKey % 2 == 0
            ? itemKey * stackStyle.value
            : itemKey * -stackStyle.value;
      default:
        return 0.1;
    }
  }

  Widget imageHolder(String imageUrl, double rotationAngle) {
    return Transform.rotate(
      angle: rotationAngle,
      child: Opacity(
        opacity: 1.0,
        child: Container(
            width: frameWidth,
            height: frameHeight,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(
                  color: frameBorderColor,
                  width: frameBorderWidth,
                  style: frameBorderStyle),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image.network(imageUrl)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: imageCollection
            .asMap()
            .entries
            .map((item) => imageHolder(
                  item.value,
                  calculateRotationAngle(item.key),
                ))
            .toList());
  }
}
