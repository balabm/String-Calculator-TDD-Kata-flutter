/// String Calculator implementation following TDD principles
/// Kata requirements:
/// 1. Empty string returns 0
/// 2. Single number returns that number
/// 3. Two comma-separated numbers return their sum
/// 4. Any amount of numbers supported
/// 5. Newline delimiters supported
/// 6. Custom delimiters supported
/// 7. Negative number validation

/// Exception thrown when negative numbers are used in calculation
class NegativeNumberException implements Exception {
  final String message;
  
  NegativeNumberException(this.message);
  
  @override
  String toString() => message;
}

class StringCalculator {
  /// Calculate sum of numbers in a string
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }
    
    final (delimiter, numbersToProcess) = _parseDelimiterAndNumbers(numbers);
    final parsedNumbers = _parseNumbers(numbersToProcess, delimiter);
    
    _validateNoNegativeNumbers(parsedNumbers);
    
    return parsedNumbers.reduce((a, b) => a + b);
  }
  
  /// Parse delimiter and numbers from input string
  (String, String) _parseDelimiterAndNumbers(String input) {
    if (input.startsWith('//')) {
      final parts = input.split('\n');
      final delimiter = parts[0].substring(2);
      final numbersToProcess = parts.sublist(1).join('\n');
      return (delimiter, numbersToProcess);
    }
    return (',', input);
  }
  
  /// Parse numbers from string using the given delimiter
  List<int> _parseNumbers(String numbersText, String delimiter) {
    final normalized = numbersText.replaceAll('\n', delimiter);
    final parts = normalized.split(delimiter);
    return parts.map(int.parse).toList();
  }
  
  /// Validate that no negative numbers are present
  void _validateNoNegativeNumbers(List<int> numbers) {
    final negativeNumbers = numbers.where((num) => num < 0).toList();
    if (negativeNumbers.isNotEmpty) {
      final negativeList = negativeNumbers.join(', ');
      throw NegativeNumberException('negative numbers not allowed: $negativeList');
    }
  }
}
