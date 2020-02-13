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
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: AppColors.kBlack),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            "Chats",
            style: Theme.of(context).textTheme.title,
          )),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      ListTile(
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                          color: AppColors.kGrey,
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Chat Wallpapers",
                            style: Theme.of(context).textTheme.subhead,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Divider(
                          color: AppColors.kGrey,
                        ),
                      ),
                      ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Save to Camera Roll",
                              style: Theme.of(context).textTheme.subhead,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Automatically save photos and videos you recieve to your Camera roll",
                              style: Theme.of(context).textTheme.subtitle,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(16),
                          trailing: Switch(
                            value: switchValue,
                            activeColor: AppColors.kRed,
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
                        title: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Chat Backup",
                            style: Theme.of(context).textTheme.subhead,
                          ),
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                          color: AppColors.kGrey,
                        ),
                        onTap: () =>
                            Navigator.pushNamed(context, '/chatBackup'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
                        title: Text("Archive All Chat",
                            style: Theme.of(context).textTheme.subhead),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
