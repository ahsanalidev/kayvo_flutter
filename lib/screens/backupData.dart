import 'package:flutter/material.dart';
import 'package:kayvo_flutter/screens/pick_lang.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

class BackupData extends StatelessWidget {
  const BackupData({Key key}) : super(key: key);

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
          "Backup Data",
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: SafeArea(child: BackupList()),
    );
  }
}

class BackupList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTileLang(
          name: ("Daily"),
        ),
        ListTileLang(
          text: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'Weekly   ',
                    style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(fontWeight: FontWeight.w200)),
                TextSpan(
                    text: "(Default)",
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .copyWith(color: AppColors.kGrey)),
              ],
            ),
          ),
        ),
        ListTileLang(
          name: ("Monthly"),
        ),
        ListTileLang(
          name: ("OFF"),
        ),
      ],
    );
  }
}
