import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kayvo_flutter/screens/addNumber.dart';
import 'package:kayvo_flutter/screens/archieve_chat.dart';
import 'package:kayvo_flutter/screens/chat.dart';
import 'package:kayvo_flutter/screens/contactInfo.dart';
import 'package:kayvo_flutter/screens/editProfile.dart';
import 'package:kayvo_flutter/screens/kayvo_contacts.dart';
import 'package:kayvo_flutter/screens/newContact.dart';
import 'package:kayvo_flutter/screens/pick_lang.dart';
import 'package:kayvo_flutter/screens/profile.dart';
import 'package:kayvo_flutter/screens/verifyNumber.dart';
import 'package:kayvo_flutter/screens/welcome.dart';
import 'package:kayvo_flutter/screens/newChat.dart';

import 'elements/navbar.dart';
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
        onGenerateRoute: (RouteSettings settings) {
          if (Platform.isIOS) {
            switch (settings.name) {
              case '/':
                return CupertinoPageRoute(
                  builder: (_) => Welcome(),
                  settings: settings,
                );
              case '/addNumber':
                return CupertinoPageRoute(
                  builder: (_) => AddNumber(),
                  settings: settings,
                );
              case '/navBar':
                return CupertinoPageRoute(
                  builder: (_) => NavBar(),
                  settings: settings,
                );
              case '/verifyNumber':
                return CupertinoPageRoute(
                  builder: (_) => VerifyNumber(),
                  settings: settings,
                );
              case '/editProfile':
                return CupertinoPageRoute(
                  builder: (_) => EditProfile(),
                  settings: settings,
                );
              case '/kayvocontacts':
                return CupertinoPageRoute(
                  builder: (_) => Kayvo_Contacts(),
                  settings: settings,
                );
              case '/newChat':
                return CupertinoPageRoute(
                  builder: (_) => New_Chat(),
                  settings: settings,
                );
              case '/archieveChat':
                return CupertinoPageRoute(
                  builder: (_) => ArchieveChat(),
                  settings: settings,
                );
              case '/chatWidget':
                return CupertinoPageRoute(
                  builder: (_) => ChatWidget(),
                  settings: settings,
                );
              case '/newChat':
                return CupertinoPageRoute(
                  builder: (_) => New_Chat(),
                  settings: settings,
                );
              case '/newContact':
                return CupertinoPageRoute(
                  builder: (_) => NewContact(),
                  settings: settings,
                );
              case '/profile':
                return CupertinoPageRoute(
                  builder: (_) => Profile(),
                  settings: settings,
                );
              case '/contactInfo':
                return CupertinoPageRoute(
                  builder: (_) => ConactInfo(),
                  settings: settings,
                );
              case '/languagePicker':
                return CupertinoPageRoute(
                  builder: (_) => LanguageList(),
                  settings: settings,
                );
              default:
                return CupertinoPageRoute(
                  builder: (_) => Welcome(),
                  settings: settings,
                );
            }
          } else {
            switch (settings.name) {
              case '/':
                return MaterialPageRoute(
                  builder: (_) => Welcome(),
                  settings: settings,
                );
              case '/addNumber':
                return MaterialPageRoute(
                  builder: (_) => AddNumber(),
                  settings: settings,
                );
              case '/navBar':
                return MaterialPageRoute(
                  builder: (_) => NavBar(),
                  settings: settings,
                );
              case '/verifyNumber':
                return MaterialPageRoute(
                  builder: (_) => VerifyNumber(),
                  settings: settings,
                );
              case '/editProfile':
                return MaterialPageRoute(
                  builder: (_) => EditProfile(),
                  settings: settings,
                );
              case '/kayvocontacts':
                return MaterialPageRoute(
                  builder: (_) => Kayvo_Contacts(),
                  settings: settings,
                );
              case '/newChat':
                return MaterialPageRoute(
                  builder: (_) => New_Chat(),
                  settings: settings,
                );
              case '/archieveChat':
                return MaterialPageRoute(
                  builder: (_) => ArchieveChat(),
                  settings: settings,
                );
              case '/chatWidget':
                return MaterialPageRoute(
                  builder: (_) => ChatWidget(),
                  settings: settings,
                );
              case '/newChat':
                return MaterialPageRoute(
                  builder: (_) => New_Chat(),
                  settings: settings,
                );
              case '/newContact':
                return MaterialPageRoute(
                  builder: (_) => NewContact(),
                  settings: settings,
                );
              case '/profile':
                return MaterialPageRoute(
                  builder: (_) => Profile(),
                  settings: settings,
                );
              case '/contactInfo':
                return MaterialPageRoute(
                  builder: (_) => ConactInfo(),
                  settings: settings,
                );
              case '/languagePicker':
                return MaterialPageRoute(
                  builder: (_) => LanguageList(),
                  settings: settings,
                );
              default:
                return MaterialPageRoute(
                  builder: (_) => Welcome(),
                  settings: settings,
                );
            }
          }
        });
  }
}

// routes: {
//   '/': (context) => Welcome(),
//   '/addNumber': (context) => AddNumber(),
//   '/navBar': (context) => NavBar(),
//   '/verifyNumber': (context) => VerifyNumber(),
//   '/editProfile': (context) => EditProfile(),
//   '/kayvocontacts': (context) => Kayvo_Contacts(),
//   '/newChat': (context) => New_Chat(),
//   '/archieveChat': (context) => ArchieveChat(),
//   '/chatWidget': (context) => ChatWidget(),
//   '/newContact': (context) => NewContact(),
//   '/profile': (context) => Profile(),
//   '/contactInfo': (context) => ConactInfo(),
//   '/languagePicker': (context) => LanguageList(),
// },
