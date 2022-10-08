import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:lauto_location/main.dart';
import 'package:lauto_location/screens/AuthPhone/signup_form.dart';
import 'package:provider/provider.dart';

import '../../extras/app_text_style.dart';
import '../../extras/colors.dart';
import '../../extras/functions.dart';
import '../../models/user_model.dart';
import '../../provider/data_provider.dart';
import '../../widgets/header_widget.dart';

class AgencyProfile extends StatefulWidget {
  AgencyProfile({Key? key}) : super(key: key);

  @override
  State<AgencyProfile> createState() => _AgencyProfileState();
}

class _AgencyProfileState extends State<AgencyProfile> {
  late double width, height;

  late EdgeInsets padding;

  int state = 0;
  late DataProvider dataProvider;
  UserModel? model;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    padding = EdgeInsets.symmetric(
        horizontal: width * 0.04, vertical: height * 0.025);
    return Consumer<DataProvider>(builder: (context, value, child) {
      dataProvider = value;
      model = value.userModel;
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                headerWidget(),
                topWidget(),
                Divider(
                  thickness: 1,
                  color: CColors.lightestgray,
                ),
                // businessWidget(),
                bottomWidget(),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget headerWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: HeaderWidget(
        text: 'Profile',
      ),
    );
  }

  Widget topWidget() {
    return Container(
      padding: padding,
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: CColors.primaryColor,
                backgroundImage: NetworkImage(
                    'https://pixabay.com/photos/auto-automobile-automotive-amg-2179220/')
                as ImageProvider,
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 30,
                    child: FloatingActionButton(
                      onPressed: () {
                        // pickImage();
                      },
                      backgroundColor: Colors.white,
                      child: Icon(
                        IconlyLight.edit,
                        color: CColors.primaryColor,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: width * 0.03,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "name",
                        style: AppTextStyle.quickSand(
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {

                      },
                      icon: const Icon(IconlyLight.edit),
                      color: CColors.primaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomWidget() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Column(
        children: [
          itemWidget(
            text: 'Terms And Conditions',
            onTap: () {},
          ),
          itemWidget(
            text: 'Privacy Policy',
            onTap: () {},
          ),
          ListTile(
            title: Text(
              'Logout',
              style: AppTextStyle.quickSand(
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) =>  MyApp()),
                      (route) => false);
            },
            leading: Icon(
              IconlyLight.logout,
              color: Colors.red,
            ),
          ),

        ],
      ),
    );
  }

  Widget itemWidget({
    required String text,
    required Function onTap,
  }) {
    return ListTile(
      onTap: () => onTap(),
      title: Text(
        text,
        style: AppTextStyle.quickSand(
          style: TextStyle(
            color: Colors.black.withOpacity(0.8),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      trailing: const Icon(
        IconlyLight.arrow_right_2,
        color: Colors.black,
      ),
    );
  }

  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>? subscription;

  getData() {
    subscription = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen((event) {
      setState(() {
        model = UserModel.fromMap(event.data()!);
      });
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }
//
// pickImage() async {
//   var file = await ImagesPicker.pick(
//     count: 1,
//     pickType: PickType.image,
//   );
//
//   if (file != null && file.isNotEmpty) {
//     Functions.showSignInDialog(context);
//     var link =
//         await Functions.uploadImage(File(file.first.path), "userProfile");
//
//     await FirebaseFirestore.instance
//         .collection("users")
//         .doc(model!.id)
//         .update({
//       "image": link,
//     });
//     Navigator.of(context).pop();
//   }
// }
//
// deleteAccount() {
//   return showDialog(
//       context: context,
//       useRootNavigator: false,
//       builder: (_) => AlertDialog(
//             backgroundColor: Colors.white,
//             contentPadding: EdgeInsets.zero,
//             title: Center(
//               child: Text(
//                 AppStrings.deleteAccount,
//                 style: const TextStyle(color: Colors.black),
//               ),
//             ),
//             content: const DeleteAccount(),
//           ));
// }
}
