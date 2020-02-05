import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  TextEditingController searchController;

  MySliverAppBar(
      {@required this.expandedHeight, @required this.searchController});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Column(
      children: <Widget>[
        // AppBar(
        //   elevation: 0,
        //   leading: IconButton(
        //     icon: Icon(
        //       Icons.keyboard_arrow_left,
        //       color: AppColors.kBlack,
        //     ),
        //     onPressed: () => Navigator.pop(context),
        //   ),
        //   title: Text(
        //     'New Chat',
        //     style: Theme.of(context).textTheme.title,
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
          child: Theme(
            data: ThemeData(
                primaryColor: AppColors.kGrey,
                accentColor: AppColors.kLightGrey),
            child: TextField(
              controller: searchController,
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

        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: <Widget>[
                  IconButton(
                    iconSize: 40,
                    icon: CircleAvatar(
                      radius: 24,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset(
                          'assets/user-plus.svg',
                        ),
                      ),
                      backgroundColor: AppColors.kLightGrey,
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    "New Contact",
                    style: Theme.of(context).textTheme.body1,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 28.0),
              child: VerticalDivider(
                color: AppColors.kGrey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: <Widget>[
                  IconButton(
                    iconSize: 40,
                    icon: CircleAvatar(
                      radius: 24,
                      child: Icon(FontAwesomeIcons.user,
                          color: AppColors.kBlack, size: 18),
                      backgroundColor: AppColors.kLightGrey,
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    'Invite',
                    style: Theme.of(context).textTheme.body1,
                  )
                ],
              ),
            ),
          ],
        ),
        Divider(
          color: AppColors.kGrey,
        )
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
