import 'package:flutter/material.dart';

class InkwellContainer extends StatelessWidget {
  final VoidCallback onPressed;
  final String img_src;
  final String text;

  const InkwellContainer({
    Key? key,
    required this.onPressed,
    required this.img_src,
    required this.text,
  }) : super(key: key);

  @override
  InkWell build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width / 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              img_src,
              fit: BoxFit.cover,
            ),
            Text(text)
          ],
        ),
      ),
    );
  }
}
