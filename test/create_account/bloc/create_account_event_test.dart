import 'package:flooz_challenge/create_account/bloc/create_account_event.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const email = 'dan@ogundiran.com';
  const name = 'Dan';

  group('CreateAccountEvent', () {
    group('NameChanged', () {
      test('supports value comparisons', () {
        expect(
          const NameChanged(name: name),
          const NameChanged(name: name),
        );
      });
    });

    group('EmailChanged', () {
      test('supports value comparisons', () {
        expect(
          const EmailChanged(email: email),
          const EmailChanged(email: email),
        );
      });
    });

    group('FormSubmitted', () {
      test('supports value comparisons', () {
        expect(
            const FormSubmitted(), const FormSubmitted()
        );
      });
    });
  });
}
