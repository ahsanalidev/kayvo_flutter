import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:libphonenumber/libphonenumber.dart';
import 'package:provider/provider.dart';

import '../../intl_phone_number_input.dart';
import '../models/country_model.dart';
import '../providers/country_provider.dart';
import '../providers/input_provider.dart';
import '../utils/formatter/as_you_type_formatter.dart';
import '../utils/util.dart';
import 'countries_search_list_widget.dart';

enum PhoneInputSelectorType { DROPDOWN, BOTTOM_SHEET, DIALOG }

class InternationalPhoneNumberInput extends StatelessWidget {
  final PhoneInputSelectorType selectorType;

  final ValueChanged<PhoneNumber> onInputChanged;
  final ValueChanged<bool> onInputValidated;

  final VoidCallback onSubmit;
  final TextEditingController textFieldController;
  final TextInputAction keyboardAction;

  final String initialCountry2LetterCode;
  final String hintText;
  final String errorMessage;

  final bool isEnabled;
  final bool formatInput;
  final bool autoValidate;
  final bool ignoreBlank;

  final String locale;

  /// The style to use for the text being edited.
  ///
  /// This text style is also used as the base style for the [decoration].
  ///
  /// If null, defaults to the `subhead` text style from the current [Theme].
  final TextStyle textStyle;
  final InputBorder inputBorder;
  final InputDecoration inputDecoration;
  final InputDecoration searchBoxDecoration;

  final FocusNode focusNode;

  final List<String> countries;

  const InternationalPhoneNumberInput({
    Key key,
    this.selectorType,
    @required this.onInputChanged,
    this.onInputValidated,
    this.focusNode,
    this.textFieldController,
    this.onSubmit,
    this.keyboardAction,
    this.countries,
    this.textStyle,
    this.inputBorder,
    this.inputDecoration,
    this.searchBoxDecoration,
    this.initialCountry2LetterCode = 'NG',
    this.hintText = 'Phone Number',
    this.isEnabled = true,
    this.autoValidate = false,
    this.formatInput = true,
    this.errorMessage = 'Invalid phone number',
    this.ignoreBlank = false,
    this.locale,
  }) : super(key: key);

  factory InternationalPhoneNumberInput.withCustomDecoration({
    PhoneInputSelectorType selectorType,
    @required ValueChanged<PhoneNumber> onInputChanged,
    ValueChanged<bool> onInputValidated,
    FocusNode focusNode,
    TextEditingController textFieldController,
    VoidCallback onSubmit,
    TextInputAction keyboardAction,
    List<String> countries,
    TextStyle textStyle,
    String errorMessage,
    @required InputDecoration inputDecoration,
    InputDecoration searchBoxDecoration,
    String initialCountry2LetterCode = 'NG',
    bool isEnabled = true,
    bool formatInput = true,
    bool autoValidate = false,
    bool ignoreBlank = false,
    String locale,
  }) {
    return InternationalPhoneNumberInput(
      selectorType: selectorType,
      onInputChanged: onInputChanged,
      onInputValidated: onInputValidated,
      focusNode: focusNode,
      textFieldController: textFieldController,
      onSubmit: onSubmit,
      keyboardAction: keyboardAction,
      countries: countries,
      textStyle: textStyle,
      inputDecoration: inputDecoration,
      searchBoxDecoration: searchBoxDecoration,
      initialCountry2LetterCode: initialCountry2LetterCode,
      isEnabled: isEnabled,
      formatInput: formatInput,
      autoValidate: autoValidate,
      ignoreBlank: ignoreBlank,
      errorMessage: errorMessage,
      locale: locale,
    );
  }

  factory InternationalPhoneNumberInput.withCustomBorder({
    PhoneInputSelectorType selectorType,
    @required ValueChanged<PhoneNumber> onInputChanged,
    @required ValueChanged<bool> onInputValidated,
    FocusNode focusNode,
    TextEditingController textFieldController,
    VoidCallback onSubmit,
    TextInputAction keyboardAction,
    List<String> countries,
    TextStyle textStyle,
    @required InputBorder inputBorder,
    @required String hintText,
    String initialCountry2LetterCode = 'NG',
    String errorMessage = 'Invalid phone number',
    bool isEnabled = true,
    bool formatInput = true,
    bool autoValidate = false,
    bool ignoreBlank = false,
    String locale,
  }) {
    return InternationalPhoneNumberInput(
      selectorType: selectorType,
      onInputChanged: onInputChanged,
      onInputValidated: onInputValidated,
      focusNode: focusNode,
      textFieldController: textFieldController,
      onSubmit: onSubmit,
      keyboardAction: keyboardAction,
      countries: countries,
      textStyle: textStyle,
      inputBorder: inputBorder,
      hintText: hintText,
      initialCountry2LetterCode: initialCountry2LetterCode,
      errorMessage: errorMessage,
      formatInput: formatInput,
      isEnabled: isEnabled,
      autoValidate: autoValidate,
      ignoreBlank: ignoreBlank,
      locale: locale,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return InputProvider();
      },
      child: _InputWidget(
        selectorType: selectorType ?? PhoneInputSelectorType.DROPDOWN,
        onInputChanged: onInputChanged,
        onInputValidated: onInputValidated,
        onSubmit: onSubmit,
        textFieldController: textFieldController,
        focusNode: focusNode,
        keyboardAction: keyboardAction,
        initialCountry2LetterCode: initialCountry2LetterCode,
        hintText: hintText,
        errorMessage: errorMessage,
        autoFormatInput: formatInput,
        autoValidate: autoValidate,
        isEnabled: isEnabled,
        textStyle: textStyle,
        inputBorder: inputBorder,
        inputDecoration: inputDecoration,
        searchBoxDecoration: searchBoxDecoration,
        countries: countries,
        ignoreBlank: ignoreBlank,
        locale: locale,
      ),
    );
  }
}

class _InputWidget extends StatefulWidget {
  final PhoneInputSelectorType selectorType;

  final ValueChanged<PhoneNumber> onInputChanged;
  final ValueChanged<bool> onInputValidated;

  final VoidCallback onSubmit;
  final TextEditingController textFieldController;
  final TextInputAction keyboardAction;

  final String initialCountry2LetterCode;
  final String hintText;
  final String errorMessage;

  final bool isEnabled;
  final bool autoFormatInput;
  final bool autoValidate;
  final bool ignoreBlank;

  final String locale;

  /// The style to use for the text being edited.
  ///
  /// This text style is also used as the base style for the [decoration].
  ///
  /// If null, defaults to the `subhead` text style from the current [Theme].
  final TextStyle textStyle;
  final InputBorder inputBorder;
  final InputDecoration inputDecoration;
  final InputDecoration searchBoxDecoration;

  final FocusNode focusNode;

  final List<String> countries;

  const _InputWidget(
      {Key key,
      this.selectorType,
      @required this.onInputChanged,
      this.onInputValidated,
      this.focusNode,
      this.textFieldController,
      this.onSubmit,
      this.keyboardAction,
      this.countries,
      this.textStyle,
      this.inputBorder,
      this.inputDecoration,
      this.searchBoxDecoration,
      this.initialCountry2LetterCode = 'NG',
      this.hintText = 'Phone Number',
      this.isEnabled = true,
      this.autoValidate = false,
      this.autoFormatInput = true,
      this.errorMessage = 'Invalid phone number',
      this.ignoreBlank = false,
      this.locale})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<_InputWidget> {
  TextEditingController controller;

  _loadCountries(BuildContext context) {
    InputProvider provider = Provider.of<InputProvider>(context, listen: false);

    provider.countries = CountryProvider.getCountriesData(
        context: context, countries: widget.countries);

    provider.country = Utils.getInitialSelectedCountry(
        provider.countries, widget.initialCountry2LetterCode);
  }

  void _phoneNumberControllerListener() {
    InputProvider provider = Provider.of<InputProvider>(context, listen: false);
    provider.isNotValid = false;
    String parsedPhoneNumberString =
        controller.text.replaceAll(RegExp(r'[^\d+]'), '');

    getParsedPhoneNumber(parsedPhoneNumberString, provider.country?.countryCode)
        .then((phoneNumber) {
      if (phoneNumber == null) {
        String phoneNumber =
            '${provider.country.dialCode}$parsedPhoneNumberString';
        widget.onInputChanged(new PhoneNumber(
            phoneNumber: phoneNumber,
            isoCode: provider.country?.countryCode,
            dialCode: provider.country?.dialCode));
        if (widget.onInputValidated != null) {
          widget.onInputValidated(false);
        }
        provider.isNotValid = true;
      } else {
        widget.onInputChanged(new PhoneNumber(
            phoneNumber: phoneNumber,
            isoCode: provider.country?.countryCode,
            dialCode: provider.country?.dialCode));
        if (widget.onInputValidated != null) {
          widget.onInputValidated(true);
        }
        provider.isNotValid = false;
      }
    });
  }

  static Future<String> getParsedPhoneNumber(
      String phoneNumber, String iso) async {
    if (phoneNumber.isNotEmpty && iso != null) {
      try {
        bool isValidPhoneNumber = await PhoneNumberUtil.isValidPhoneNumber(
            phoneNumber: phoneNumber, isoCode: iso);

        if (isValidPhoneNumber) {
          return await PhoneNumberUtil.normalizePhoneNumber(
              phoneNumber: phoneNumber, isoCode: iso);
        }
      } on Exception {
        return null;
      }
    }
    return null;
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () => _loadCountries(context));
    controller = widget.textFieldController ?? TextEditingController();
    controller.addListener(_phoneNumberControllerListener);
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    InputProvider provider = Provider.of<InputProvider>(context);

    return Container(
      child: Row(
        textDirection: TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          widget.selectorType == PhoneInputSelectorType.DROPDOWN
              ? provider.countries.isNotEmpty && provider.countries.length > 1
                  ? Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<Country>(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey,
                          ),
                          hint: _Item(country: provider.country),
                          value: provider.country,
                          items: _mapCountryToDropdownItem(provider.countries),
                          onChanged: widget.isEnabled
                              ? (value) {
                                  provider.country = value;
                                  _phoneNumberControllerListener();
                                }
                              : null,
                        ),
                      ),
                    )
                  : _Item(country: provider.country)
              : FlatButton(
                  padding: EdgeInsetsDirectional.only(start: 12, end: 4),
                  onPressed: provider.countries.isNotEmpty &&
                          provider.countries.length > 1
                      ? () async {
                          Country selected;
                          if (widget.selectorType ==
                              PhoneInputSelectorType.BOTTOM_SHEET) {
                            selected =
                                await _showCountrySelectorBottomSheet(provider);
                          } else {
                            selected =
                                await _showCountrySelectorDialog(provider);
                          }

                          if (selected != null) {
                            provider.country = selected;
                            _phoneNumberControllerListener();
                          }
                        }
                      : null,
                  child: _Item(country: provider.country),
                ),
          SizedBox(width: 12),
          Flexible(
            child: TextFormField(
              cursorColor: Colors.red,
              textDirection: TextDirection.ltr,
              controller: controller,
              focusNode: widget.focusNode,
              enabled: widget.isEnabled,
              keyboardType: TextInputType.phone,
              textInputAction: widget.keyboardAction,
              style: widget.textStyle,
              decoration: _getInputDecoration(widget.inputDecoration),
              onEditingComplete: widget.onSubmit,
              autovalidate: widget.autoValidate,
              validator: (String value) {
                return provider.isNotValid &&
                        (value.isNotEmpty || widget.ignoreBlank == false)
                    ? widget.errorMessage
                    : null;
              },
              inputFormatters: [
                LengthLimitingTextInputFormatter(15),
                widget.autoFormatInput
                    ? AsYouTypeFormatter(
                        isoCode: provider.country?.countryCode ?? '',
                        dialCode: provider.country?.dialCode ?? '',
                        onInputFormatted: (TextEditingValue value) {
                          setState(() {
                            controller.value = value;
                          });
                        },
                      )
                    : WhitelistingTextInputFormatter.digitsOnly,
              ],
              onChanged: (text) {
                _phoneNumberControllerListener();
              },
            ),
          )
        ],
      ),
    );
  }

  InputDecoration _getInputDecoration(InputDecoration decoration) {
    return decoration ??
        InputDecoration(
          border: widget.inputBorder ?? UnderlineInputBorder(),
          hintText: widget.hintText,
        );
  }

  List<DropdownMenuItem<Country>> _mapCountryToDropdownItem(
      List<Country> countries) {
    return countries.map((country) {
      return DropdownMenuItem<Country>(
        value: country,
        child: _Item(country: country, withCountryNames: false),
      );
    }).toList();
  }

  Future<Country> _showCountrySelectorBottomSheet(InputProvider provider) {
    return showModalBottomSheet(
      context: context,
      clipBehavior: Clip.hardEdge,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          builder: (BuildContext context, ScrollController controller) {
            return Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
              ),
              child: CountrySearchListWidget(
                provider.countries,
                widget.locale,
                searchBoxDecoration: widget.searchBoxDecoration,
                scrollController: controller,
              ),
            );
          },
        );
      },
    );
  }

  Future<Country> _showCountrySelectorDialog(InputProvider provider) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => AlertDialog(
          content: CountrySearchListWidget(provider.countries, widget.locale,
              searchBoxDecoration: widget.searchBoxDecoration)),
    );
  }
}

class _Item extends StatelessWidget {
  final Country country;
  final bool withCountryNames;

  const _Item({Key key, this.country, this.withCountryNames = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        textDirection: TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          country?.flagUri != null
              ? Image.asset(
                  country?.flagUri,
                  width: 32.0,
                  package: 'intl_phone_number_input',
                )
              : SizedBox.shrink(),
          SizedBox(width: 12.0),
          Text(
            '${country?.dialCode ?? ''}',
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
