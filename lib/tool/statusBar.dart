import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBar {
  /// System overlays should be drawn with a dark color. Intended for
  /// applications with a light background.
  static const SystemUiOverlayStyle dark = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  /// System overlays should be drawn with a light color. Intended for
  /// applications with a dark background.
  static const SystemUiOverlayStyle light = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
  );
}
