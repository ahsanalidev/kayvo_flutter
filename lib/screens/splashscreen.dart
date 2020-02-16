import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:kayvo_flutter/screens/welcome.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

main() {
  runApp(MaterialApp(
    home: MySplashScreen(),
  ));
}

class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => SplashScreen.callback(
        backgroundColor: AppColors.kWhite,
        name: 'assets/kayvo.flr',
        width: 2000,
        height: 1400,
        alignment: Alignment.center,
        onSuccess: (_) {
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  Welcome(),
              transitionDuration: Duration(seconds: 1),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                var begin = Offset(0.0, 1.0);
                var end = Offset.zero;
                var curve = Curves.linearToEaseOut;

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            ),
          );
        },
        startAnimation: 'Logo',
        until: () => Future.delayed(Duration(seconds: 1)),
        onError: (error, stacktrace) {
          print("Error");
        },
      ),
    );
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
