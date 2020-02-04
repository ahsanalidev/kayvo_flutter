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
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_forward),
          onPressed: () {
            Navigator.pushNamed(context, '/navBar');
          },
        ),
        body: ListView(
          children: <Widget>[
            Column(children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Number Verification",
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              SizedBox(height: deviceHeight(context) * 0.075),
              Image.asset('assets/verify1.png',
                  height: deviceHeight(context) * 0.3),
              SizedBox(height: deviceHeight(context) * 0.05),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      "Select your country then enter your phone number below",
                      style: Theme.of(context).textTheme.subhead,
                    ),
                  )),
              SizedBox(height: deviceHeight(context) * 0.05),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                    labelStyle: TextStyle(color: AppColors.kGrey),
                    hintText: "+1",
                    hintStyle: TextStyle(color: AppColors.kGrey),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.kGrey)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.kGrey)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.kGrey)),
                  ),
                  onInputValidated: (bool value) {
                    print(value);
                  },
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
