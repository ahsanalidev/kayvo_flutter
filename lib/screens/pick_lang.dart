import 'package:flutter/material.dart';
import 'package:kayvo_flutter/elements/appbar.dart';
import 'package:kayvo_flutter/utilities/styles.dart';
import 'package:language_scroll/language_scroll.dart';
import 'package:language_pickers/language.dart';
import 'package:language_pickers/languages.dart';

class LanguageList extends StatefulWidget {
  @override
  _LanguageListState createState() => _LanguageListState();
}

class _LanguageListState extends State<LanguageList> {
  bool setTick;

  List<Language> languageList = [];
  List<String> strList = [];
  List<Widget> normalList = [];
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    languageList =
        defaultLanguagesList.map((item) => Language.fromMap(item)).toList();

    languageList
        .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    filterList();
    searchController.addListener(() {
      filterList();
    });
    super.initState();
  }

  filterList() {
    List<Language> languages = [];
    languages.addAll(languageList);
    normalList = [];
    strList = [];
    if (searchController.text.isNotEmpty) {
      languages.retainWhere((user) => user.name
          .toLowerCase()
          .contains(searchController.text.toLowerCase()));
    }
    languages.forEach((language) {
      normalList.add(
        ListTileLang(
          name: language.name.toString(),
        ),
      );
      strList.add(language.name);
    });

    setState(() {
      setTick;
      strList;
      normalList;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var currentStr = "";
    return Scaffold(
      appBar: MyCustomAppBar(
        searchController: searchController,
        height: 200,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          Navigator.pushNamed(context, '/profile');
        },
      ),
      body: AlphabetListScrollView(
        strList: strList,
        highlightTextStyle: TextStyle(
          color: AppColors.kLightRed,
        ),
        normalTextStyle: Theme.of(context)
            .textTheme
            .subtitle
            .copyWith(color: AppColors.kGrey),
        showPreview: false,
        itemBuilder: (context, index) {
          return normalList[index];
        },
        indexedHeight: (i) {
          return 60;
        },
        keyboardUsage: true,
      ),
    );
  }
}

class ListTileLang extends StatefulWidget {
  ListTileLang({Key key, this.name, this.text}) : super(key: key);
  String name;
  Widget text;
  @override
  _ListTileLangState createState() => _ListTileLangState();
}

class _ListTileLangState extends State<ListTileLang> {
  bool setTick = false;

  @override
  Widget build(BuildContext context) {
    void _setTick() {
      setTick = !setTick;
      setState(() {});
    }

    return
        //  Container(
        //   height: 20,
        //   child:
        //    InkWell(
        //     child: Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 24.0),
        //       child:
        // Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: <Widget>[
        //       Text(widget.name),
        //       setTick
        //           ? Icon(Icons.check, color: AppColors.kRed)
        //           : SizedBox(
        //               height: 0,
        //             ),
        //     ]

        ListTile(
            title: widget.name != null ? Text(widget.name) : widget.text,
            trailing: setTick
                ? Icon(Icons.check, color: AppColors.kRed)
                : SizedBox(
                    height: 0,
                  ),
            onTap: () => _setTick());
    //           ),
    //           ),
    //     // ),
    //     // onTap: () => _setTick(),
    //   ),
    // );
  }
}
