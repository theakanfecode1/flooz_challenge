import 'package:flooz_challenge/res/components/pin_code/flooz_pin_code_text_field.dart';
import 'package:flooz_challenge/res/components/pin_code/pin_theme.dart';
import 'package:flooz_challenge/res/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FloozPinCodeField', () {
    testWidgets('renders pinField', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(builder: (context) {
              return FloozPinCodeTextField(
                  context: context, length: 6, onChanged: (text) {});
            }),
          ),
        ),
      );
      expect(find.byType(FloozPinCodeTextField), findsOneWidget);
    });

    testWidgets('Renders with specified theme', (tester) async {
      PinTheme pinTheme = PinTheme(
          shape: PinCodeFieldShape.circle,
          borderRadius: BorderRadius.circular(14),
          fieldHeight: 46,
          fieldWidth: 46,
          borderWidth: 2.0,
          activeFillColor: AppColors.grey500,
          inactiveFillColor: AppColors.grey400,
          selectedFillColor: AppColors.grey500,
          activeColor: AppColors.black,
          selectedColor:
          AppColors.black,
          disabledColor:
          AppColors.grey400,
          inactiveColor:
          AppColors.grey400,
          fieldOuterPadding:
          const EdgeInsets.symmetric(horizontal: 4.0));
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(builder: (context) {
              return FloozPinCodeTextField(
                  context: context, length: 6, onChanged: (text) {},pinTheme: pinTheme,);
            }),
          ),
        ),
      );
      expect(find.byType(FloozPinCodeTextField), findsOneWidget);

      final finder = find.byType(FloozPinCodeTextField);
      final widget = tester.widget(finder) as FloozPinCodeTextField;
      expect(
        widget.pinTheme,
        pinTheme,
      );
    });
  });
}
