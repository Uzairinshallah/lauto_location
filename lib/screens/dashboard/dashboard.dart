import 'package:flutter/material.dart';
import 'package:lauto_location/screens/dashboard/home_page.dart';
import 'package:lauto_location/screens/dashboard/profile_page.dart';
import 'package:provider/provider.dart';

import '../../extras/app_text_style.dart';
import '../../extras/colors.dart';
import 'history_page.dart';


class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int index = 0;

  List<Widget> mainWidgets = [
    HomePage(),
    HistoryPage(),
    Profile(),
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
        if (i > 3) {
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
        BottomNavigationBarItem(
            icon: Icon(Icons.history, color: index == 1 ? CColors.primaryColor : Colors.black,),

            label: "History"),
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
