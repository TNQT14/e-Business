import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Size size = PlatformDispatcher.instance.views.first.physicalSize /
    PlatformDispatcher.instance.views.first.devicePixelRatio;

const BASE_WIDTH = 390;
const BASE_HEIGHT = 844.0;

///This method is used to set padding/margin (for the left and Right side) & width of the screen or widget according to the Viewport width.
double getHorizontalSize(double px) {
  return px * (size.width / BASE_WIDTH);
}

///This method is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
double getVerticalSize(double px) {
  num statusBar =
      MediaQueryData.fromView(PlatformDispatcher.instance.views.first)
          .viewPadding
          .top;
  num screenHeight = size.height - statusBar;

  return px * (screenHeight / BASE_HEIGHT);
}

///This method is used to set text font size according to Viewport
double getFontSize(double px) {
  var height = getVerticalSize(px);
  var width = getHorizontalSize(px);

  return height < width ? height.toInt().toDouble() : width.toInt().toDouble();
}

///This method is used to set smallest px in image height and width
double getSize(double px) {
  var height = getVerticalSize(px);
  var width = getHorizontalSize(px);

  return height < width ? height.toInt().toDouble() : width.toInt().toDouble();
}

///This method is used to set padding responsively
EdgeInsetsGeometry getPadding({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  if (all != null) {
    left = all;
    top = all;
    right = all;
    bottom = all;
  }

  return EdgeInsets.only(
    left: getHorizontalSize(
      left ?? 0,
    ),
    top: getVerticalSize(
      top ?? 0,
    ),
    right: getHorizontalSize(
      right ?? 0,
    ),
    bottom: getVerticalSize(
      bottom ?? 0,
    ),
  );
}

EdgeInsetsGeometry getPaddingSymmetric({
  double? horizontal,
  double? vertical,
}) {
  return EdgeInsets.symmetric(
    horizontal: horizontal ?? 0,
    vertical: vertical ?? 0,
  );
}

///This method is used to set margin responsively
EdgeInsetsGeometry getMargin({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  if (all != null) {
    left = all;
    top = all;
    right = all;
    bottom = all;
  }

  return EdgeInsets.only(
    left: getHorizontalSize(
      left ?? 0,
    ),
    top: getVerticalSize(
      top ?? 0,
    ),
    right: getHorizontalSize(
      right ?? 0,
    ),
    bottom: getVerticalSize(
      bottom ?? 0,
    ),
  );
}

String priceFormat({required dynamic number, String? symbol}) {
  return NumberFormat.currency(
    locale: 'ID',
    customPattern: '#,### \u00a4',
    symbol: symbol ?? 'VNĐ',
    decimalDigits: 0,
  ).format(number);
}
