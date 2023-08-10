import 'package:flooz_challenge/utils/constants.dart';
import 'package:flutter/cupertino.dart';

void pushTo(Widget page) {
  Navigator.push(
    navigatorKey.currentContext!,
    CupertinoPageRoute(builder: (_) => page)
  );
}

void pushWithReplacement(Widget page) {
  Navigator.pushReplacement(
      navigatorKey.currentContext!,
      CupertinoPageRoute(builder: (_) => page)
  );
}

void popAllAndPush(Widget page) {
  Navigator.pushAndRemoveUntil(
      navigatorKey.currentContext!,
      CupertinoPageRoute(builder: (_) => page)
      , (Route<dynamic> route) => false);
}

void pop() => Navigator.of(navigatorKey.currentContext!).pop();