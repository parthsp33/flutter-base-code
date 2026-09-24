import 'package:base_project/util/validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Validator', () {
    test('email', () {
      expect(Validator.isEmail('user@example.com'), isTrue);
      expect(Validator.isEmail('user.name+tag@mail.co.in'), isTrue);
      expect(Validator.isEmail('user@'), isFalse);
      expect(Validator.isEmail('user.example.com'), isFalse);
    });

    test('password needs upper, lower, number, special and 8 chars', () {
      expect(Validator.isPassword('Abcdef1!'), isTrue);
      expect(Validator.isPassword('abcdef1!'), isFalse);
      expect(Validator.isPassword('Abcdefg!'), isFalse);
      expect(Validator.isPassword('Ab1!'), isFalse);
    });

    test('phone', () {
      expect(Validator.isPhone('9876543210'), isTrue);
      expect(Validator.isPhone('12345'), isFalse);
      expect(Validator.isPhone('98765abc10'), isFalse);
    });

    test('website', () {
      expect(Validator.isWebsite('https://example.com'), isTrue);
      expect(Validator.isWebsite('http://sub.example.com/path?a=1'), isTrue);
      expect(Validator.isWebsite('example.com'), isFalse);
    });

    test('expiry date', () {
      final nextYear = (DateTime.now().year + 1) % 100;
      expect(Validator.isValidExpiryDate('12/${nextYear.toString().padLeft(2, '0')}'), isTrue);
      expect(Validator.isValidExpiryDate('01/20'), isFalse);
      expect(Validator.isValidExpiryDate('13/30'), isFalse);
      expect(Validator.isValidExpiryDate('1230'), isFalse);
    });
  });

  group('Types', () {
    test('safe conversion', () {
      expect(Types.getInt('12'), 12);
      expect(Types.getInt(12.7), 12);
      expect(Types.getInt(null), 0);
      expect(Types.getDouble('1.5'), 1.5);
      expect(Types.getString(5), '5');
      expect(Types.getString(null), '');
      expect(Types.getBool(1), isTrue);
      expect(Types.getBool('false'), isFalse);
    });
  });
}
