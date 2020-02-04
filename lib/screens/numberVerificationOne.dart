import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class NumberVerificationOne extends StatelessWidget {
  const NumberVerificationOne({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: <Widget>[
                Text("Number Verification"),
                Image.asset('assets/verify1.png'),
                Text("Select your country then enter your phone number below"),
                InternationalPhoneNumberInput.withCustomDecoration(
                  initialCountry2LetterCode: "US",
                  onInputChanged: (PhoneNumber number) {
                    print(number.phoneNumber);
                  },
                  isEnabled: true,
                  autoValidate: true,
                  formatInput: true,
                  inputDecoration:
                      InputDecoration(border: UnderlineInputBorder()),
                  onInputValidated: (bool value) {
                    print(value);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
