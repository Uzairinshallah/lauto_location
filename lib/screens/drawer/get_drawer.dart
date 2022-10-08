import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:lauto_location/screens/dashboard/dashboard.dart';
import '../../extras/app_text_style.dart';
import '../../extras/colors.dart';
import '../../extras/functions.dart';
import '../AuthPhone/signup_page.dart';
import '../dashboard/home_page.dart';

class GetDrawer extends StatelessWidget {
  GetDrawer({Key? key}) : super(key: key);

  var screenWidth, screenHeight;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: screenHeight * .27,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 100.0, left: 60.0, right: 60),
                child: Text(
                  'Lauto Location',
                  style: AppTextStyle.quickSand(
                    style: TextStyle(
                        color: CColors.primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 45.0, right: 45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                drawerHeading('Dashboard', () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => DashBoard()));
                }),
                getLine(),
                drawerHeading('History', () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => DashBoard()));
                }),
                getLine(),
                drawerHeading('Profile', () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => DashBoard()));
                }),
                getLine(),
                drawerHeading('Privacy Policy', () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => DashBoard()));
                }),
                getLine(),
              ],
            ),
          ),
          Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.only(left: 45.0, right: 45, bottom: 20),
            child: InkWell(
              onTap: () {
                // HiveBoxes.userBox.delete("profile");
                FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SignUpPageP()),
                    (Route<dynamic> route) => false);
                Functions.showSnackBar(context, 'Log Out Successfully');
              },
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                children:  [
                  Icon(IconlyLight.logout, color: CColors.primaryColor,),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding getLine() {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 8),
      child: Container(
        color: CColors.darkgray,
        height: 1,
      ),
    );
  }

  Widget drawerHeading(String txt, onTap) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: SizedBox(
        height: screenHeight * .05,
        width: screenWidth,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            txt,
            style: TextStyle(
              color: CColors.darkgray,
              fontSize: 18,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}
