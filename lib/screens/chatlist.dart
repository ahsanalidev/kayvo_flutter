import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Chats",
          style: Theme.of(context).textTheme.title,
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              'assets/pen.svg',
              height: 16,
              width: 20,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              FontAwesomeIcons.user,
              color: Colors.black,
              size: 20,
            ),
            onPressed: () => Navigator.pushNamed(context, '/kayvocontacts'),
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/archive.svg',
              height: 20,
              width: 20,
            ),
            onPressed: () => Navigator.pushNamed(context, '/archieveChat'),
          ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/plus.svg",
              color: Colors.black,
              height: 20,
              width: 20,
            ),
            onPressed: () => Navigator.pushNamed(context, '/newChat'),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Theme(
                data: ThemeData(
                    primaryColor: AppColors.kGrey,
                    accentColor: AppColors.kLightGrey),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: TextField(
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.red)),
                      hintText: 'Search',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SlideableListTile()
          ],
        ),
      ),
    );
  }
}

class SlideableListTile extends StatelessWidget {
  const SlideableListTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.12,
      child: Container(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            child: Image.asset('assets/default_image.png'),
            foregroundColor: Colors.white,
          ),
          title: Text(
            'Ayodejy Abraham',
            style: Theme.of(context).textTheme.subtitle,
          ),
          subtitle: Text(
            'Hey',
            style: Theme.of(context).textTheme.subtitle,
          ),
          trailing: Container(
            width: 80,
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Expanded(child: Container()),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "1/6/2020",
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ),
          onTap: () => Navigator.pushNamed(context, '/chatWidget'),
        ),
      ),
      actions: <Widget>[
        IconSlideAction(
          iconWidget: CircleAvatar(
            backgroundColor: AppColors.kBlack,
            child: Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
          onTap: () => print('Share'),
        ),
        IconSlideAction(
          iconWidget: CircleAvatar(
            backgroundColor: AppColors.kBlack,
            child: Icon(
              Icons.not_interested,
              color: Colors.white,
            ),
          ),
          onTap: () => print('Share'),
        ),
        IconSlideAction(
          iconWidget: CircleAvatar(
            backgroundColor: AppColors.kRed,
            child: SvgPicture.asset(
              'assets/archive.svg',
              height: 20,
              width: 20,
              color: Colors.white,
            ),
          ),
          onTap: () => print('Archive'),
        ),
      ],
    );
  }
}
