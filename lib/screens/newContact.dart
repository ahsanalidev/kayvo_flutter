import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:kayvo_flutter/elements/kTextField.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

class NewContact extends StatefulWidget {
  const NewContact({Key key}) : super(key: key);

  @override
  _NewContactState createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {
  bool moreFields = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text('New Contact', style: Theme.of(context).textTheme.title),
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          Navigator.pushNamed(context, "/navBar");
        },
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Column(
              children: [
                SizedBox(
                  height: deviceHeight(context) * 0.075,
                ),
                Container(
                  height: deviceHeight(context) * 0.175,
                  width: deviceHeight(context) * 0.175,
                  child: Stack(
                    // fit: StackFit.expand,
                    alignment: Alignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        child: Image.asset("assets/default_image.png"),
                        backgroundColor: AppColors.kLightRed,
                        radius: deviceHeight(context) * 0.075,
                      ),
                      Positioned(
                        bottom: 0,
                        // left: 0,
                        right: 0,
                        child: Container(
                          height: 36,
                          width: 36,
                          decoration: BoxDecoration(
                            color: AppColors.kWhite,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 7,
                                  spreadRadius: 2,
                                  color: AppColors.kBlack.withOpacity(0.1)),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              'assets/camera-outline.svg',
                              fit: BoxFit.fill,
                              color: AppColors.kBlack,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: deviceHeight(context) * 0.05,
                ),
                KTextField("First Name", ""),
                KTextField("Last Name", ""),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Container(
                    width: deviceWidth(context) * 0.9,
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
                SizedBox(
                  height: deviceHeight(context) * 0.025,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 0.0),
                  child: FlatButton(
                    padding: EdgeInsets.all(4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 1,
                          width: deviceWidth(context) * 0.275,
                          color: AppColors.kLightGrey,
                        ),
                        Text("More Fields"),
                        Icon(moreFields
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down),
                        Container(
                          height: 1,
                          width: deviceWidth(context) * 0.275,
                          color: AppColors.kLightGrey,
                        ),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        moreFields = !moreFields;
                      });
                    },
                  ),
                ),
                (moreFields)
                    ? Column(
                        children: <Widget>[
                          KTextField("Company", ""),
                          KTextField("Email", ""),
                          KTextField("Address", ""),
                        ],
                      )
                    : Container(),
                SizedBox(
                  height: deviceHeight(context) * 0.1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
