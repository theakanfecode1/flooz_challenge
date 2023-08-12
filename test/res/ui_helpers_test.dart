import 'package:flooz_challenge/res/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ErrorToast', () {
    testWidgets('renders ErrorToast', (tester) async {
      await tester.runAsync(() async {
        const buttonText = 'Display error';
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      showErrorToast(context, 'Error');
                    },
                    child: const Text(buttonText),
                  );
                },
              ),
            ),
          ),
        );
        await tester.tap(find.text(buttonText));
        await tester.pumpAndSettle();
        expect(find.byType(Container), findsOneWidget);
        expect(find.text('🚨 Error'), findsOneWidget);
      });
    });
  });
}
