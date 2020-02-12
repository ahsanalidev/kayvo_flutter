import 'package:flutter/material.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

class Account extends StatelessWidget {
  const Account({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.kBlack,
          ),
          onPressed: () => Navigator.pop(context),
        ),
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
              style: Theme.of(context).textTheme.subhead,
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: AppColors.kGrey,
            ),
            onTap: () => Navigator.pushNamed(context, '/privacy'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: AppColors.kBlack,
            ),
          ),
          //addddddddddddddd
          ListTile(
            title: Text(
              "Change Number",
              style: Theme.of(context).textTheme.subhead,
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: AppColors.kGrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: AppColors.kBlack,
            ),
          ),
          ListTile(
            title: Text(
              "Delete My Account",
              style: Theme.of(context).textTheme.subhead,
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: AppColors.kGrey,
            ),
            onTap: () => Navigator.pushNamed(context, '/deleteMyAccount'),
          )
        ],
      ),
    );
  }
}
