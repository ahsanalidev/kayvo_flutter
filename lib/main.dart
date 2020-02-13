import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kayvo_flutter/screens/addNewNumber.dart';
import 'package:kayvo_flutter/screens/addNumber.dart';
import 'package:kayvo_flutter/screens/archieve_chat.dart';
import 'package:kayvo_flutter/screens/backupData.dart';
import 'package:kayvo_flutter/screens/changeNumber.dart';
import 'package:kayvo_flutter/screens/chat.dart';
import 'package:kayvo_flutter/screens/chatBackup.dart';
import 'package:kayvo_flutter/screens/chats.dart';
import 'package:kayvo_flutter/screens/contactInfo.dart';
import 'package:kayvo_flutter/screens/dataAndStorage.dart';
import 'package:kayvo_flutter/screens/deletemyaccount.dart';
import 'package:kayvo_flutter/screens/editProfile.dart';
import 'package:kayvo_flutter/screens/help.dart';
import 'package:kayvo_flutter/screens/kayvo_contacts.dart';
import 'package:kayvo_flutter/screens/newContact.dart';
import 'package:kayvo_flutter/screens/notifications.dart';
import 'package:kayvo_flutter/screens/pick_lang.dart';
import 'package:kayvo_flutter/screens/privacy.dart';
import 'package:kayvo_flutter/screens/profile.dart';
import 'package:kayvo_flutter/screens/verifyNumber.dart';
import 'package:kayvo_flutter/screens/welcome.dart';
import 'package:kayvo_flutter/screens/newChat.dart';
import 'package:kayvo_flutter/screens/account.dart';
import 'package:kayvo_flutter/screens/blocked_contacts.dart';
import 'package:kayvo_flutter/screens/xchat.dart';

import 'elements/navbar.dart';
import 'utilities/styles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
                  fullscreenDialog: true,
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
              case '/account':
                return CupertinoPageRoute(
                  builder: (_) => Account(),
                  settings: settings,
                );

              case '/blockedContacts':
                return CupertinoPageRoute(
                  builder: (_) => BlockedContacts(),
                  settings: settings,
                );
              case '/privacy':
                return CupertinoPageRoute(
                  builder: (_) => Privacy(),
                  settings: settings,
                );
              case '/changeNumber':
                return CupertinoPageRoute(
                  builder: (_) => ChangeNumber(),
                  settings: settings,
                );
              case '/addNewNumber':
                return CupertinoPageRoute(
                  builder: (_) => AddNewNumber(),
                );
              //DeleteMyAccount
              case '/deleteMyAccount':
                return CupertinoPageRoute(
                  builder: (_) => DeleteMyAccount(),
                );
              case '/chatWidgetX':
                return CupertinoPageRoute(
                  builder: (_) => ChatWidgetX(),
                );
              case '/chatBackup':
                return CupertinoPageRoute(
                  builder: (_) => ChatBackup(),
                );
              case '/chats':
                return CupertinoPageRoute(
                  builder: (_) => Chats(),
                );
              case '/notifications':
                return CupertinoPageRoute(
                  builder: (_) => Notifications(),
                );
              case '/dataAndStorage':
                return CupertinoPageRoute(
                  builder: (_) => DataAndStorage(),
                );
              case '/help':
                return CupertinoPageRoute(
                  builder: (_) => Help(),
                );
              case '/backupData':
                return CupertinoPageRoute(
                  builder: (_) => BackupData(),
                );
              default:
                return CupertinoPageRoute(
                  fullscreenDialog: true,
                  builder: (_) => Welcome(),
                  settings: settings,
                );
            }
          } else {
            switch (settings.name) {
              case '/':
                return CupertinoPageRoute(
                  fullscreenDialog: true,
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
              case '/account':
                return MaterialPageRoute(
                  builder: (_) => Account(),
                  settings: settings,
                );
              case '/blockedContacts':
                return MaterialPageRoute(
                  builder: (_) => BlockedContacts(),
                  settings: settings,
                );
              case '/privacy':
                return MaterialPageRoute(
                  builder: (_) => Privacy(),
                  settings: settings,
                );
              case '/changeNumber':
                return MaterialPageRoute(
                  builder: (_) => ChangeNumber(),
                  settings: settings,
                );
              case '/deleteMyAccount':
                return MaterialPageRoute(
                  builder: (_) => DeleteMyAccount(),
                );
              case '/addNewNumber':
                return MaterialPageRoute(
                  builder: (_) => AddNewNumber(),
                );
              case '/chatWidgetX':
                return MaterialPageRoute(
                  builder: (_) => ChatWidgetX(),
                );
              case '/chatBackup':
                return MaterialPageRoute(
                  builder: (_) => ChatBackup(),
                );
              case '/chats':
                return MaterialPageRoute(
                  builder: (_) => Chats(),
                );
              case '/notifications':
                return MaterialPageRoute(
                  builder: (_) => Notifications(),
                );
              case '/dataAndStorage':
                return MaterialPageRoute(
                  builder: (_) => DataAndStorage(),
                );
              case '/help':
                return MaterialPageRoute(
                  builder: (_) => Help(),
                );
              case '/backupData':
                return MaterialPageRoute(
                  builder: (_) => BackupData(),
                );
              default:
                return CupertinoPageRoute(
                  fullscreenDialog: true,
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
