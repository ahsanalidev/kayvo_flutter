import 'package:flutter/material.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

class Button extends StatelessWidget {
  const Button({Key key, this.onPressed}) : super(key: key);
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: FlatButton(
        color: AppColors.kRed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Agree and Continue"),
            Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
            )
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
