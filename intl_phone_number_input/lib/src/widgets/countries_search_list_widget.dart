import 'package:flutter/material.dart';

import '../models/country_model.dart';

class CountrySearchListWidget extends StatefulWidget {
  final List<Country> countries;
  final InputDecoration searchBoxDecoration;
  final String locale;
  final ScrollController scrollController;

  CountrySearchListWidget(this.countries, this.locale,
      {this.searchBoxDecoration, this.scrollController});

  @override
  _CountrySearchListWidgetState createState() =>
      _CountrySearchListWidgetState();
}

class _CountrySearchListWidgetState extends State<CountrySearchListWidget> {
  TextEditingController _searchController = TextEditingController();
  List<Country> filteredCountries;

  @override
  void initState() {
    filteredCountries = filterCountries();
    super.initState();
  }

  @override
  void dispose() {
    _searchController?.dispose();
    super.dispose();
  }

  InputDecoration getSearchBoxDecoration() {
    return widget.searchBoxDecoration ??
        InputDecoration(labelText: 'Search by country name or dial code');
  }

  List<Country> filterCountries() {
    final value = _searchController.text.trim();

    if (value.isNotEmpty) {
      return widget.countries
          .where(
            (Country country) =>
                country.name.toLowerCase().contains(value.toLowerCase()) ||
                getCountryName(country)
                    .toLowerCase()
                    .contains(value.toLowerCase()) ||
                country.dialCode.contains(value.toLowerCase()),
          )
          .toList();
    }

    return widget.countries;
  }

  String getCountryName(Country country) {
    if (widget.locale != null && country.nameTranslations != null) {
      String translated = country.nameTranslations[widget.locale];
      if (translated != null && translated.isNotEmpty) {
        return translated;
      }
    }
    return country.name;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            decoration: getSearchBoxDecoration(),
            controller: _searchController,
            onChanged: (value) =>
                setState(() => filteredCountries = filterCountries()),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            controller: widget.scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (Country country in filteredCountries) ...[
                  ListTile(
                    leading: CircleAvatar(
                        backgroundImage: AssetImage(
                      country.flagUri,
                      package: 'intl_phone_number_input',
                    )),
                    title: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text('${getCountryName(country)}',
                            textAlign: TextAlign.start)),
                    subtitle: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text('${country?.dialCode ?? ''}',
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.start)),
                    onTap: () => Navigator.of(context).pop(country),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
