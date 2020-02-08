import 'package:flutter/material.dart';
import 'package:kayvo_flutter/utilities/styles.dart';
import 'package:pincode_textfield/pincode_textfield.dart';

class VerifyNumber extends StatelessWidget {
  const VerifyNumber({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_forward),
          onPressed: () {
            Navigator.pushNamed(context, '/languagePicker');
          },
        ),
        body: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Number Verification",
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: deviceHeight(context) * 0.075),
                Image.asset('assets/verify2.png',
                    height: deviceHeight(context) * 0.3),
                SizedBox(height: deviceHeight(context) * 0.05),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    "Enter the OTP received to your phone",
                    style: Theme.of(context).textTheme.body1,
                  ),
                ),
                SizedBox(height: deviceHeight(context) * 0.05),
                Align(
                  alignment: Alignment.center,
                  child: PinCodeTextField(
                    pinBoxHeight: 50,
                    pinBoxWidth: 50,
                    pinBoxBorderWidth: 1,
                    pinBoxRadius: 5,
                    defaultBorderColor: AppColors.kGrey,
                    pinBoxOuterPadding: EdgeInsets.symmetric(horizontal: 12),
                    hasTextBorderColor: AppColors.kLightRed,
                    //  maxLength: 50,
                    wrapAlignment: WrapAlignment.center,
                  ),
                ),
                SizedBox(height: deviceHeight(context) * 0.05),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Didn\'t receive OTP? ',
                      style: Theme.of(context).textTheme.body1,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Resend OTP',
                          style: Theme.of(context)
                              .textTheme
                              .body1
                              .copyWith(color: AppColors.kRed),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: deviceHeight(context) * 0.05),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
