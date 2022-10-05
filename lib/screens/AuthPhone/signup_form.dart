import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lauto_location/screens/AuthPhone/signup_page.dart';
import 'package:lauto_location/widgets/textfield_widget.dart';
import 'package:phone_number/phone_number.dart';
import 'package:provider/provider.dart';

import '../../extras/colors.dart';
import '../../extras/functions.dart';
import '../../models/user_model.dart';
import '../../provider/data_provider.dart';
import '../home_page.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late double screenWidth, screenHeight;
  bool showPassword = false;
  late DataProvider model;
  var userNameHint =
      'Your Username will be public and you will not be able to change it.';

  var invalidUsername =
      'Looks like this Username is already taken. Please pick a new one';

  var takenEmail =
      'Sorry, this email can\'t be registered. let\'s try another one';
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  PhoneNumberUtil plugin = PhoneNumberUtil();

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    if (screenWidth > 550) {
      screenWidth = 550;
    }
    return Consumer<DataProvider>(builder: (context, value, child) {
      model = value;
      return Consumer(builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SignUpPageP()));
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            title: const Text(
              "Sign Up with Phone",
              style: TextStyle(fontSize: 20, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          body: portraitView(context, model),
        );
      });
    });
  }

  Widget portraitView(BuildContext context, DataProvider model) {
    return Container(
      width: screenWidth,
      child: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.05,
            top: screenHeight * 0.02,
            right: screenWidth * 0.05),
        child: Column(
          children: [
            Column(
              children: [
                phoneWidget(),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldWidget(
                    hintText: "User Name", controller: userNameController),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(hintText: "City", controller: cityController),
                const SizedBox(
                  height: 10,
                ),
                invalidUsernameWIdget(),
              ],
            ),
            SizedBox(height: screenHeight * 0.05),
            registerButton(context),
            SizedBox(height: screenHeight * 0.02),
            tosText(),
          ],
        ),
      ),
    );
  }

  Widget tosText() {
    return RichText(
      text: TextSpan(children: <TextSpan>[
        const TextSpan(
            text: "By joining, you agree to Hire.mv",
            style: TextStyle(
              color: Color(0xFF606060),
            )),
        TextSpan(
            text: "  Terms of Services",
            style: TextStyle(
              color: CColors.PrimaryColor,
            ))
      ]),
    );
  }

  Widget registerButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        print('DONEDONE');
        // if(model.checkUserName(true))
        registerUser();
      },
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: const Text(
          'Sign Up',
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

  Widget invalidUsernameWIdget() {
    return Text(
      model.isUNChecked ? userNameHint : invalidUsername,
      style: TextStyle(
        fontSize: 12,
        color: model.isUNChecked ? Colors.black : Colors.red,
      ),
      textAlign: TextAlign.left,
    );
  }

  Widget phoneWidget() {
    return Column(
      children: [
        TextFormField(
          enabled: false,
          controller: phoneController,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            labelText: "Phone No",
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ],
    );
  }

  void registerUser() async {
    print('qqqqqqqqqqqqq');
    showUploadingDialog(context);
    await checkUserName();
    if (model.isUNChecked) {
      try {
        await setUser();
        Functions.showSnackBar(context, "Registered Successfully");
        Navigator.pop(context);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false);
      } catch (e) {
        Navigator.pop(context);
        Functions.showSnackBar(context, e.toString());
        print(e.toString());
      }
    } else {
      Navigator.pop(context);
      // Functions.showSnackBar(context, 'Username Taken');
    }
  }

  Future<void> checkUserName() async {
    try {
      var doc = await FirebaseFirestore.instance
          .collection("users")
          .where("userName", isEqualTo: userNameController.text.trim())
          .get();
      print(doc.size);
      if (doc.size > 0) {
        model.checkUserName(false);
      }
    } on FirebaseException catch (e) {
      print(e.toString());
    }
  }

  Future<void> setUser() async {
    final auth = FirebaseAuth.instance;
    final collectionRef = FirebaseFirestore.instance.collection('users');
    UserModel userModel = UserModel(
      id: auth.currentUser!.uid,
      phone: phoneController.text.trim(),
      userName: userNameController.text.trim(),
      city: cityController.text,
    );
    await collectionRef.doc(auth.currentUser!.uid).set(userModel.toMap()) ;
    // model.getUserInfo();
  }

  showUploadingDialog(BuildContext context) async {
    // set up the buttons
    await Future.delayed(const Duration(milliseconds: 50));
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Registering User"),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [CircularProgressIndicator()],
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }



  @override
  void dispose() {
    // TODO: implement dispose
    phoneController.clear();
    cityController.clear();
    userNameController.clear();
    super.dispose();
  }
}
