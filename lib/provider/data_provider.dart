import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lauto_location/models/agency_model.dart';
import 'package:lauto_location/screens/dashboard_a/dashboard_a.dart';

import '../extras/functions.dart';
import '../models/user_model.dart';
import '../screens/AuthPhone/signup_form.dart';
import '../screens/AuthPhone/signup_page.dart';


class DataProvider with ChangeNotifier {
  DataProvider() {

  }


  String _selectedCategory = "";


  String get selectedCategory => _selectedCategory;

  set selectedCategory(String value) {
    if(value == _selectedCategory){
      _selectedCategory = "";
    }else{
      _selectedCategory = value;
    }
    notifyListeners();
  }

  int toggleIndex = 0;

  setToggle(int i){
    toggleIndex = i;
    notifyListeners();
  }



  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  checkData(context) {
    print('called');
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) async {
      if (value.exists) {
        print('user called');
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) =>  DashBoardA()), (route) => false);
        // Navigator.pushAndRemoveUntil(context,
        //     MaterialPageRoute(builder: (context) =>  SignUpPageP()), (route) => false);
        // Functions.showSnackBar(context, "This Account Is Registered As User");
      }
    });
    FirebaseFirestore.instance
        .collection('agency')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) async {
      if (value.exists) {
        print('agency called');
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) =>  DashBoardA()), (route) => false);
        Functions.showSnackBar(context, "Login Successfully");

      }
    });
    print('end');

  }


  DateTime getCurrentDate([DateTime? date]) {
    var d = date ?? DateTime.now();
    return DateTime(d.year, d.month);
  }

  userStream() {
    FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event != null) {
        // getUserData();

      } else {
        cancelSubscriptions();
      }
    });
  }






  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>? usersStream;
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? categoryStream;


  final userRef = FirebaseFirestore.instance.collection('users');


  bool isUNChecked = true;
  bool isEmailValid = true;
  String dialC = "+960";



  checkUserName(bool chk) {
    isUNChecked = chk;
    notifyListeners();
  }

  UserModel? userModel;


  checkAuth() {
    final auth = FirebaseAuth.instance;
    auth.authStateChanges().listen((event) async {
      if (event != null) {
        await getUserData();
      }
      else {
        userModel = null;
      }
    });
  }

  Future<void> getUserData() async {
    usersStream = userRef
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen((value) {
      if (value.exists && value.data() != null) {
        userModel = UserModel.fromMap(value.data()!);
        notifyListeners();
      }
    });
  }












  cancelSubscriptions() {
    usersStream?.cancel();
    categoryStream?.cancel();

  }

  @override
  void dispose() {
    cancelSubscriptions();
    super.dispose();
  }




}
