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
    return SplashScreen.callback(
      backgroundColor: AppColors.kWhite,
      name: 'assets/kayvo.flr',
      onSuccess: (context) {
        Navigator.of(context).pushReplacement(_createRoute());
      },
      loopAnimation: '1',
      until: () => Future.delayed(Duration(seconds: 3)),
      endAnimation: '1',
      onError: (error, stacktrace) {
        print("Error");
      },
    );
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

    //     SplashScreen.navigate(
    //   name: 'intro.flr',
    //   next: (context).push(_createRoute()),
    //   until: () => Future.delayed(Duration(seconds: 5)),
    //   startAnimation: '1',
    // );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Welcome(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.linearToEaseOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
