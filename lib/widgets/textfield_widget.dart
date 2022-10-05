import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../extras/colors.dart';

class TextFieldWidget extends StatelessWidget {
  String hintText;
  TextEditingController controller;
  bool obsText = false;
  bool icon = false;
  bool format = false;
  TextInputType keyboardType;
  int numOfLines = 1;
  Function(String)? onChanged;

  TextFieldWidget(
      {Key? key,
      required this.hintText,
      this.keyboardType = TextInputType.text,
      this.numOfLines = 1,
      this.format = false,
      this.obsText = false,
      this.icon = false,
      required this.controller,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: numOfLines,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obsText,
      onChanged: onChanged,
      inputFormatters: [
        if (hintText == 'Add Expense' || format == true)
          FilteringTextInputFormatter.allow(RegExp(r'(^-?\d*\.?\d*)')),
      ],
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: CColors.darkgray,
          fontSize: 15,
        ),
        suffixIcon: (icon == true) ? Icon(Icons.color_lens_rounded) : null,
        fillColor: CColors.orange,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(width: 0, style: BorderStyle.none),
        ),
      ),
    );
  }
}
