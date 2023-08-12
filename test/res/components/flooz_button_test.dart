import 'package:flooz_challenge/res/components/flooz_button.dart';
import 'package:flooz_challenge/res/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FloozButton', () {
    testWidgets('renders button', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FloozButton(
              label: 'Test', onTap: () {  },
            ),
          ),
        ),
      );
      expect(find.byType(FloozButton), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('renders button with color', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FloozButton(
              onTap: () {},
              label: 'Test',
              backgroundColor: AppColors.purple,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(FloozButton), findsOneWidget);
      expect(find.text('Test'), findsOneWidget);

      final finder = find.byType(FloozButton);
      final widget = tester.widget(finder) as FloozButton;
      expect(
        widget.backgroundColor,
        AppColors.purple,
      );
    });
  });
}