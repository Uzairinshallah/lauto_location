import 'package:flutter/material.dart';

import '../extras/app_text_style.dart';
import '../extras/colors.dart';




class GetButton extends StatelessWidget {
  String text;
  Function onTap;
  Color ?color;
  GetButton({Key? key, required this.text, required this.onTap, this.color = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 37,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: CColors.primaryColor,
            padding: EdgeInsets.symmetric(vertical: 15.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          onPressed: () {
            onTap();
          },
          child: Text(
            text,
            style: AppTextStyle.spliceSans(
              style: TextStyle(
                color: (text == 'Confirm Date') ? Colors.white : color,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
