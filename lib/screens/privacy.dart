import 'package:flutter/material.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

class Privacy extends StatelessWidget {
  const Privacy({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text(
          "Privacy",
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Image.asset('assets/privacy.png'),
          ),
          ListTile(
            title: Text(
              "Who can see your profile",
              style: Theme.of(context).textTheme.body1,
            ),
          ),
          ListTile(
            title: Text(
              "Profile Photo",
              style: Theme.of(context).textTheme.body1,
            ),
            trailing: Row(
              children: <Widget>[
                Text("Everyone"),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.kGrey,
                ),
              ],
            ),
          ),
          Divider(
            color: AppColors.kBlack,
          ),
          ListTile(
            title: Text(
              "About",
              style: Theme.of(context).textTheme.body1,
            ),
            trailing: Row(
              children: <Widget>[
                Text("Everyone"),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.kGrey,
                ),
              ],
            ),
          ),
          Divider(
            color: AppColors.kBlack,
          ),
          ListTile(
            title: Text(
              "Status",
              style: Theme.of(context).textTheme.body1,
            ),
            trailing: Row(
              children: <Widget>[
                Text("Everyone"),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.kGrey,
                ),
              ],
            ),
          ),
          ListTile(
            title: Text("Blocked Contacts"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: AppColors.kGrey,
            ),
          )
        ],
      ),
    );
  }
}
