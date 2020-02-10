import 'package:flutter/material.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

class Button extends StatelessWidget {
  const Button(this.text, {Key key, this.onPressed}) : super(key: key);
  final void Function() onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceWidth(context) * 0.9,
      height: deviceHeight(context) * 0.08,
      child: FlatButton(
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
      ),
    );
  }
}
