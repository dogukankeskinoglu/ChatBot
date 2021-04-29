import 'package:flutter/material.dart';

class OpacityBackGround extends StatelessWidget {
  final double opacity;
  final String imgsrc;

  const OpacityBackGround({Key? key, this.opacity = 0.2, required this.imgsrc})
      : super(key: key);
  @override
  Opacity build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(90),
              bottomRight: Radius.circular(90)),
          image: DecorationImage(
            image: AssetImage(
              imgsrc,
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
