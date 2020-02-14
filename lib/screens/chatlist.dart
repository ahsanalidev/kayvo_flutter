import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kayvo_flutter/utilities/styles.dart';
import 'package:kayvo_flutter/elements/persistantHeader.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key key}) : super(key: key);
  Widget appBars(BuildContext context) => AppBar(
        elevation: 0,
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
            onPressed: () {
              Navigator.pushNamed(context, '/editProfile');
            },
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
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(appBars(context)),
              pinned: true,
            ),
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 90.0,
              snap: false,
              floating: false,
              pinned: false,
              centerTitle: true,
              title: Theme(
                data: ThemeData(
                    primaryColor: AppColors.kGrey,
                    accentColor: AppColors.kLightGrey),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.red)),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    hintText: 'Search',
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[SlideableListTile()],
              ),
            ),
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

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(
    this.newAppbar,
  );
  AppBar newAppbar;

  @override
  double get minExtent => newAppbar.preferredSize.height;
  @override
  double get maxExtent => newAppbar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return newAppbar;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
