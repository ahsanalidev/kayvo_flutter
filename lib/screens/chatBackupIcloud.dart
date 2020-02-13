import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kayvo_flutter/elements/button.dart';
import 'package:kayvo_flutter/utilities/styles.dart';
import 'package:popup_menu/popup_menu.dart';

class ChatBackup extends StatelessWidget {
  const ChatBackup({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: AppColors.kBlack,
          ),
        ),
        title: Text(
          "Chat Backup",
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(children: [
                SizedBox(
                  child: Image.asset('assets/backup_chat.png'),
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
                Text(
                  "Back up your chat history and media to iCloud \n" +
                      "so if you were to lose your phone or switch to a new \n" +
                      "one, your chat history is secured. You can restore \n" +
                      "your chat history whenever you einstall Kayvo \n" +
                      "Media and messages you backed up are not \n" +
                      "protected by Kayvo end-to-end encryption",
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Auto Backup"),
                          Row(children: <Widget>[
                            Text("Weekly"),
                            IconButton(
                              icon: Icon(Icons.keyboard_arrow_right),
                              onPressed: () {},
                            )
                          ]),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Divider(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                ListTile(
                  title: Text(
                    "Last Backup",
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontWeight: FontWeight.w300),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Date & Time:',
                                style: Theme.of(context)
                                    .textTheme
                                    .subhead
                                    .copyWith(fontWeight: FontWeight.w200)),
                            TextSpan(
                                text: '1/6/2020' + "     10:42 AM",
                                style: Theme.of(context).textTheme.body1),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Size:',
                                style: Theme.of(context)
                                    .textTheme
                                    .subhead
                                    .copyWith(fontWeight: FontWeight.w200)),
                            TextSpan(
                                text: '248 Mb',
                                style: Theme.of(context).textTheme.body1),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
      floatingActionButton: Button(
        "Backup Now",
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
