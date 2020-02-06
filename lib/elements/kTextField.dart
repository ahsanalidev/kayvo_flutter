import 'package:flutter/material.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

class KTextField extends StatelessWidget {
  final String label;
  final String hint;

  const KTextField(this.label, this.hint, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24),
      child: Container(
        width: deviceWidth(context) * 0.9,
        height: 45,
        child: TextFormField(
          decoration: InputDecoration(
            labelText: label,
            labelStyle: Theme.of(context)
                .textTheme
                .body1
                .copyWith(color: AppColors.kGrey.withOpacity(0.75)),
            hintText: hint,
            hintStyle: Theme.of(context)
                .textTheme
                .body1
                .copyWith(color: AppColors.kGrey.withOpacity(0.75)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.kGrey.withOpacity(0.75))),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.kGrey.withOpacity(0.75))),
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.kGrey.withOpacity(0.75))),
          ),
        ),
      ),
    );
  }
}
