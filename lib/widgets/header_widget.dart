import 'package:flutter/material.dart';


import 'package:iconly/iconly.dart';

import 'header_text_widget.dart';

class HeaderWidget extends StatelessWidget {
  HeaderWidget({required this.text, Key? key}) : super(key: key);

  String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
          },
          child: Icon(
            IconlyLight.arrow_left,
            color: Colors.transparent,
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03,
            ),
            child: HeaderTextWidget(text: text,),
          ),
        ),
      ],
    );
  }
}
