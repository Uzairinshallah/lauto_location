import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lauto_location/screens/AuthPhone/register_as.dart';
import 'package:lauto_location/screens/AuthPhone/signup_form.dart';
import 'package:lauto_location/screens/AuthPhone/signup_phone_auth_page.dart';

import '../../extras/colors.dart';

class SignUpPageP extends StatelessWidget {
  SignUpPageP({Key? key}) : super(key: key);
  late double screenWidth;
  late double screenHeight;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    if (screenWidth > 450) {
      screenWidth = 450;
    }
    return Scaffold(
      body: kIsWeb ? webView(context) : mainWidget(context),
    );
  }

  Widget webView(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: CColors.primaryColor,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: screenWidth,
          child: Card(elevation: 10, child: mainWidget(context)),
        ),
      ),
    );
  }

  Widget mainWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: screenWidth * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.3),
            imgWidget(),
            SizedBox(height: screenHeight * 0.03),
            txt1(),
            SizedBox(height: screenHeight * 0.01),
            txt2(),
            SizedBox(height: screenHeight * 0.03),
            // fbButton(),
            // SizedBox(height: screenHeight * 0.02),
            // googleButton(),
            // SizedBox(height: screenHeight * 0.02),
            emailButton(context),
            SizedBox(height: screenHeight * 0.05),
            txt3(),
            SizedBox(height: screenHeight * 0.03),
            // signUpB(context),
            SizedBox(height: screenHeight * 0.06),
          ],
        ),
      ),
    );
  }

  Widget txt3() {
    return RichText(
      text: TextSpan(children: <TextSpan>[
        const TextSpan(
            text: "By joining, you agree to LautoLocations",
            style: TextStyle(
              color: Color(0xFF606060),
            )),
        TextSpan(
            text: "  Terms of Service",
            style: TextStyle(
              color: CColors.primaryColor,
            ))
      ]),
    );
  }

  Widget emailButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) {
              return RegisterAs();
            },
          ),
        );
      },
      child: Container(
        height: screenHeight * 0.06,
        width: screenWidth * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.0),
            color: CColors.primaryColor),
        alignment: Alignment.center,
        child: const Text(
          'Continue with Phone No',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget googleButton() {
    return Container(
      height: screenHeight * 0.06,
      width: screenWidth * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.0), color: Colors.blue),
      alignment: Alignment.center,
      child: Text(
        'Continue with Google',
        style: TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget fbButton() {
    return Container(
      height: screenHeight * 0.06,
      width: screenWidth * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        color: Colors.blue[900],
      ),
      alignment: Alignment.center,
      child: Text(
        'Continue with Facebook',
        style: TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget txt2() {
    return Text(
        "Lauto Locations in Morocco provide best services for Car Hire Rentals."
        " We offer All Type of Cars & Jeeps with Automatic Transmission.",
        style: TextStyle(
          color: Colors.black,
        ));
  }

  Widget txt1() {
    return Text("Lauto Locations",
        style: TextStyle(
            color: CColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 22));
  }

  Widget imgWidget() {
    return Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
            child: Image.asset(
          'assets/images/Lauto.png',
        )));
  }
}
