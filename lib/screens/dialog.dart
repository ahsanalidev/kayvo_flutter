import 'package:flutter/material.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      elevation: 0.0,
      backgroundColor: AppColors.kWhite,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0.0, right: 0.0),
      child: Stack(
        //fit: StackFit.passthrough,
        children: <Widget>[
          Container(
            height: 160,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Text(
                    "Delete Chat",
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
                  child: Text(
                    "Are you sure you want to delete this chat?",
                    style: Theme.of(context).textTheme.body1,
                  ),
                ),
                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  color: Color(0xff3D3D4E),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    child: Text(
                      "Delete",
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(color: AppColors.kWhite),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
          Positioned(
            right: 0.0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Align(
                alignment: Alignment.topRight,
                child: Icon(Icons.close, color: AppColors.kBlack),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
