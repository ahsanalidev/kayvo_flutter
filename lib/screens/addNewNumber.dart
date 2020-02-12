import 'package:flutter/material.dart';
import 'package:kayvo_flutter/elements/button.dart';
import 'package:kayvo_flutter/utilities/styles.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class AddNewNumber extends StatelessWidget {
  const AddNewNumber({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child:
                Text('Change Number', style: Theme.of(context).textTheme.title),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Enter your current number",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 16),
                  child: Container(
                    height: 45,
                    child: InternationalPhoneNumberInput.withCustomDecoration(
                      initialCountry2LetterCode: "US",
                      onInputChanged: (PhoneNumber number) {
                        print(number.phoneNumber);
                      },
                      isEnabled: true,
                      autoValidate: true,
                      formatInput: true,
                      inputDecoration: InputDecoration(
                        labelText: "Phone number",
                        labelStyle: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(color: AppColors.kGrey.withOpacity(0.75)),
                        hintText: "+1",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(color: AppColors.kGrey.withOpacity(0.75)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.kGrey.withOpacity(0.75))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.kGrey.withOpacity(0.75))),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.kGrey.withOpacity(0.75))),
                      ),
                      onInputValidated: (bool value) {
                        print(value);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, top: 16, bottom: 8),
                  child: Text(
                    "Enter your new number",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "You'll receive a verification code to this number",
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .copyWith(color: AppColors.kGrey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 16),
                  child: Container(
                    height: 45,
                    child: InternationalPhoneNumberInput.withCustomDecoration(
                      initialCountry2LetterCode: "US",
                      onInputChanged: (PhoneNumber number) {
                        print(number.phoneNumber);
                      },
                      isEnabled: true,
                      autoValidate: true,
                      formatInput: true,
                      inputDecoration: InputDecoration(
                        labelText: "Phone number",
                        labelStyle: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(color: AppColors.kGrey.withOpacity(0.75)),
                        hintText: "+1",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(color: AppColors.kGrey.withOpacity(0.75)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.kGrey.withOpacity(0.75))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.kGrey.withOpacity(0.75))),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.kGrey.withOpacity(0.75))),
                      ),
                      onInputValidated: (bool value) {
                        print(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 36.0),
              child: Button(
                "Next",
                onPressed: () {
                  Navigator.pushNamed(context, "/navBar");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
