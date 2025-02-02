import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

class BlockedContacts extends StatelessWidget {
  const BlockedContacts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.kBlack,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Blocked Contacts",
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                child: Image.asset('assets/default_image.png'),
                foregroundColor: Colors.white,
              ),
              title: Text(
                'Ayodejy Abraham',
                style: Theme.of(context).textTheme.subtitle,
              ),
              subtitle: Text(
                '+1 240 397 0570',
                style: Theme.of(context).textTheme.subtitle,
              ),
              trailing: SvgPicture.asset(
                'assets/minus-circle.svg',
                height: 25,
                width: 25,
                color: AppColors.kRed,
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Image.asset('assets/default_image.png'),
                foregroundColor: Colors.white,
              ),
              title: Text(
                'Charles Lucas',
                style: Theme.of(context).textTheme.subtitle,
              ),
              subtitle: Text(
                '+1 240 397 0570',
                style: Theme.of(context).textTheme.subtitle,
              ),
              trailing: SvgPicture.asset(
                'assets/minus-circle.svg',
                height: 25,
                width: 25,
                color: AppColors.kRed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
