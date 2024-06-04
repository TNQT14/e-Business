
import 'package:intl/intl.dart';

import '../values/enums.dart';

extension DynamiCasingExtension on double {
  String toPriceFormat({String? symbol}) {
    return NumberFormat.currency(
      locale: 'ID',
      customPattern: '#,###\u00a4',
      symbol: symbol ?? 'đ',
      decimalDigits: 0,
    ).format(this);
  }

  String toPrice({bool isVND = true}) {
    return NumberFormat.currency(
      locale: 'ID',
      customPattern: '#,###\u00a4',
      symbol: isVND ? 'đ' : " GSTAR",
      decimalDigits: 0,
    ).format(this);
  }

  String toVND({String? unit = 'đ'}) {
    int number = int.parse(toString());
    var vietNamFormatCurrency =
        NumberFormat.currency(locale: "vi-VN", symbol: unit);

    return vietNamFormatCurrency.format(number);
  }
}

extension DynamiCasingExtensionNullable on double? {
  String toPriceFormatFromNullable({String? symbol}) {
    return NumberFormat.currency(
      locale: 'ID',
      customPattern: '#,###\u00a4',
      symbol: symbol ?? 'đ',
      decimalDigits: 0,
    ).format(this ?? 0.0);
  }
}

extension DateTimeFormat on DateTime {
  String formatToString(
      {String format = "yyyy-MM-dd",
      bool withNameDate = false,
      String formatYYMM = "dd-MM-yyyy",
      bool isYYMM = false}) {
    if (withNameDate) {
      return DateFormat.EEEE("vi").addPattern("dd/MM/yyyy", ', ').format(this);
    }

    if (isYYMM) {
      return DateFormat(formatYYMM).format(this);
    }
    return DateFormat(format).format(this);
  }

  DateTime get previousMonthDate =>
      month == 1 ? DateTime(year - 1, 12) : DateTime(year, month - 1);

  DateTime get nextMonthDate =>
      month == 12 ? DateTime(year + 1) : DateTime(year, month + 1);

  bool get isToday {
    final _now = DateTime.now();

    return _now.day == day && _now.month == month && _now.year == year;
  }

  String dayName({bool? isShowToday}) {
    if (isShowToday == true && isToday) {
      return 'Hôm nay';
    }
    late String _dayName = '';

    switch (weekday) {
      case 1:
        _dayName = 'Thứ Hai';
        break;
      case 2:
        _dayName = 'Thứ Ba';
        break;
      case 3:
        _dayName = 'Thứ Tư';
        break;
      case 4:
        _dayName = 'Thứ Năm';
        break;
      case 5:
        _dayName = 'Thứ Sáu';
        break;
      case 6:
        _dayName = 'Thứ Bảy';
        break;
      case 7:
        _dayName = 'Chủ Nhật';
        break;
      default:
        break;
    }

    return _dayName;
  }

  String formatToDotString() {
    String format = "dd.MM.yyyy";

    return DateFormat(format).format(this);
  }
}

extension ConvertToDateTime on String {
  String toFormatDateTime({
    String currentFormat = 'dd-MM-yyyy',
    String formatted = 'yyyy-MM-dd',
    String defaultValue = '',
  }) {
    try {
      return DateFormat(currentFormat)
          .parse(this)
          .formatToString(format: formatted);
    } catch (e) {
      return defaultValue;
    }
  }

  String formatDateTimeString({String format = 'HH:mm dd-MM-yyyy'}) {
    final _createAt = DateFormat('yyyy-MM-ddTHH:mm:ssZ', 'vi-VN').parse(this);

    return _createAt.formatToString(format: format);
  }
}
