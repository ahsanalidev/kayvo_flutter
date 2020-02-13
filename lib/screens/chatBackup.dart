import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kayvo_flutter/elements/button.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(children: [
              Image.asset('assets/backup_chat.png'),
              Text(
                "Back up your chat history and media to Google Drive \n" +
                    "so if you were to lose your phone or switch to a new \n" +
                    "one, your chat history is secured. You can restore \n" +
                    "your chat history whenever you einstall Kayvo \n" +
                    "Media and messages you backed up are not \n" +
                    "protected by Kayvo end-to-end encryption",
                textAlign: TextAlign.center,
              ),
              Row(
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
              Row(
                children: <Widget>[
                  Text("Last Backup"),
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Date & Time',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: '1/6/2020',
                            style: Theme.of(context).textTheme.subhead),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Size:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: '248 Mb',
                            style: Theme.of(context).textTheme.subhead),
                      ],
                    ),
                  )
                ],
              )
            ]),
          ),
        ],
      ),
      floatingActionButton: Button("Backup Now"),
    );
  }
}
