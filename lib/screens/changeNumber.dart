import 'package:flutter/material.dart';
import 'package:kayvo_flutter/elements/button.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

class ChangeNumber extends StatelessWidget {
  const ChangeNumber({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text('Change Number',
                  style: Theme.of(context).textTheme.title),
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
          body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    height: deviceHeight(context) * 0.075,
                  ),
                  Image.asset(
                    'assets/change_number.png',
                    width: deviceWidth(context) * 0.75,
                  ),
                  SizedBox(
                    height: deviceHeight(context) * 0.08,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36.0),
                    child: Text(
                      "Use Change Number to move your account info and settings from your current phone number. You will not be able to undo this change.",
                      style: Theme.of(context).textTheme.subhead,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight(context) * 0.06,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36.0),
                    child: Text(
                      "Confirm that your new phone calls then tap Next to verify that number.",
                      style: Theme.of(context)
                          .textTheme
                          .body1
                          .copyWith(color: AppColors.kGrey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
          floatingActionButton: Button(
            "Next",
            onPressed: () {
              Navigator.pushNamed(context, "/addNewNumber");
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat),
    );
  }
}
