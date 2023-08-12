import 'package:flooz_challenge/res/style/app_shadows.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppShadows', () {
    test('lightThemeShadow returns List<BoxShadow>', () {
      WidgetsFlutterBinding.ensureInitialized();
      expect(AppShadows.lightThemeShadow, isA<List<BoxShadow>>());
    });
  });
}