import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kayvo_flutter/utilities/styles.dart';

class Sample2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  color: AppColors.kBlack,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text(
                'New Chat',
                style: Theme.of(context).textTheme.title,
              ),
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              onStretchTrigger: () {
                _showSearch();
              },
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
              ),
            ),
          ];
        },
        body: Center(
          child: Text("Sample Text"),
        ),
      ),
    );
  }

  Widget _showSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
      child: Theme(
        data: ThemeData(
            primaryColor: AppColors.kGrey, accentColor: AppColors.kLightGrey),
        child: TextField(
          //controller: searchController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.red)),
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            hintText: 'Search',
            suffixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
