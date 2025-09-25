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

    test('should handle any amount of numbers', () {
      // Act
      final result = calculator.add('1,2,3,4,5');
      
      // Assert
      expect(result, equals(15));
    });

    test('should handle newline delimiters', () {
      // Act
      final result = calculator.add('1\n2,3');
      
      // Assert
      expect(result, equals(6));
    });

    test('should handle custom delimiters', () {
      // Act
      final result = calculator.add('//;\n1;2');
      
      // Assert
      expect(result, equals(3));
    });

    test('should throw exception for negative numbers', () {
      // Act & Assert
      expect(
        () => calculator.add('1,-2,3'),
        throwsA(isA<NegativeNumberException>()
            .having((e) => e.toString(), 'message', 
                    contains('negative numbers not allowed: -2'))),
      );
    });

    test('should throw exception with all negative numbers listed', () {
      // Act & Assert
      expect(
        () => calculator.add('1,-2,-3,4'),
        throwsA(isA<NegativeNumberException>()
            .having((e) => e.toString(), 'message', 
                    contains('negative numbers not allowed: -2, -3'))),
      );
    });
  });
}
