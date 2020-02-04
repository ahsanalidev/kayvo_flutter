import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var FontAwesomeIcons;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chats",
          style: Theme.of(context).textTheme.title,
        ),
        actions: <Widget>[
          SvgPicture.asset(
            'assets/pen.svg',
            height: 20,
            width: 20,
          ),
          Icon(FontAwesomeIcons.user),
        ],
      ),
    );
  }
}
