import 'package:flutter/material.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child:
                Text('Edit Profile', style: Theme.of(context).textTheme.title),
          ),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: AppColors.kBlack,
            iconSize: 24,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check),
          onPressed: () {},
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: [
                SizedBox(
                  height: deviceHeight(context) * 0.075,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      child: Image.asset("assets/default_image.png"),
                      backgroundColor: AppColors.kLightRed,
                      radius: deviceHeight(context) * 0.075,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                          height: 42,
                          decoration: BoxDecoration(
                              color: AppColors.kBlack, shape: BoxShape.circle)),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
