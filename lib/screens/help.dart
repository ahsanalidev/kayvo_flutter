import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

class Help extends StatelessWidget {
  const Help({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.kBlack,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Help",
            style: Theme.of(context).textTheme.title,
          ),
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: SizedBox(
                          height: 110,
                          width: 90,
                          child: SvgPicture.asset(
                            'assets/logo.svg',
                            color: AppColors.kRed,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text("Contact Us",
                            style: Theme.of(context).textTheme.subhead),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Divider(),
                      ),
                      ListTile(
                        title: Text("Terms and Privacy Policy",
                            style: Theme.of(context).textTheme.subhead),
                      ),
                    ],
                  ))
            ],
          ),
        ),
        floatingActionButton: Text(
          "@ 2020 Kayvo LLC",
          style: TextStyle(color: AppColors.kGrey),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
