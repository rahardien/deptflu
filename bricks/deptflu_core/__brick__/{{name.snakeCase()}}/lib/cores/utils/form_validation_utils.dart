import 'text_utils.dart';

class FormValidationUtils {
  static String? isValidEmail(str) {
    if (str.isEmpty) {
      return 'This field is required';
    } else {
      final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
      if (emailRegExp.hasMatch(str)) {
        return null;
      } else {
        return 'Invalid email format';
      }
    }
  }

  static String? isValidName(str) {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    if (nameRegExp.hasMatch(str)) {
      return null;
    } else {
      return 'Invalid format';
    }
  }

  static String? isValidPassword(str) {
    if (str.isEmpty) {
      return 'This field is required';
    } else {
      final passwordRegExp = RegExp(
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}$');
      if (passwordRegExp.hasMatch(str)) {
        return null;
      } else {
        return 'Must be at least 8 characters long and must contain alphanumerics.';
      }
    }
  }

  static String? isMatch(strMatcher, str) {
    if (str.isEmpty) {
      return 'This field is required';
    } else {
      if (strMatcher != str) {
        return 'Password not match';
      } else {
        return null;
      }
    }
  }

  static String? isNotEmpty(str) {
    if (str == null || str == '') {
      return 'This field is required';
    } else {
      return null;
    }
  }

  static String? isValidPhone(str) {
    final phoneRegExp = RegExp(r'^[0-9]+$');
    if (phoneRegExp.hasMatch(str)) {
      return null;
    } else {
      return 'Invalid phone format';
    }
  }

  static String? isNumeric(str) {
    final phoneRegExp = RegExp(r'^[0-9]+$');
    if (phoneRegExp.hasMatch(str)) {
      return null;
    } else {
      return 'This field must be numeric';
    }
  }

  static String? minimumValue(str, [min = 1]) {
    if (str == null || str == '') {
      return 'This field is required';
    } else {
      double parsedStr;
      if (str is double) {
        parsedStr = str;
      } else if (str is int) {
        parsedStr = str.toDouble();
      } else if (str is String) {
        parsedStr = double.parse(str);
      } else {
        return 'Value invalid';
      }

      double parsedMinStr;
      if (min is double) {
        parsedMinStr = min;
      } else if (min is int) {
        parsedMinStr = min.toDouble();
      } else if (min is String) {
        parsedMinStr = double.parse(min);
      } else {
        return 'Value invalid';
      }
      if (parsedStr >= parsedMinStr) {
        return null;
      } else {
        return 'Minimum value is ${TextUtils.formatCurrency(
          text: min.toString(),
          useDecimal: false,
        )}';
      }
    }
  }

  // New script
  static bool mobilePhone(String value) {
    RegExp regex = RegExp(r'(^(?:[0]9)?[0-9]{10,13}$)');
    if (value.isEmpty) {
      return false;
    } else {
      bool isValid = regex.hasMatch(value);
      return isValid;
    }
  }

  static bool email(String value) {
    RegExp regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value.isEmpty) {
      return false;
    } else {
      bool isValid = regex.hasMatch(value);
      return isValid;
    }
  }

  static bool password(String value) {
    RegExp regex = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{6,12}$');
    if (value.isEmpty) {
      return false;
    } else {
      bool isValid = regex.hasMatch(value);
      return isValid;
    }
  }

  static bool pin(String value) {
    RegExp regex = RegExp(r'[0-6]');
    if (value.length < 6) {
      return false;
    } else {
      bool isValid = regex.hasMatch(value);
      return isValid;
    }
  }

  static bool notEmpty(str) {
    if (str == null || str == '') {
      return false;
    } else {
      return true;
    }
  }

  static bool match(str, comparison) {
    if (str.toString() == comparison.toString()) {
      return true;
    } else {
      return false;
    }
  }

  static bool minValue(str, [min = 1]) {
    if (str == null || str == '') {
      return false;
    } else {
      double parsedStr;
      if (str is double) {
        parsedStr = str;
      } else if (str is int) {
        parsedStr = str.toDouble();
      } else if (str is String) {
        parsedStr = double.parse(str);
      } else {
        return false;
      }
      if (parsedStr >= min) {
        return true;
      } else {
        return false;
      }
    }
  }
}
