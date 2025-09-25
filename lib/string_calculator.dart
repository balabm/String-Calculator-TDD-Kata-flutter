/// String Calculator implementation following TDD principles
/// Kata requirements:
/// 1. Empty string returns 0
/// 2. Single number returns that number
/// 3. Two comma-separated numbers return their sum
/// 4. Any amount of numbers supported
/// 5. Newline delimiters supported
/// 6. Custom delimiters supported
/// 7. Negative number validation
class StringCalculator {
  /// Calculate sum of numbers in a string
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }
    
    return int.parse(numbers);
  }
}
