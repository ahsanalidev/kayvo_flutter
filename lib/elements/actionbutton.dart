import 'package:flutter/material.dart';
import 'package:kayvo_flutter/utilities/styles.dart';
import 'package:simple_animations/simple_animations.dart';

class Box extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  static final boxDecoration = BoxDecoration(
      color: AppColors.kRed,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
            color: Colors.black.withAlpha(60),
            blurRadius: 5,
            offset: Offset(0, 8),
            spreadRadius: 2)
      ]);

  const Box({Key key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ControlledAnimation(
      duration: Duration(milliseconds: 300),
      tween: Tween(begin: 0.0, end: 52.0),
      builder: (context, height) {
        return ControlledAnimation(
          duration: Duration(milliseconds: 1000),
          delay: Duration(milliseconds: 500),
          tween: Tween(
              begin: 2.0, end: (deviceWidth(context) * 0.9).roundToDouble()),
          builder: (context, width) {
            return Container(
              decoration: boxDecoration,
              width: width,
              height: height,
              child: isEnoughRoomForTypewriter(width, height)
                  ? TypewriterText(text, onPressed)
                  : Container(),
            );
          },
        );
      },
    );
  }

  isEnoughRoomForTypewriter(width, height) => width > 70 && height > 50;
}

class TypewriterText extends StatelessWidget {
  final void Function() onPressed;

  final String text;
  TypewriterText(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: AppColors.kRed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: deviceWidth(context) * 0.08,
          ),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .subtitle
                .copyWith(color: AppColors.kWhite),
          ),
          SizedBox(
            width: deviceWidth(context) * 0.02,
          ),
          Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: deviceWidth(context) * 0.06,
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
