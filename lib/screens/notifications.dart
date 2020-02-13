import 'package:flutter/material.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool switchValue1 = false;
  bool switchValue2 = false;
  bool switchValue3 = false;

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
          "Notifications",
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverFillRemaining(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text("Message Notifications",
                      style: Theme.of(context).textTheme.subhead),
                  trailing: Switch(
                    value: switchValue1,
                    activeColor: AppColors.kRed,
                    onChanged: (value) {
                      setState(
                        () {
                          switchValue1 = value;
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(),
                ),
                ListTile(
                  //contentPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  title: Text(
                    "Alert Style",
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          SizedBox(
                            child: Image.asset('assets/none_not.png'),
                            height: 120,
                            width: 60,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "None",
                              style: Theme.of(context)
                                  .textTheme
                                  .body1
                                  .copyWith(color: AppColors.kGrey),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          SizedBox(
                            child: Image.asset('assets/banners_not_active.png'),
                            height: 120,
                            width: 60,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Banners",
                              style: Theme.of(context)
                                  .textTheme
                                  .body1
                                  .copyWith(color: AppColors.kGrey),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          SizedBox(
                            child: Image.asset('assets/alerts_not.png'),
                            height: 120,
                            width: 60,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Alerts",
                              style: Theme.of(context)
                                  .textTheme
                                  .body1
                                  .copyWith(color: AppColors.kGrey),
                            ),
                          ),
                        ],
                      ),
                    ]),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(),
                ),
                ListTile(
                  title: Text("Sounds",
                      style: Theme.of(context).textTheme.subhead),
                  trailing: Switch(
                    value: switchValue2,
                    activeColor: AppColors.kRed,
                    onChanged: (value) {
                      setState(
                        () {
                          switchValue2 = value;
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(),
                ),
                ListTile(
                  title: Text("Vibrate",
                      style: Theme.of(context).textTheme.subhead),
                  trailing: Switch(
                    value: switchValue3,
                    activeColor: AppColors.kRed,
                    onChanged: (value) {
                      setState(
                        () {
                          switchValue3 = value;
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(),
                ),
                ListTile(
                  title: Text("Notification Tone",
                      style: Theme.of(context).textTheme.subhead),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton:
          ListTile(title: Text("Reset Notification Settings"), onTap: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
