import 'package:flutter/material.dart';
import 'package:lauto_location/widgets/get_button.dart';
import 'package:lauto_location/widgets/textfield_widget.dart';

import '../../extras/app_text_style.dart';
import '../../extras/colors.dart';
import '../../extras/functions.dart';
import 'agency_homepage.dart';

class AddCar extends StatefulWidget {
  const AddCar({Key? key}) : super(key: key);

  @override
  State<AddCar> createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {

  var carName = TextEditingController();
  var color = TextEditingController();
  var model = TextEditingController();
  var brand = TextEditingController();

  List<String> dropDownCategory = [
    'General',
    'Lamborghini',
    'Ford',
    'Ferrari',
  ];
  List<String> dropDownPriority = ['Normal', 'Important', 'High'];
  var selectedCategory = 'General';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
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
            SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Add Car To Your Agency',
                style: AppTextStyle.quickSand(
                  style: TextStyle(
                      color: CColors.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),

            TextFieldWidget(hintText: 'Car Name', controller: carName),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: TextFieldWidget(hintText: 'Color', controller: color),
            ),
            TextFieldWidget(hintText: 'Model', controller: model),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: TextFieldWidget(hintText: 'Brand', controller: brand),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border:
                  Border.all(color: CColors.primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: DropdownButton<String>(
                value: selectedCategory,
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down),
                elevation: 16,
                style: TextStyle(color: CColors.textblack),
                underline: const SizedBox(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCategory = newValue!;
                  });
                },
                items: dropDownCategory
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(value),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 30,),
            GetButton(text: "Submit Details", onTap: (){
              Functions.showSnackBar(context, 'Car Added Successfully');
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AgencyHomepage()));
            })
          ],
        ),
      ),
    );
  }
}
