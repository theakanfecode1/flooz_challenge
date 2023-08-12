import 'package:flooz_challenge/res/components/flooz_button.dart';
import 'package:flooz_challenge/res/components/flooz_text_field.dart';
import 'package:flooz_challenge/res/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FloozTextField', () {
    testWidgets('renders textField', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FloozTextField(
              title: 'Test', onTextChanged: (text) {  },
            ),
          ),
        ),
      );
      expect(find.byType(FloozTextField), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('display error message', (tester) async {
      String errorMessage = 'Invalid input';
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FloozTextField(
              title: 'Test', onTextChanged: (text) {  },errorMessage:errorMessage ,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(FloozTextField), findsOneWidget);

      final finder = find.byType(FloozTextField);
      final widget = tester.widget(finder) as FloozTextField;
      expect(
        widget.errorMessage,
        errorMessage,
      );
    });
  });
}