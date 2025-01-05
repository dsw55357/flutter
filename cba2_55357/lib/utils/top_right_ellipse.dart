import 'package:flutter/material.dart';

class TopRightEllipse extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final double top;
  final double left;

  const TopRightEllipse({
    Key? key,
    required this.color,
    this.width = 142.0,
    this.height = 142.0,
    this.top = -47.0,
    this.left = 381.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: top,
          left: left,
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
