import 'package:flutter/material.dart';

class AppShadows {
  static const List<BoxShadow> lightThemeShadow = [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.14),
      offset: Offset(0, 16),
      blurRadius: 32,
      spreadRadius: -8,
    ),
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.08),
      offset: Offset(0, 6),
      blurRadius: 14,
      spreadRadius: -8,
    ),
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.06),
      offset: Offset(0, 0),
      blurRadius: 2,
      spreadRadius: 0,
    ),
  ];
}