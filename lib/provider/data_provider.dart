import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';


class DataProvider with ChangeNotifier {
  DataProvider() {

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
