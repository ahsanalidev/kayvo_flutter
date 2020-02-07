import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings', style: Theme.of(context).textTheme.title),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: [
                SizedBox(
                  height: deviceHeight(context) * 0.05,
                ),
                Container(
                  height: deviceHeight(context) * 0.175,
                  width: deviceHeight(context) * 0.175,
                  child: Stack(
                    // fit: StackFit.expand,
                    alignment: Alignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        child: Image.asset("assets/default_image.png"),
                        backgroundColor: AppColors.kLightRed,
                        radius: deviceHeight(context) * 0.075,
                      ),
                      Positioned(
                        bottom: 0,
                        // left: 0,
                        right: 0,
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: AppColors.kWhite,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 7,
                                spreadRadius: 2,
                                color: AppColors.kBlack.withOpacity(0.1),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              'assets/pen.svg',
                              fit: BoxFit.fill,
                              color: AppColors.kBlack,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: deviceHeight(context) * 0.03,
                ),
                Text(
                  "Ayodeji Abraham",
                  style: Theme.of(context).textTheme.subhead.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "King",
                    style: Theme.of(context).textTheme.body1.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
                SizedBox(
                  height: deviceHeight(context) * 0.05,
                ),
                ListTile(
                  onTap: () {},
                  leading: SvgPicture.asset(
                    "assets/user-circle.svg",
                    width: 24,
                    height: 24,
                    color: AppColors.kBlack.withOpacity(0.75),
                  ),
                  title: Text("Account"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  onTap: () {},
                  leading: SvgPicture.asset(
                    "assets/comment-dots.svg",
                    width: 24,
                    height: 24,
                    color: AppColors.kBlack.withOpacity(0.75),
                  ),
                  title: Text("Chats"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  onTap: () {},
                  leading: SvgPicture.asset(
                    "assets/globe-asia.svg",
                    width: 24,
                    height: 24,
                    color: AppColors.kBlack.withOpacity(0.75),
                  ),
                  title: Text("Data and Storage"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  onTap: () {},
                  leading: SvgPicture.asset(
                    "assets/bell.svg",
                    width: 24,
                    height: 24,
                    color: AppColors.kBlack.withOpacity(0.75),
                  ),
                  title: Text("Notification"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  onTap: () {},
                  leading: SvgPicture.asset(
                    "assets/user-friends.svg",
                    width: 24,
                    height: 24,
                    color: AppColors.kBlack.withOpacity(0.75),
                  ),
                  title: Text("Tell a friend"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
                ListTile(
                  onTap: () {},
                  leading: SvgPicture.asset(
                    "assets/question-circle.svg",
                    width: 24,
                    height: 24,
                    color: AppColors.kBlack.withOpacity(0.75),
                  ),
                  title: Text("Help"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
