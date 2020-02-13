import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kayvo_flutter/utilities/styles.dart';
import 'package:alphabet_scroll/alphabet_scroll.dart';

class User {
  final String name;
  final String company;
  final bool favourite;

  User(this.name, this.company, this.favourite);
}

class Kayvo_Contacts extends StatefulWidget {
  @override
  _Kayvo_ContactsState createState() => _Kayvo_ContactsState();
}

class _Kayvo_ContactsState extends State<Kayvo_Contacts> {
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
              onTap: () {
                Navigator.pushNamed(context, "/contactInfo");
              },
              leading: Stack(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage("http://placeimg.com/200/200/people"),
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
              onTap: () {
                Navigator.pushNamed(context, "/contactInfo");
              },
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
            Icons.arrow_back_ios,
            color: AppColors.kBlack,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Kayvo Contacts',
          style: Theme.of(context).textTheme.title,
        ),
        actions: <Widget>[
          Center(
              child: Text(
            "Sync",
            style: Theme.of(context)
                .textTheme
                .body1
                .copyWith(color: AppColors.kRed),
          )),
          IconButton(
            icon: Icon(Icons.sync, color: AppColors.kRed),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: AlphabetListScrollView(
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
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
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
              )
            ], icon: Icon(Icons.search), indexedHeaderHeight: (index) => 80),
          ],
        ),
      ),
    );
  }
}
