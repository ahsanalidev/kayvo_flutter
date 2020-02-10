import 'package:flutter/material.dart';
import 'package:kayvo_flutter/elements/button.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

class ChangeNumber extends StatelessWidget {
  const ChangeNumber({Key key}) : super(key: key);

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
        body: ListView(children: [
          Image.asset('assets/change_number.png'),
          Text("data", style: Theme.of(context).textTheme.subhead),
          Text("data", style: Theme.of(context).textTheme.subtitle),
          Button(
            onPressed: () {
              Navigator.pushNamed(context, "/navBar");
            },
          ),
        ]),
      ),
    );
  }
}
