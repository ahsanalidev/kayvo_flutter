import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kayvo_flutter/elements/button.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key key}) : super(key: key);

  void onPress() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: <Widget>[
                SvgPicture.asset(
                  'assets/logo.svg',
                  color: AppColors.red,
                ),
                Text("Welcome to Kayvo"),
                Text(
                    "Simple Secure and Instant end to end translated messaging"),
                Image.asset("assets/welcome.png"),
                RichText(
                  text: TextSpan(
                    text: 'Accept the',
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Kayvo Terms of Service and Privacy Policy',
                          style: TextStyle(color: AppColors.red)),
                      TextSpan(
                          text: 'tap below to agree and continue',
                          style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
                Button(
                  onPressed: () => onPress(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
