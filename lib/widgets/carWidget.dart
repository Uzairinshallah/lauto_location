import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../extras/app_text_style.dart';
import '../extras/colors.dart';
import '../extras/constants.dart';
import '../models/car_model.dart';
import '../provider/data_provider.dart';


class CarWidget extends StatelessWidget {
  CarWidget( {Key? key}) : super(key: key);
  late DataProvider controller;

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, value, child) {
      controller = value;
      return InkWell(
        onTap: () {

        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2,
          margin: EdgeInsets.symmetric(horizontal: 19, vertical: 5),
          child: Container(
            height: 115,
            width: 387,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: 87,
                    height: 87,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage('https://cdn.pixabay.com/photo/2012/11/02/13/02/car-63930__340.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 11,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'model.name',
                            style: AppTextStyle.quickSand(
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: CColors.primaryColor)),
                          ),
                          Text(
                            'model.address',
                            style: AppTextStyle.quickSand(
                                style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w700,
                                    color: CColors.darkgray)),
                          ),
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 67,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: CColors.primaryColor,
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.star_rounded,
                                      color: CColors.primaryColor,
                                      size: 12,
                                    ),
                                    Text(
                                      '4.6',
                                      style: AppTextStyle.spliceSans(
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: CColors.primaryColor,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '(117)',
                                      style: AppTextStyle.spliceSans(
                                        style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w400,
                                          color: CColors.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 17,
                              ),
                              Expanded(
                                child: Text(
                                  'aaa',
                                  style: AppTextStyle.quickSand(
                                      style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w700,
                                          color: CColors.darkgray)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // if (controller.userModel!.favourites.contains(model.id))
                  //   Image(
                  //     width: 30.w,
                  //     image: const AssetImage(
                  //       "assets/images/iconPink.png",
                  //     ),
                  //   ),
                  // SizedBox(
                  //   width: 11.w,
                  // ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
