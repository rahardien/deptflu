// Package imports:
import 'package:intl/intl.dart';

class TextUtils {
  static String formatCurrency({
    dynamic text = '',
    String locale = 'ID',
    bool isCrypto = false,
    bool useDecimal = true,
    String symbol = "Rp. ",
    int decimalDigit = 2,
  }) {
    double amount;
    if (text != null && text != '') {
      if (text is double) {
        amount = text;
      } else if (text is int) {
        amount = text.toDouble();
      } else {
        amount = double.parse(text);
      }

      if (amount == 0) {
        return '0';
      }

      // var f = NumberFormat('#,##0.00', AppConstants.localeID);
      // if (isCrypto) {
      //   f = NumberFormat('#,##0.00000', AppConstants.localeID);
      // } else if (useDecimal == false) {
      //   f = NumberFormat('#,##0', locale);
      // }
      final f = NumberFormat.currency(
        symbol: symbol,
        decimalDigits: isCrypto ? 5 : decimalDigit,
        locale: locale,
      );

      return f.format(amount);
    } else {
      return '';
    }
  }

  static String formatDate([
    value = '',
    formatOutput = 'dd MMM yyyy hh:mm a',
    formatInput = 'yyyy-MM-dd HH:mm:ss',
  ]) {
    if (value != '' && value != null) {
      var inputFormat = DateFormat(formatInput);
      var inputDate = inputFormat.parse(value);

      var outputFormat = DateFormat(formatOutput);
      return outputFormat.format(inputDate);
    } else {
      return '';
    }
  }

  static String formatDateTime([
    DateTime? value,
    String pattern = 'dd MMM yyyy',
  ]) {
    return DateFormat(pattern).format(value ?? DateTime.now());
  }

  static String dateToString([value, format = 'yyyy-MM-dd HH:mm:ss']) {
    if (value != null) {
      var outputFormat = DateFormat(format);
      return outputFormat.format(value).toString();
    } else {
      return '';
    }
  }

  static String ellipsize([
    text = '',
    hideFromIndex = 0,
    hideUntilIndex = 0,
  ]) {
    if (text.length <= hideFromIndex) {
      return text;
    } else {
      if (text != '' && text != null) {
        if ((hideFromIndex + hideUntilIndex) > text.length - 1 ||
            hideUntilIndex < 0) {
          return text.substring(0, hideFromIndex) + "...";
        } else {
          return text.substring(0, hideFromIndex) +
              "..." +
              text.substring(hideFromIndex + hideUntilIndex);
        }
      } else {
        return '';
      }
    }
  }
}
