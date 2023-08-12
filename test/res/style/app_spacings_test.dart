import 'package:flooz_challenge/res/style/app_spacings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppSpacings', () {
    test('xl returns double', () {
      WidgetsFlutterBinding.ensureInitialized();
      expect(AppSpacings.xl, isA<double>());
    });
    test('m returns double', () {
      WidgetsFlutterBinding.ensureInitialized();
      expect(AppSpacings.m, isA<double>());
    });
    test('xxl returns double', () {
      WidgetsFlutterBinding.ensureInitialized();
      expect(AppSpacings.xxl, isA<double>());
    });
    test('xs returns double', () {
      WidgetsFlutterBinding.ensureInitialized();
      expect(AppSpacings.xs, isA<double>());
    });
    test('xxxxl returns double', () {
      WidgetsFlutterBinding.ensureInitialized();
      expect(AppSpacings.xxxxl, isA<double>());
    });
  });
}