import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'colors.dart';


class Functions{


  showLoaderDialog(BuildContext context , {String text = 'Loading'}){
    AlertDialog alert= AlertDialog(
      // backgroundColor: CColors.appBgColor,
      content: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30 , vertical: 10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // CircularProgressIndicator(
            //   color: CColors.primary,
            // ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child:Text("$text..." ,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  // color: CColors.primary,
                  fontFamily: 'rm',
                  fontSize: 18,
                ),
              ),
            ),
          ],),
      ),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }


  static showSnackBar(BuildContext context, String message, {Color? color}){
    color ??= CColors.primaryColor;
    final snackBar = SnackBar(
      backgroundColor: color,
      content: Text(message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static showSignInDialog(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 50));
    AlertDialog alert = AlertDialog(
      elevation: 0,
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent.withOpacity(0),
      content: SpinKitChasingDots(
        color: CColors.primaryColor,
        size: 50.0,
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}