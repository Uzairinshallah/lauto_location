import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../extras/app_text_style.dart';
import '../extras/colors.dart';
import '../provider/data_provider.dart';

class CompletedBookings extends StatelessWidget {
  CompletedBookings({Key? key}) : super(key: key);

  // BusinessModel model;

  late DataProvider dataProvider;

  @override
  Widget build(BuildContext context) {
    dataProvider = Provider.of(context);
    return InkWell(
      onTap: () {},
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
                      image: NetworkImage(
                          'https://cdn.pixabay.com/photo/2016/04/01/12/16/car-1300629__340.png'),
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
                          'Agency name',
                          style: AppTextStyle.quickSand(
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: CColors.primaryColor)),
                        ),
                        Text(
                          "Ferraris are what dreams are made of. Fast, sexy, and highly exclusive, these Italian supercars push ",
                          style: AppTextStyle.quickSand(
                              style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black38)),
                        ),
                        Row(
                          children: [
                            // Container(
                            //   height: 20,
                            //   width: 67,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(20),
                            //     border: Border.all(
                            //       color: CColors.primaryColor,
                            //       width: 1,
                            //     ),
                            //   ),
                            //   child: Row(
                            //     mainAxisAlignment:
                            //     MainAxisAlignment.spaceAround,
                            //     children: [
                            //       Icon(
                            //         Icons.star_rounded,
                            //         color: CColors.primaryColor,
                            //         size: 12,
                            //       ),
                            //       Text(
                            //         '4.6',
                            //         style: AppTextStyle.spliceSans(
                            //           style: TextStyle(
                            //             fontSize: 10,
                            //             fontWeight: FontWeight.w500,
                            //             color: CColors.primaryColor,
                            //           ),
                            //         ),
                            //       ),
                            //       Text(
                            //         '(117)',
                            //         style: AppTextStyle.spliceSans(
                            //           style: TextStyle(
                            //             fontSize: 8,
                            //             fontWeight: FontWeight.w400,
                            //             color: CColors.primaryColor,
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            SizedBox(
                              width: 17,
                            ),
                            // Expanded(
                            //   child: Text(
                            //     Constants.listToString(model.fields),
                            //     style: AppTextStyle.quickSand(
                            //         style: TextStyle(
                            //             fontSize: 8.sp,
                            //             fontWeight: FontWeight.w700,
                            //             color: CColors.textBlack)),
                            //   ),
                            // ),
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
  }
}
