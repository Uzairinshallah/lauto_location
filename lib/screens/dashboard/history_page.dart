import 'package:flutter/material.dart';
import 'package:lauto_location/extras/colors.dart';
import 'package:provider/provider.dart';

import '../../extras/app_text_style.dart';
import '../../provider/data_provider.dart';
import '../../widgets/completed_bookings.dart';
import '../../widgets/upcoming_bookings.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late DataProvider controller;

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, model, child) {
      controller = model;
      return Consumer<DataProvider>(builder: (context, value, child) {
        controller = value;
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [

                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Booking History',
                        style: AppTextStyle.quickSand(
                          style: TextStyle(
                              color: CColors.primaryColor,
                              fontSize: 26,
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    height: 1,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.setToggle(0);
                      },
                      child: Container(
                        width: 130,
                        height: 30,
                        decoration: BoxDecoration(
                          color: (controller.toggleIndex == 0)
                              ? CColors.primaryColor
                              : Colors.white,
                          border:
                              Border.all(color: CColors.primaryColor, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            "Salons",
                            style: AppTextStyle.quickSand(
                              style: TextStyle(
                                  color: (controller.toggleIndex == 0)
                                      ? Colors.white
                                      : CColors.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        controller.setToggle(1);
                      },
                      child: Container(
                        width: 130,
                        height: 35,
                        decoration: BoxDecoration(
                          color: (controller.toggleIndex == 1)
                              ? CColors.primaryColor
                              : Colors.white,
                          border:
                              Border.all(color: CColors.primaryColor, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            "Employee",
                            style: AppTextStyle.quickSand(
                              style: TextStyle(
                                  color: (controller.toggleIndex == 1)
                                      ? Colors.white
                                      : CColors.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                controller.toggleIndex == 0
                    ? businessTiles()
                    : individualGrid(),
              ],
            ),
          ),
        );
      });
    });
  }

  Widget businessTiles() {
    return Expanded(
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return UpcomingBookings();
          }),
    );
  }

  Widget individualGrid() {
    return Expanded(
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return CompletedBookings();
          }),
    );
  }

  Widget lineWidget() {
    return Container(
      height: 10,
      width: 368.03,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.5,
            color: CColors.textblack,
          ),
        ),
      ),
    );
  }
}
