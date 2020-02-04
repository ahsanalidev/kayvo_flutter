import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

class AddNumber extends StatelessWidget {
  const AddNumber({Key key}) : super(key: key);

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
        body: Column(
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
              inputDecoration: InputDecoration(border: UnderlineInputBorder()),
              onInputValidated: (bool value) {
                print(value);
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_forward),
          onPressed: () {},
        ),
      ),
    );
  }
}
