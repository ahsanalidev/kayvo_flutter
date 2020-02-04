import 'package:flutter/material.dart';
import 'package:kayvo_flutter/screens/addNumber.dart';
import 'package:kayvo_flutter/screens/editProfile.dart';
import 'package:kayvo_flutter/screens/verifyNumber.dart';
import 'package:kayvo_flutter/screens/welcome.dart';

import 'utilities/styles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: kTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => Welcome(),
        '/addNumber': (context) => AddNumber(),
        '/verifyNumber': (context) => VerifyNumber(),
        '/editProfile': (context) => EditProfile(),
      },
    );
  }
}
