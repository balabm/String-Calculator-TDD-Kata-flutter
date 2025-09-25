import 'package:flutter/material.dart';
import 'string_calculator.dart';

void main() {
  runApp(const StringCalculatorApp());
}

class StringCalculatorApp extends StatelessWidget {
  const StringCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'String Calculator TDD Kata',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const StringCalculatorHomePage(),
    );
  }
}

class StringCalculatorHomePage extends StatefulWidget {
  const StringCalculatorHomePage({super.key});

  @override
  State<StringCalculatorHomePage> createState() => _StringCalculatorHomePageState();
}

class _StringCalculatorHomePageState extends State<StringCalculatorHomePage> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';
  String _errorMessage = '';
  final StringCalculator _calculator = StringCalculator();

  void _calculateSum() {
    setState(() {
      _errorMessage = '';
      _result = '';
      
      try {
        final input = _controller.text;
        final sum = _calculator.add(input);
        _result = 'Result: $sum';
      } on NegativeNumberException catch (e) {
        _errorMessage = 'Error: ${e.toString()}';
      } catch (e) {
        _errorMessage = 'Error: Invalid input format';
      }
    });
  }

  void _clearInput() {
    setState(() {
      _controller.clear();
      _result = '';
      _errorMessage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('String Calculator TDD Kata'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'String Calculator Demo',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Features supported:\n'
                      '• Empty string returns 0\n'
                      '• Single numbers: "5" → 5\n'
                      '• Comma-separated: "1,2,3" → 6\n'
                      '• Newlines: "1\\n2,3" → 6\n'
                      '• Custom delimiters: "//;\\n1;2" → 3\n'
                      '• Negative validation: Shows error for negatives',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter numbers',
                hintText: 'e.g., 1,2,3 or //;\\n1;2 or 1\\n2,3',
                border: OutlineInputBorder(),
                helperText: 'Try: empty, "5", "1,2,3", "1\\n2,3", "//;\\n1;2", or "1,-2" for error',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _calculateSum,
                  child: const Text('Calculate Sum'),
                ),
                OutlinedButton(
                  onPressed: _clearInput,
                  child: const Text('Clear'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (_result.isNotEmpty)
              Card(
                color: Colors.green.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _result,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade800,
                    ),
                  ),
                ),
              ),
            if (_errorMessage.isNotEmpty)
              Card(
                color: Colors.red.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _errorMessage,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade800,
                    ),
                  ),
                ),
              ),
            const Spacer(),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'This app demonstrates the String Calculator TDD Kata implementation. '
                  'All 8 tests pass, covering empty strings, single numbers, multiple numbers, '
                  'newline delimiters, custom delimiters, and negative number validation.',
                  style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
