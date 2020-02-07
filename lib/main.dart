import 'package:flutter/material.dart';
import 'package:kayvo_flutter/screens/addNumber.dart';
import 'package:kayvo_flutter/screens/archieve_chat.dart';
import 'package:kayvo_flutter/screens/chat.dart';
import 'package:kayvo_flutter/screens/contactInfo.dart';
import 'package:kayvo_flutter/screens/editProfile.dart';
import 'package:kayvo_flutter/screens/kayvo_contacts.dart';
import 'package:kayvo_flutter/screens/newContact.dart';
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
      routes: {
        '/': (context) => Welcome(),
        '/addNumber': (context) => AddNumber(),
        '/navBar': (context) => NavBar(),
        '/verifyNumber': (context) => VerifyNumber(),
        '/editProfile': (context) => EditProfile(),
        '/kayvocontacts': (context) => Kayvo_Contacts(),
        '/newChat': (context) => New_Chat(),
        '/archieveChat': (context) => ArchieveChat(),
        '/chatWidget': (context) => ChatWidget(),
        '/newContact': (context) => NewContact(),
        '/profile': (context) => Profile(),
        '/contactInfo': (context) => ConactInfo()
      },
    );
  }
}
