import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:kayvo_flutter/screens/welcome.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

main() {
  runApp(MaterialApp(
    home: MySplashScreen(),
  ));
}

class MySplashScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return

        //  Scaffold(
        //   body: Center(
        //     child: RaisedButton(
        //       child: Text('Splash Screen'),
        //       onPressed: () {
        //         Navigator.of(context).push(_createRoute());
        //       },
        //     ),
        //   ),
        // );

        SplashScreen.navigate(
      backgroundColor: AppColors.kWhite,
      name: 'assets/kayvo.flr',
      next: (_) => Welcome(),
      until: () => Future.delayed(Duration(seconds: 2)),
      startAnimation: '1',
      // transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //   var begin = Offset(0.0, 1.0);
      //   var end = Offset.zero;
      //   var curve = Curves.linearToEaseOut;

      //   var tween =
      //       Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      //   return SlideTransition(
      //     position: animation.drive(tween),
      //     child: child,
      //   );
      // },
    );
  }
}
