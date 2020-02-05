import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kayvo_flutter/utilities/styles.dart';
import 'package:kayvo_flutter/package/alphabet_scroll.dart';

class User {
  final String name;
  final String company;
  final bool favourite;

  User(this.name, this.company, this.favourite);
}

class New_Chat extends StatefulWidget {
  @override
  _New_ChatState createState() => _New_ChatState();
}

class _New_ChatState extends State<New_Chat> {
  List<User> userList = [];
  List<String> strList = [];
  List<Widget> favouriteList = [];
  List<Widget> normalList = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    for (var i = 0; i < 100; i++) {
      var name = faker.person.name();
      userList.add(User(name, faker.company.name(), false));
    }
    for (var i = 0; i < 4; i++) {
      var name = faker.person.name();
      userList.add(User(name, faker.company.name(), true));
    }
    userList
        .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    filterList();
    searchController.addListener(() {
      filterList();
    });
    super.initState();
  }

  filterList() {
    List<User> users = [];
    users.addAll(userList);
    favouriteList = [];
    normalList = [];
    strList = [];
    if (searchController.text.isNotEmpty) {
      users.retainWhere((user) => user.name
          .toLowerCase()
          .contains(searchController.text.toLowerCase()));
    }
    users.forEach((user) {
      if (user.favourite) {
        favouriteList.add(
          Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            actions: <Widget>[
              IconSlideAction(
                iconWidget: Icon(Icons.star),
                onTap: () {},
              ),
              IconSlideAction(
                iconWidget: Icon(Icons.more_horiz),
                onTap: () {},
              ),
            ],
            child: ListTile(
              leading: Stack(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/default_image.png'),
                  ),
                  Container(
                      height: 40,
                      width: 40,
                      child: Center(
                        child: Icon(
                          Icons.star,
                          color: Colors.yellow[100],
                        ),
                      ))
                ],
              ),
              title: Text(user.name),
              subtitle: Text("+1 240 397 0570"),
            ),
          ),
        );
      } else {
        normalList.add(
          Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            secondaryActions: <Widget>[
              IconSlideAction(
                iconWidget: Icon(Icons.star),
                onTap: () {},
              ),
              IconSlideAction(
                iconWidget: Icon(Icons.more_horiz),
                onTap: () {},
              ),
            ],
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/default_image.png'),
              ),
              title: Text(user.name),
              subtitle: Text("+1 240 397 0570"),
            ),
          ),
        );
        strList.add(user.name);
      }
    });

    setState(() {
      strList;
      favouriteList;
      normalList;
      strList;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var currentStr = "";
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: AppColors.kBlack,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'New Chat',
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: AlphabetListScrollView(
        strList: strList,
        highlightTextStyle: TextStyle(
          color: AppColors.kLightRed,
        ),
        normalTextStyle: Theme.of(context)
            .textTheme
            .subtitle
            .copyWith(color: AppColors.kGrey),
        showPreview: false,
        itemBuilder: (context, index) {
          return normalList[index];
        },
        indexedHeight: (i) {
          return 80;
        },
        keyboardUsage: true,
        headerWidgetList: <AlphabetScrollListHeader>[
          AlphabetScrollListHeader(widgetList: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
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
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
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
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Divider(
                color: AppColors.kGrey,
              ),
            )
          ], icon: Icon(Icons.search), indexedHeaderHeight: (index) => 80),
        ],
      ),
    );
  }
}
