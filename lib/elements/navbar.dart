import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kayvo_flutter/screens/settings.dart';
import 'package:kayvo_flutter/utilities/styles.dart';
import 'package:kayvo_flutter/screens/chatlist.dart';

class NavBar extends StatefulWidget {
  NavBar({Key key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  static TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 1: Camera',
      style: optionStyle,
    ),
    ChatList(),
    Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/camera-outline.svg',
                color: AppColors.kGrey,
              ),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/camera-outline.svg',
                color: AppColors.kRed,
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Camera',
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                FontAwesomeIcons.commentDots,
                color: AppColors.kGrey,
              ),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                FontAwesomeIcons.commentDots,
                color: AppColors.kRed,
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Chats',
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/settings.svg',
                color: AppColors.kGrey,
              ),
            ),
            activeIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/settings.svg',
                color: AppColors.kRed,
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Settings',
              ),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.kRed,
        unselectedItemColor: AppColors.kGrey,
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        unselectedLabelStyle: TextStyle(color: AppColors.kGrey, fontSize: 16),
        unselectedIconTheme: IconThemeData(size: 24, color: AppColors.kGrey),
        onTap: _onItemTapped,
      ),
    );
  }
}
