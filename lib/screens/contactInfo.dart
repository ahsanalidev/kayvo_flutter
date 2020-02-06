import 'package:flutter/material.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

class ConactInfo extends StatelessWidget {
  const ConactInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 10,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: AppColors.kBlack,
            iconSize: 24,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child:
                Text("Contact Info", style: Theme.of(context).textTheme.title),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Image.asset("assets/default_contact_image.png"),
          ],
        ),
      ),
    );
  }
}
