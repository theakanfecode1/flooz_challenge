import 'package:flooz_challenge/res/style/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppTextStyles', () {
    test('kH1 returns TextStyle', () {
      WidgetsFlutterBinding.ensureInitialized();
      expect(AppTextStyles.kH1, isA<TextStyle>());
    });

    test('kH2 returns TextStyle', () {
      WidgetsFlutterBinding.ensureInitialized();
      expect(AppTextStyles.kH2, isA<TextStyle>());
    });

    test('kB1 returns TextStyle', () {
      WidgetsFlutterBinding.ensureInitialized();
      expect(AppTextStyles.kB1, isA<TextStyle>());
    });

    test('kB1Grey returns TextStyle', () {
      WidgetsFlutterBinding.ensureInitialized();
      expect(AppTextStyles.kB1Grey, isA<TextStyle>());
    });

    test('kButtonTitle returns TextStyle', () {
      WidgetsFlutterBinding.ensureInitialized();
      expect(AppTextStyles.kButtonTitle, isA<TextStyle>());
    });
  });
}