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
    
    String delimiter = ',';
    String numbersToProcess = numbers;
    
    // Check for custom delimiter
    if (numbers.startsWith('//')) {
      final parts = numbers.split('\n');
      delimiter = parts[0].substring(2); // Extract delimiter after '//'
      numbersToProcess = parts.sublist(1).join('\n'); // Get the numbers part
    }
    
    // Replace newlines with the current delimiter to normalize
    final normalized = numbersToProcess.replaceAll('\n', delimiter);
    final parts = normalized.split(delimiter);
    return parts.map(int.parse).reduce((a, b) => a + b);
  }
}
