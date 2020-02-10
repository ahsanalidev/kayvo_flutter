import 'package:flutter/material.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

class Account extends StatelessWidget {
  const Account({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text(
          "Account",
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              "Privacy",
              style: Theme.of(context).textTheme.body1,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: AppColors.kGrey,
            ),
          ),
          Divider(
            color: AppColors.kBlack,
          ),
          ListTile(
            title: Text(
              "Change Number",
              style: Theme.of(context).textTheme.body1,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: AppColors.kGrey,
            ),
          ),
          Divider(
            color: AppColors.kBlack,
          ),
          ListTile(
            title: Text(
              "Delete My Account",
              style: Theme.of(context).textTheme.body1,
            ),
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
