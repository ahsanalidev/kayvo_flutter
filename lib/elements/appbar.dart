import 'package:flutter/material.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  TextEditingController searchController = TextEditingController();

  MyCustomAppBar({Key key, @required this.height, this.searchController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.keyboard_arrow_left,
                  color: AppColors.kBlack,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Text(
              "Choose your Primary Language",
              style: Theme.of(context).textTheme.title,
            ),
            Text(
              "Kayvo will instantly translate messages into your native language",
              style: Theme.of(context).textTheme.subtitle,
            ),
            Container(
              height: 50,
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
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
