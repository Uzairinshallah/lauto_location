import 'package:flutter/material.dart';

class CColors{
  // static final PrimaryColor =  Color(0xFF1CC072);
  // static final PrimaryAssentColor =  Color(0xFF73DFAB);

  static final primaryColor =  Color(0xFF1A17A6);
  static final secColor =  Color(0xFF5C14F5);
  static final PrimaryAssentColor =  Color(0xFF38CEEF);
  // static final PrimaryDarkColor =  Color(0xFF17b369);

  static final darkestgray =  Color(0xFF808080);
  static final darkgray =  Color(0xFFA9A9A9);
  static final lightgray =  Color(0xFFD3D3D3);
  static final textblack = Color(0xFF242020);
  static final lightestgray =  Color(0xFFE0E0E0);


  static final gold = Color(0xFFFFBF00);
  static final orange = Color(0xFFFF7800);
  static final darkhome = Color(0xFF221D1D);


  static Map<int, Color> getSwatch(Color color) {
    final hslColor = HSLColor.fromColor(color);
    final lightness = hslColor.lightness;

    /// if [500] is the default color, there are at LEAST five
    /// steps below [500]. (i.e. 400, 300, 200, 100, 50.) A
    /// divisor of 5 would mean [50] is a lightness of 1.0 or
    /// a color of #ffffff. A value of six would be near white
    /// but not quite.
    final lowDivisor = 6;

    /// if [500] is the default color, there are at LEAST four
    /// steps above [500]. A divisor of 4 would mean [900] is
    /// a lightness of 0.0 or color of #000000
    final highDivisor = 5;

    final lowStep = (1.0 - lightness) / lowDivisor;
    final highStep = lightness / highDivisor;

    return {
      50: (hslColor.withLightness(lightness + (lowStep * 5))).toColor(),
      100: (hslColor.withLightness(lightness + (lowStep * 4))).toColor(),
      200: (hslColor.withLightness(lightness + (lowStep * 3))).toColor(),
      300: (hslColor.withLightness(lightness + (lowStep * 2))).toColor(),
      400: (hslColor.withLightness(lightness + lowStep)).toColor(),
      500: (hslColor.withLightness(lightness)).toColor(),
      600: (hslColor.withLightness(lightness - highStep)).toColor(),
      700: (hslColor.withLightness(lightness - (highStep * 2))).toColor(),
      800: (hslColor.withLightness(lightness - (highStep * 3))).toColor(),
      900: (hslColor.withLightness(lightness - (highStep * 4))).toColor(),
    };
  }

}
// class Functions{
//   showLoaderDialog(BuildContext context , {String text = 'Loading'}){
//     AlertDialog alert=AlertDialog(
//       content: new Row(
//         children: [
//           CircularProgressIndicator(
//             backgroundColor: CColors.PrimaryColor,
//           ),
//           Container(margin: EdgeInsets.only(left: 7),child:Text("$text..." )),
//         ],),
//     );
//     showDialog(barrierDismissible: false,
//       context:context,
//       builder:(BuildContext context){
//         return alert;
//       },
//     );
//   }
// }
