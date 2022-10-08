import 'package:flutter/material.dart';
import 'package:lauto_location/screens/dashboard/home_page.dart';
import 'package:lauto_location/screens/dashboard/profile_page.dart';
import 'package:lauto_location/screens/dashboard_a/agency_homepage.dart';
import 'package:lauto_location/screens/dashboard_a/agency_profile.dart';
import 'package:lauto_location/screens/dashboard_a/booking.dart';

import '../../extras/app_text_style.dart';
import '../../extras/colors.dart';
import '../dashboard/history_page.dart';


class DashBoardA extends StatefulWidget {
  const DashBoardA({Key? key}) : super(key: key);

  @override
  State<DashBoardA> createState() => _DashBoardAState();
}

class _DashBoardAState extends State<DashBoardA> {
  int index = 0;

  List<Widget> mainWidgets = [
    AgencyHomepage(),
    // BookingPage(),
    AgencyProfile(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavBar(),
      body: mainWidgets.elementAt(index),
    );
  }

  Widget bottomNavBar() {
    return BottomNavigationBar(
      elevation: 5,
      onTap: (i) {
        if (i > 2) {
          return;
        }
        index = i;
        setState(() {});
      },
      backgroundColor: Colors.white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: CColors.primaryColor,
      unselectedItemColor: Colors.black,
      currentIndex: index,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 13,
      selectedLabelStyle: AppTextStyle.monda(
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: CColors.primaryColor)),
      unselectedFontSize: 13,
      iconSize: 30,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home, color: index == 0 ? CColors.primaryColor : Colors.black,),
            label: 'Home'),
        // BottomNavigationBarItem(
        //     icon: Icon(Icons.history, color: index == 1 ? CColors.primaryColor : Colors.black,),
        //
        //     label: "Agency"),
        BottomNavigationBarItem(
            icon: Icon(Icons.person, color: index == 2 ? CColors.primaryColor : Colors.black,),

            label: "Profile"),
      ],
    );
  }

  TextStyle bottomTextStyle = AppTextStyle.monda(
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ));
}
