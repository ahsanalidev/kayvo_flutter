import 'package:flutter/material.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

class Privacy extends StatelessWidget {
  const Privacy({Key key}) : super(key: key);

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
          "Privacy",
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: SizedBox(
              width: 120,
              height: 150,
              child: Center(
                child: Image.asset('assets/privacy.png'),
              ),
            ),
          ),
          ListTile(
            title: Text(
              "Who can see your profile",
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(fontWeight: FontWeight.w300),
            ),
          ),
          ListTile(
            title: Text(
              "Profile Photo",
              style: Theme.of(context).textTheme.subhead,
            ),
            trailing: Container(
              width: 90,
              child: Row(
                children: <Widget>[
                  Text("Everyone", style: Theme.of(context).textTheme.body1),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: AppColors.kGrey,
                  ),
                ],
              ),
            ),
            onTap: () => Navigator.pushNamed(context, '/profilePhoto'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: AppColors.kBlack,
            ),
          ),
          ListTile(
            title: Text(
              "About",
              style: Theme.of(context).textTheme.subhead,
            ),
            trailing: Container(
              width: 90,
              child: Row(
                children: <Widget>[
                  Text("Everyone", style: Theme.of(context).textTheme.body1),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: AppColors.kGrey,
                  ),
                ],
              ),
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
              "Status",
              style: Theme.of(context).textTheme.subhead,
            ),
            trailing: Container(
              width: 90,
              child: Row(
                children: <Widget>[
                  Text("Everyone", style: Theme.of(context).textTheme.body1),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: AppColors.kGrey,
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text(
              "Blocked Contacts",
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(fontWeight: FontWeight.w300),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: AppColors.kGrey,
            ),
            onTap: () => Navigator.pushNamed(context, '/blockedContacts'),
          )
        ],
      ),
    );
  }
}
