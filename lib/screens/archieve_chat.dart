import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

class ArchieveChat extends StatelessWidget {
  const ArchieveChat({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: AppColors.kBlack,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Archived Chat",
          style: Theme.of(context).textTheme.title,
        ),
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
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: TextField(
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.red)),
                      hintText: 'Search',
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
