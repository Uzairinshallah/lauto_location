import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lauto_location/provider/data_provider.dart';
import 'package:lauto_location/screens/AuthPhone/signup_form.dart';
import 'package:lauto_location/screens/AuthPhone/signup_page.dart';
import 'package:phone_number/phone_number.dart';
import 'package:provider/provider.dart';

import '../home_page.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FROM_STATE,
}

class SignUpPhone extends StatefulWidget {
  SignUpPhone({Key? key}) : super(key: key);

  @override
  State<SignUpPhone> createState() => _SignUpPhoneState();
}

class _SignUpPhoneState extends State<SignUpPhone> {
  late double screenWidth, screenHeight;
  bool showPassword = false;
  late DataProvider model;
  var phoneController = TextEditingController();

  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;
  final otpController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  late String verificationId;
  bool showLoading = false;

  // PhoneNumberUtil plugin = PhoneNumberUtil();

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        showLoading = false;
      });

      if (authCredential.user != null) {
        var a = await FirebaseFirestore.instance
            .collection('users')
            .doc(authCredential.user!.uid)
            .get();
        if (a.exists) {
          print('Exists');
        }
        if (!a.exists) {
          // print('Not exists');
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignUpForm()));
        } else
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    } on FirebaseAuthException catch (e) {
      // TODO
      setState(() {
        showLoading = false;
      });

      _scaffoldkey.currentState
          ?.showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }

  getMobileFormWidget(context) {
    return Column(
      children: [
        Spacer(),
        Row(
          children: [
            Expanded(
                flex: 2,
                child: CountryCodePicker(
                  // countryList: Constants.codes,
                  // countryFilter: const ['MV'],
                  onChanged: (c) {
                    print("country Code" + c.toString());
                    model.dialC = c.dialCode!;
                  },
                  initialSelection: '+960',
                )),
            Expanded(
              flex: 4,
              child: TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                // validator: ,
                // onSaved: (String val) {
                //   _mobile = val;
                // },
                decoration: const InputDecoration(
                  labelText: "Phone No",
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () async {
            setState(() {
              showLoading = true;
            });

            // var appVerifier = Firebase.auth.RecaptchaVerifier('recaptcha-container');
            // await _auth.signInWithPhoneNumber(
            //     model.phoneController.text,
            //     appVerifier
            //
            //
            // );

            if (kIsWeb) {
              try {
                var result = await _auth
                    .signInWithPhoneNumber(model.dialC + phoneController.text);
                setState(() {
                  showLoading = false;
                  currentState = MobileVerificationState.SHOW_OTP_FROM_STATE;
                  this.verificationId = result.verificationId;
                });
              } catch (e) {
                print(e);
              }
            } else {
              await _auth.verifyPhoneNumber(
                  phoneNumber: model.dialC + phoneController.text,
                  verificationCompleted: (phoneAuthCredential) async {
                    setState(() {
                      showLoading = false;
                    });
                    // signInWithPhoneAuthCredential(phoneAuthCredential);
                  },
                  verificationFailed: (verificationFailed) async {
                    setState(() {
                      showLoading = false;
                    });
                    _scaffoldkey.currentState?.showSnackBar(SnackBar(
                        content: Text(verificationFailed.message.toString())));
                  },
                  codeSent: (verificationId, resendingTocken) async {
                    setState(() {
                      showLoading = false;
                      currentState =
                          MobileVerificationState.SHOW_OTP_FROM_STATE;
                      this.verificationId = verificationId;
                    });
                  },
                  codeAutoRetrievalTimeout: (verificationId) async {});
            }
          },
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: const Text(
              'Generate OTP',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Spacer()
      ],
    );
  }

  getOtpFromWIdget(context) {
    return Column(
      children: [
        Spacer(),
        TextFormField(
          controller: otpController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: "Enter OTP",
            contentPadding: EdgeInsets.zero,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () async {
            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: otpController.text);
            signInWithPhoneAuthCredential(phoneAuthCredential);
          },
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: const Text(
              'Check OTP',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Spacer()
      ],
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    if (screenWidth > 550) {
      screenWidth = 550;
    }

    return Consumer<DataProvider>(builder: (context, model, child) {
      this.model = model;
      return Scaffold(
          key: _scaffoldkey,
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
          body: Container(
            child: showLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                    ? getMobileFormWidget(context)
                    : getOtpFromWIdget(context),
            // Center(child: CircularProgressIndicator(),)
            // : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
            // ? getMobileFormWidget(context)
            // : getOtpFromWIdget(context),
            padding: const EdgeInsets.all(16),
          )
          // kIsWeb ? webView(context, model) : portraitView(context, model),
          );
    });
  }

  void _onCountryChange(CountryCode countryCode) {
    //TODO : manipulate the selected country code here
    print("New Country selected: " + countryCode.toString());
  }
}
