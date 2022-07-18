import 'package:hiring_app/utils/strings.dart';

class Validator {
  static String? validate(String? value) {
    return value == null || value.isEmpty ? AppStrings.cantNull : null;
  }
}
