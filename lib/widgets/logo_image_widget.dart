import 'package:flutter/material.dart';

class LogoImageWidget extends StatefulWidget {
  const LogoImageWidget({Key? key}) : super(key: key);

  @override
  State<LogoImageWidget> createState() => _LogoImageWidgetState();
}

class _LogoImageWidgetState extends State<LogoImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 80),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image(
          image: AssetImage("assets/images/Lauto.png"),
          width: 200,
          height: 100,
          fit: BoxFit.fill,
        ),
      ),
    );;
  }
}
