import 'package:flutter/material.dart';
import '../extras/app_text_style.dart';

class HeaderTextWidget extends StatelessWidget {
  const HeaderTextWidget({required this.text, Key? key}) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: AppTextStyle.quickSand(
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }
}
