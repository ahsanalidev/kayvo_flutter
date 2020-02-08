import '../models/country_model.dart';

class Utils {
  static Country getInitialSelectedCountry(
      List<Country> countries, String countryCode) {
    return countries.firstWhere((country) => country.countryCode == countryCode,
        orElse: () => countries[0]);
  }

  static void validatePhoneNumber(String phoneNumber) {}
}
