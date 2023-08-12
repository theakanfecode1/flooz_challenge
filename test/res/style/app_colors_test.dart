import 'package:flooz_challenge/res/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppColors', ()
  {
    test('purple returns Color', () {
      WidgetsFlutterBinding.ensureInitialized();
      expect(AppColors.purple, isA<Color>());
    });

    test('grey700 returns Color', () {
      WidgetsFlutterBinding.ensureInitialized();
      expect(AppColors.grey700, isA<Color>());
    });

    test('grey600 returns Color', () {
      WidgetsFlutterBinding.ensureInitialized();
      expect(AppColors.grey600, isA<Color>());
    });

    test('grey500 returns Color', () {
      WidgetsFlutterBinding.ensureInitialized();
      expect(AppColors.grey500, isA<Color>());
    });
    test('black returns Color', () {
      WidgetsFlutterBinding.ensureInitialized();
      expect(AppColors.black, isA<Color>());
    });

    test('white returns Color', () {
      WidgetsFlutterBinding.ensureInitialized();
      expect(AppColors.white, isA<Color>());
    });
  });


}