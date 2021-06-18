import 'package:flutter/material.dart';

class InkwellContainer extends StatelessWidget {
  final VoidCallback onPressed;
  final String imgSrc;
  final String text;
  final double heightPercent;
  final double widthPercent;

  const InkwellContainer({
    Key? key,
    required this.onPressed,
    required this.imgSrc,
    required this.text, 
    this.heightPercent=0.5, 
    this.widthPercent=0.3,

  }) : super(key: key);

  @override
  InkWell build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: MediaQuery.of(context).size.height*heightPercent,
        width: MediaQuery.of(context).size.width*widthPercent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imgSrc,
              fit: BoxFit.cover,
            ),
            Text(text)
          ],
        ),
      ),
    );
  }
}
