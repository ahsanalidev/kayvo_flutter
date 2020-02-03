import 'package:flutter/material.dart';
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
          onPressed: () {},
        ),
      ),
    );
  }
}
