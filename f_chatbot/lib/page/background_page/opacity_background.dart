import 'package:flutter/material.dart';

class OpacityBackGround extends StatelessWidget {
  final double opacity;
  final double heightPercent;
  final double widthPercent;
  final String imgsrc;

  const OpacityBackGround({Key? key, this.opacity = 0.2, required this.imgsrc,this.heightPercent=0.5, this.widthPercent=1})
      : super(key: key);
  @override
  Opacity build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        height: MediaQuery.of(context).size.height*heightPercent,
        width: MediaQuery.of(context).size.width*widthPercent,
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
