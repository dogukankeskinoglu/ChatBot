import 'package:flutter/material.dart';

class ContainerButton extends StatelessWidget {
  final VoidCallback containerOnpressed;
  final Color containerColor;
  final String containerText;
  final double containerHeight;
  final double containerWidth;
  final Radius containerRadius;

  const ContainerButton(
      {Key? key,
      required this.containerOnpressed,
      required this.containerColor,
      required this.containerText,
      required this.containerHeight,
      required this.containerWidth,
      required this.containerRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Text(
          containerText,
          style: TextStyle(color: Colors.white),
        ),
        alignment: Alignment.center,
        height: containerHeight,
        width: containerWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(containerRadius),
            color: containerColor),
      ),
      onTap: containerOnpressed,
    );
  }
}
