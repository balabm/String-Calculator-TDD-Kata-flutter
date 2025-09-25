import 'package:flutter_test/flutter_test.dart';
import 'package:string_calculator_tdd/string_calculator.dart';

void main() {
  group('String Calculator Tests', () {
    late StringCalculator calculator;

    setUp(() {
      calculator = StringCalculator();
    });

    test('should return 0 for empty string', () {
      // Act
      final result = calculator.add('');
      
      // Assert
      expect(result, equals(0));
    });

    test('should return the number itself for single number', () {
      // Act
      final result = calculator.add('5');
      
      // Assert
      expect(result, equals(5));
    });

    test('should return sum of two comma-separated numbers', () {
      // Act
      final result = calculator.add('1,2');
      
      // Assert
      expect(result, equals(3));
    });
  });
}
