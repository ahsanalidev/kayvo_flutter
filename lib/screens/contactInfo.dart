import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

class ConactInfo extends StatelessWidget {
  const ConactInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: AppColors.kBlack,
            iconSize: 24,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child:
                Text("Contact Info", style: Theme.of(context).textTheme.title),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  height: deviceHeight(context) * 0.3,
                  color: AppColors.kLightGrey,
                ),
                Image.asset(
                  "assets/default_contact_image.png",
                  height: deviceHeight(context) * 0.3,
                ),
              ],
            ),
            ListTile(
              title: Text("Adoyji Abraham",
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(fontWeight: FontWeight.w500)),
              subtitle: Row(
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.phoneAlt,
                    size: 10,
                    color: AppColors.kGrey,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "+1 240 397 0570",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle
                          .copyWith(color: AppColors.kGrey),
                    ),
                  ),
                ],
              ),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/pen.svg',
                    height: 14,
                    fit: BoxFit.fill,
                    color: AppColors.kBlack,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8),
              child: Text(
                "About",
                style: Theme.of(context)
                    .textTheme
                    .subtitle
                    .copyWith(color: AppColors.kGrey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8),
              child: Text(
                "King",
                style: Theme.of(context).textTheme.body1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 24),
              child: Text(
                "Media",
                style: Theme.of(context)
                    .textTheme
                    .body1
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              width: deviceWidth(context),
              height: deviceHeight(context) * 0.15,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 8),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        width: 150.0,
                        height: 75.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "assets/demoPic.jpg",
                            ),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        width: 150.0,
                        height: 75.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "assets/demoPic.jpg",
                            ),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        width: 150.0,
                        height: 75.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "assets/demoPic.jpg",
                            ),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.search),
              title: Text("Chat Search"),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.star_border),
              title: Text("Starred Messages"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "0",
                    style: Theme.of(context).textTheme.body1,
                  ),
                  Icon(Icons.keyboard_arrow_right),
                ],
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.image),
              title: Text("Save Media to Camera Roll"),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(FontAwesomeIcons.microphoneSlash),
              title: Text("Mute Chat"),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/blockedContacts');
              },
              leading: Icon(Icons.block),
              title: Text("Block Contact"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.report),
              title: Text("Report"),
            ),
          ],
        ),
      ),
    );
  }
}
