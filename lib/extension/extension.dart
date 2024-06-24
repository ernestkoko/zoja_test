import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension StringExtension on String {
  String get formatStringDate =>
      DateFormat("yyy-MM-dd").format(DateTime.parse(this));

  double? getAmountFromController() {
    final amount = num.tryParse(trim());
    if (amount != null) return amount.toDouble();
    return null;
  }
}

extension WidgetExt on num {
  Widget get verticalSpace => SizedBox(height: toDouble());

  Widget get horizontalSpace => SizedBox(width: toDouble());
}
