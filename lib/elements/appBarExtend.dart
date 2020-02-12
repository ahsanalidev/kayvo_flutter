import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

class ChatAppbar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  TextEditingController searchController = TextEditingController();

  ChatAppbar({Key key, @required this.height, this.searchController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: AppColors.kBlack,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/default_image.png'),
                    radius: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "(454)133-6577",
                          style: Theme.of(context).textTheme.title,
                        ),
                        Text(
                          "last seen today at 9:41 AM",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(color: AppColors.kGrey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/ellipsis-v.svg",
                  width: 28,
                  height: 28,
                ),
                alignment: Alignment.centerLeft,
                onPressed: () {},
              ),
            ],
          ),
          Container(
            color: AppColors.kLightGrey,
            constraints: BoxConstraints.expand(height: 150),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("The sender is not in your contacts"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ButtonTheme(
                        minWidth: 165,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              side: BorderSide(color: AppColors.kGrey)),
                          color: AppColors.kWhite,
                          child: Text("Block"),
                          onPressed: () {},
                        ),
                      ),
                      ButtonTheme(
                        minWidth: 165.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              side: BorderSide(color: AppColors.kGrey)),
                          color: AppColors.kWhite,
                          child: Text("Report"),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              side: BorderSide(color: AppColors.kGrey)),
                          color: AppColors.kWhite,
                          child: Text("Add to contacts"),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
