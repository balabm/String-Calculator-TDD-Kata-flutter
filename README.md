# string_calculator_tdd

A new Flutter project.

## Getting Started

# String Calculator TDD Kata - Flutter Assessment

This repository demonstrates Test-Driven Development (TDD) practices through the implementation of a String Calculator kata using Flutter and Dart.

## 🎯 Assessment Requirements Completed

✅ **All Requirements Implemented:**
- Empty string returns 0
- Single number returns that number  
- Two comma-separated numbers return their sum
- Any amount of numbers supported
- Newline delimiters supported (`"1\n2,3"` returns 6)
- Custom delimiters supported (`"//;\n1;2"` returns 3)
- Negative number validation with proper exception messages
- Multiple negatives shown in exception message

## 📊 Final Test Results

**8 tests, 8 passing** ✅

```bash
flutter test
```

## 🔄 TDD Process Demonstrated

Each commit shows TDD evolution following the Red-Green-Refactor cycle:

### Commit History:
1. 🔴 **RED**: Initial failing test - empty string should return 0
2. 🟢 **GREEN**: Implement empty string returns 0
3. 🔴 **RED**: Add failing test for single number
4. 🟢 **GREEN**: Implement single number parsing
5. 🔴 **RED**: Add failing test for two comma-separated numbers
6. 🟢 **GREEN**: Implement comma-separated numbers sum
7. 🟢 **GREEN**: Add test for multiple numbers (already supported)
8. 🔴 **RED**: Add failing test for newline delimiters
9. 🟢 **GREEN**: Implement newline delimiter support
10. 🔴 **RED**: Add failing test for custom delimiters
11. 🟢 **GREEN**: Implement custom delimiter support
12. 🔴 **RED**: Add failing tests for negative number validation
13. 🟢 **GREEN**: Implement negative number validation with proper exception
14. 🔵 **REFACTOR**: Extract methods for better code organization and readability

## 🚀 Technologies Used

- **Flutter 3.x**
- **Dart** with modern language features
- **flutter_test** framework for unit testing
- **Git** with disciplined commit practices

## 🏗️ Project Structure

```
lib/
├── main.dart                    # Flutter app entry point
└── string_calculator.dart       # String Calculator implementation

test/
└── string_calculator_test.dart  # TDD tests
```

## 🧪 Running Tests

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run specific test file
flutter test test/string_calculator_test.dart
```

## 🔍 Key TDD Principles Demonstrated

1. **Red Phase**: Write a failing test first
2. **Green Phase**: Write minimal code to make the test pass
3. **Refactor Phase**: Improve code structure while keeping tests green
4. **Small Steps**: Each feature implemented incrementally
5. **Disciplined Commits**: Clear commit messages showing TDD phases
