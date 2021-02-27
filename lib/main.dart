import 'package:contractions_counter_flutter/screens/home%20screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: kSecondaryColor,
          scaffoldBackgroundColor: kPrimaryColor,
          accentColor: kActionPurpleColor,
          primaryColorDark: kActionPurpleColor),
      home: HomeScreen(),
    );
  }
}
