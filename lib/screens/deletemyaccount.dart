import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:kayvo_flutter/utilities/styles.dart';
import 'package:kayvo_flutter/elements/button.dart';

class DeleteMyAccount extends StatelessWidget {
  const DeleteMyAccount({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.kBlack,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Delete My Account",
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 32, 0, 16),
                    child: Text(
                      "Delete your account will",
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(fontWeight: FontWeight.w300),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 8, 8, 8),
                    child: Text("Delete your profile photo and account info",
                        style: Theme.of(context).textTheme.body1),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 8, 8, 8),
                    child: Text("Delete your message history on this phone",
                        style: Theme.of(context).textTheme.body1),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 32, 0, 16),
                    child: Text(
                      "Please enter your contact number to proceed",
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(fontWeight: FontWeight.w300, fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
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
                              .copyWith(
                                  color: AppColors.kGrey.withOpacity(0.75)),
                          hintText: "+1",
                          hintStyle: Theme.of(context).textTheme.body1.copyWith(
                              color: AppColors.kGrey.withOpacity(0.75)),
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Button(
        "Delete My Account",
        onPressed: () => {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
