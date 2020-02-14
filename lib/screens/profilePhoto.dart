import 'package:flutter/material.dart';
import 'package:kayvo_flutter/screens/pick_lang.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.kBlack,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Profile Photo",
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: SafeArea(
        child: ListView(children: <Widget>[
          ListTileLang(
            name: "Everyone",
          ),
          ListTileLang(
            name: "My Contacts",
          ),
          ListTileLang(
            name: "Nobody",
          )
        ]),
      ),
    );
  }
}
