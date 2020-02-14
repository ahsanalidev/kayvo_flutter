import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kayvo_flutter/elements/kTextField.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool moreFields = false;

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
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Column(
                children: [
                  SizedBox(
                    height: deviceHeight(context) * 0.075,
                  ),
                  Container(
                    height: deviceHeight(context) * 0.175,
                    width: deviceHeight(context) * 0.175,
                    child: Stack(
                      // fit: StackFit.expand,
                      alignment: Alignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          child: Image.asset("assets/default_image.png"),
                          backgroundColor: AppColors.kLightRed,
                          radius: deviceHeight(context) * 0.075,
                        ),
                        Positioned(
                          bottom: 0,
                          // left: 0,
                          right: 0,
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              color: AppColors.kWhite,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 7,
                                  spreadRadius: 2,
                                  color: AppColors.kBlack.withOpacity(0.1),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                'assets/camera-outline.svg',
                                fit: BoxFit.fill,
                                color: AppColors.kBlack,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight(context) * 0.05,
                  ),
                  KTextField("Your Name", "Ayodeji Abraham"),
                  KTextField("Status", "Hey there! I am using Kayvo"),
                  KTextField("About", "King"),
                  SizedBox(
                    height: deviceHeight(context) * 0.025,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 0.0),
                    child: FlatButton(
                      padding: EdgeInsets.all(4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: 1,
                            width: deviceWidth(context) * 0.275,
                            color: AppColors.kLightGrey,
                          ),
                          Text("More Fields"),
                          Icon(moreFields
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down),
                          Container(
                            height: 1,
                            width: deviceWidth(context) * 0.275,
                            color: AppColors.kLightGrey,
                          ),
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          moreFields = !moreFields;
                        });
                      },
                    ),
                  ),
                  (moreFields)
                      ? Column(
                          children: <Widget>[
                            KTextField("Company", ""),
                            KTextField("Email", ""),
                            KTextField("Address", ""),
                          ],
                        )
                      : Container(),
                  SizedBox(
                    height: deviceHeight(context) * 0.1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
