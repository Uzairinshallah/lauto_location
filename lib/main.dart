import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lauto_location/provider/data_provider.dart';
import 'package:lauto_location/screens/AuthPhone/check_user.dart';
import 'package:lauto_location/screens/AuthPhone/signup_page.dart';
import 'package:lauto_location/screens/dashboard/dashboard.dart';
import 'package:lauto_location/screens/dashboard/home_page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'extras/colors.dart';

Future<void> main() async {
  print('uzair');
  WidgetsFlutterBinding.ensureInitialized();
  print('uzair111');
  await Firebase.initializeApp();

  print('uzair1222');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<DataProvider>(create: (_) => DataProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('uzair');
    return MaterialApp(
        // supportedLocales: [
        //   Locale('en', 'US'),
        // ],
        // localizationsDelegates: [
        //   CountryLocalizations.delegate,
        // ],
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: MaterialColor(
              CColors.primaryColor.value,
              CColors.getSwatch(CColors.primaryColor),
            ),
            appBarTheme: AppBarTheme(
                backgroundColor: CColors.primaryColor,
                foregroundColor: Colors.white //here you can give the text color
                ),
            accentColor: CColors.PrimaryAssentColor),
        home: FirebaseAuth.instance.currentUser == null
            ? SignUpPageP()
            : const CheckUser(),


    // home: MainAppbar(),
        );
  }
}
