import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kayvo_flutter/elements/button.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key key}) : super(key: key);

  void onPress(BuildContext context) {
    Navigator.pushNamed(context, 'addNumber');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              height: deviceHeight(context) * 0.1,
            ),
            SvgPicture.asset(
              'assets/logo.svg',
              color: AppColors.kRed,
              height: deviceHeight(context) * 0.07,
            ),
            SizedBox(
              height: deviceHeight(context) * 0.04,
            ),
            Text(
              "Welcome to Kayvo",
              style: Theme.of(context).textTheme.headline,
            ),
            SizedBox(
              height: deviceHeight(context) * 0.025,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: Text(
                "Simple Secure and Instant end to end translated messaging",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: deviceHeight(context) * 0.04,
            ),
            Image.asset(
              "assets/welcome.png",
              height: deviceHeight(context) * 0.35,
            ),
            SizedBox(
              height: deviceHeight(context) * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Accept the ',
                  style: Theme.of(context).textTheme.subtitle,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Kayvo Terms of Service and Privacy Policy',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle
                          .copyWith(color: AppColors.kRed),
                    ),
                    TextSpan(
                        text: ' tap below to agree and continue',
                        style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: deviceHeight(context) * 0.04,
            ),
            Button(
              onPressed: () => onPress(context),
            )
          ],
        ),
      ),
    );
  }
}
