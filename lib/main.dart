import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";
  String _input = "";
  String _operator = "";
  double _num1 = 0;
  double _num2 = 0;

  // Function to update the output
  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _input = "";
        _output = "0";
        _num1 = 0;
        _num2 = 0;
        _operator = "";
      } else if (buttonText == "=") {
        if (_operator.isNotEmpty && _input.isNotEmpty) {
          _num2 = double.parse(_input);
          if (_operator == "+") {
            _output = (_num1 + _num2).toString();
          } else if (_operator == "-") {
            _output = (_num1 - _num2).toString();
          } else if (_operator == "*") {
            _output = (_num1 * _num2).toString();
          } else if (_operator == "/") {
            if (_num2 == 0) {
              _output = "Error"; // Handle division by zero
            } else {
              _output = (_num1 / _num2).toString();
            }
          }
          _input = _output;
        }
      } else if (buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/") {
        _num1 = double.parse(_input);
        _operator = buttonText;
        _input = "";
      } else {
        _input += buttonText;
        _output = _input;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Calculator:Attiya"),

          backgroundColor: Colors.orange,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Output display
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                _output,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold,color: Colors.cyan),
              ),
            ),
            // Buttons
            Column(
            children: [
SizedBox(height: 10,),     Row(
                  children: [
                    _buildButton("7"),
                    _buildButton("8"),
                    _buildButton("9"),
                    _buildButton("/"),
                  ],
                ),
                Row(
                  children: [
                    _buildButton("4"),
                    _buildButton("5"),
                    _buildButton("6"),
                    _buildButton("*"),
                  ],
                ),
                Row(
                  children: [
                    _buildButton("1"),
                    _buildButton("2"),
                    _buildButton("3"),
                    _buildButton("-"),
                  ],
                ),
                Row(
                  children: [
                    _buildButton("C"),
                    _buildButton("0"),
                    _buildButton("="),
                    _buildButton("+"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Button widget
  Widget _buildButton(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _buttonPressed(buttonText),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      backgroundColor: Colors.blueGrey,
        ),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
