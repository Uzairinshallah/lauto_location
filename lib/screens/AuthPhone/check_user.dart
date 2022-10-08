import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/data_provider.dart';

class CheckUser extends StatefulWidget {
  const CheckUser({Key? key}) : super(key: key);

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, model, child) {
      model.checkData(context);
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
          ),
        ),
      );
    });
  }
}
