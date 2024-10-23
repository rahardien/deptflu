import 'package:intl/intl.dart';

import '../constants/app_constants.dart';

class TextUtils {
  static String formatCurrency({
    dynamic text = '',
    String locale = AppConstants.localeID,
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

  static String roundNumberByMax(value, [maximumValue = 99]) {
    if (value > maximumValue) {
      return '$maximumValue+';
    } else {
      return value.toString();
    }
  }

  static String orderConfirmationText(
      {required String storeName, required String itemName, String? locale}) {
    if (locale == AppConstants.localeEN) {
      return "Hello $storeName! I want to buy a $itemName through the Tara app. If the account details, amount and item are correct, please confirm at";
    } else if (locale == AppConstants.localeID) {
      return "Halo $storeName! Saya ingin membeli $itemName melalui aplikasi Tara. Jika barang, jumlah barang dan detail rekening sudah benar, tolong konfirmasi di ";
    }

    return "Hello $storeName! I want to buy a $itemName through the Tara app. If the account details, amount and item are correct, please confirm at ";
  }

  static String paymentConfirmedText(
      {required String amount, required String currency, String? locale}) {
    if (locale == AppConstants.localeEN) {
      return "Hello! I just transferred $amount $currency to your wallet via Tara. Please confirm the payment at ";
    } else if (locale == AppConstants.localeID) {
      return "Halo! Saya baru saja transfer $currency $amount ke walletmu via Tara. Tolong konfirmasi di ";
    }

    return "Hello! I just transferred $amount $currency to your wallet via Tara. Please confirm the payment at ";
  }

  static String formatCryptoSymbol({required String cryptoSymbol}) {
    var cryptoSymbolResult = '';
    if (cryptoSymbol.contains("_")) {
      cryptoSymbolResult = cryptoSymbol.split("_")[0];
    } else {
      cryptoSymbolResult = cryptoSymbol;
    }

    return cryptoSymbolResult;
  }
}
