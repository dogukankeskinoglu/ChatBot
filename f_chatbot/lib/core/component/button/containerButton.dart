import 'package:flutter/material.dart';

class ContainerButton extends StatelessWidget {
  final VoidCallback containerOnpressed;
  final Color containerColor;
  final String containerText;
  final double containerHeightRate;
  final double containerWidthRate;
  final double containerRadius;

  const ContainerButton(
      {Key? key,
      required this.containerOnpressed,
      required this.containerColor,
      required this.containerText,
      required this.containerHeightRate,
      required this.containerWidthRate,
      required this.containerRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Text(
          containerText,
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.start,
        ),
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * containerHeightRate,
        width: MediaQuery.of(context).size.width * containerWidthRate,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(containerRadius),
            color: containerColor),
      ),
      onTap: containerOnpressed,
    );
  }
}
