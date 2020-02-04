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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08128,
                ),
                SvgPicture.asset(
                  'assets/logo.svg',
                  color: AppColors.kRed,
                  width: MediaQuery.of(context).size.height * 0.1137,
                  height: MediaQuery.of(context).size.height * 0.0712,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.033,
                ),
                Text(
                  "Welcome to Kayvo",
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Text(
                  "Simple Secure and Instant end to end \n translated messaging",
                  style: Theme.of(context).textTheme.body1,
                  textAlign: TextAlign.center,
                ),
                Image.asset(
                  "assets/welcome.png",
                  width: MediaQuery.of(context).size.width * 0.693,
                  height: MediaQuery.of(context).size.height * 0.320,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Accept the',
                    style: Theme.of(context).textTheme.subtitle,
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Kayvo Terms of Service and Privacy Policy',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle
                              .copyWith(color: AppColors.kRed)),
                      TextSpan(
                        text: '\n tap below to agree and continue',
                        style: Theme.of(context).textTheme.subtitle,
                      )
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
