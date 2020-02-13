import 'package:flutter/material.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

class Chats extends StatefulWidget {
  const Chats({Key key}) : super(key: key);

  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: AppColors.kGrey),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            "Chat",
            style: Theme.of(context).textTheme.title,
          )),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "Chat Wallpapers",
                        style: Theme.of(context).textTheme.subhead,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Divider(
                        color: AppColors.kGrey,
                      ),
                    ),
                    ListTile(
                        title: Text(
                          "Save to Camera Roll",
                          style: Theme.of(context).textTheme.subhead,
                        ),
                        subtitle: Text(
                          "Automatically save photos and videos you recieve to your Camera roll",
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        contentPadding: const EdgeInsets.all(16),
                        trailing: Switch(
                          value: switchValue,
                          onChanged: (value) {
                            setState(
                              () {
                                switchValue = value;
                              },
                            );
                          },
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Divider(
                        color: AppColors.kGrey,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Chat Backup",
                        style: Theme.of(context).textTheme.subhead,
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.kGrey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Divider(
                        color: AppColors.kGrey,
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "Clean All Chats",
                        style: Theme.of(context)
                            .textTheme
                            .subhead
                            .copyWith(color: Colors.red),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        "Delete All Chats",
                        style: Theme.of(context)
                            .textTheme
                            .subhead
                            .copyWith(color: Colors.red),
                      ),
                    ),
                    ListTile(
                      title: Text("Archive All Chat"),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
