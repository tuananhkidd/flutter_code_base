import 'package:flutter/material.dart';

extension StringExtension on String? {
  bool isPhoneNumber() {
    if (this == null) return false;
    if (this!.length < 9 || this!.length > 12) {
      return false;
    }
    return true;
  }

  Color? toColor() {
    var hexColor = this!.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
