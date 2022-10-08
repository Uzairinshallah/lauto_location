
import 'package:flutter/material.dart';
import 'package:lauto_location/provider/data_provider.dart';
import 'package:provider/provider.dart';

import '../../extras/app_text_style.dart';
import '../../extras/colors.dart';
import '../../extras/constants.dart';
import '../../models/car_model.dart';
import '../../widgets/carWidget.dart';
import '../../widgets/search_field.dart';
import '../drawer/get_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DataProvider controller;

  @override
  Widget build(BuildContext context) {
    var con = ScrollController();

    final GlobalKey<ScaffoldState> _key = GlobalKey();

    return Consumer<DataProvider>(builder: (context, model, child) {
      controller = model;
      return Scaffold(
        drawer: GetDrawer(),
        key: _key,
        body: Padding(
          padding: MediaQuery.of(context).padding,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 8.0, left: 15, right: 15),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            print(_key);
                            _key.currentState!.openDrawer();
                          },
                          child: Icon(Icons.view_headline_sharp)),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Lauto Location',
                              style: AppTextStyle.quickSand(
                                style: TextStyle(
                                    color: CColors.primaryColor,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            const Text(
                              'Choose a car according to your comfort',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                              maxLines: 2,
                            ),


                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SearchField(),
                servicesWidget(context),
                businessTiles(),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget servicesWidget(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            padding: const EdgeInsets.all(8.17),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                  color: Colors.black.withOpacity(0.12),
                  blurStyle: BlurStyle.normal,
                ),
              ],
            ),
            child: Icon(Icons.category_rounded, color: CColors.primaryColor,)
          ),
          SizedBox(
            width: 18,
          ),
          for (var field in Constants.field)
            InkWell(
              onTap: () {
                controller.selectedCategory = field;
              },
              child: Card(
                color: controller.selectedCategory == field
                    ? CColors.primaryColor
                    : Colors.white,
                margin: EdgeInsets.only(right: 5),
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 13.16,
                    bottom: 9.8,
                    left: 20.54,
                    right: 21.74,
                  ),
                  child: Text(
                    field,
                    style: AppTextStyle.quickSand(
                      style: TextStyle(
                        color: controller.selectedCategory == field
                            ? Colors.white
                            : null,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget businessTiles() {
    List<CarModel> businesses = [];

    // if (controller.selectedCategory.isEmpty) {
    //   businesses = controller.businesses;
    // } else {
    //   businesses = controller.getFilteredData(controller.businesses);
    // }

    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (ctx, index) {
                return CarWidget();
              },
              itemCount: 2,
              //businesses.length,
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) {
                return const SizedBox();
              },
            ),
          ),
          SizedBox(
            height: 1,
          ),
        ],
      ),
    );
  }
}
