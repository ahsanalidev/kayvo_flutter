import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kayvo_flutter/utilities/styles.dart';
// import 'package:search_app_bar/search_app_bar.dart';

// import 'package:search_widget/search_widget.dart';

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SvgPicture.asset(
              'assets/pen.svg',
              height: 16,
              width: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Icon(
              FontAwesomeIcons.user,
              color: Colors.black,
              size: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SvgPicture.asset(
              'assets/archive.svg',
              height: 20,
              width: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SvgPicture.asset(
              "assets/plus.svg",
              color: Colors.black,
              height: 20,
              width: 20,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Theme(
              data: ThemeData(
                  primaryColor: AppColors.kGrey,
                  accentColor: AppColors.kLightGrey),
              child: TextField(
                decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.red)),
                    hintText: 'Search',
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
