import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(const TemperatureConverterApp());

class TemperatureConverterApp extends StatelessWidget {
  const TemperatureConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove debug banner
      theme: ThemeData(
        primaryColor: Colors.blue,
        hintColor: Colors.blueAccent,
      ),
      home: const TemperatureConverter(),
    );
  }
}

class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  double celsius = 0;
  double fahrenheit = 0;

  void convertCelsiusToFahrenheit() {
    setState(() {
      fahrenheit = (celsius * 9 / 5) + 32;
    });
  }

  void convertFahrenheitToCelsius() {
    setState(() {
      celsius = (fahrenheit - 32) * 5 / 9;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter Celsius',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  if (value.isEmpty) {
                    celsius = 0;
                  } else {
                    celsius = double.tryParse(value) ?? 0.0;
                  }
                });
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (celsius != 0) {
                  convertCelsiusToFahrenheit();
                } else {
                  Fluttertoast.showToast(
                    msg: 'Please enter a valid value for Celsius',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                  );
                }
              },
              child: const Text('Convert to Fahrenheit'),
            ),
            const SizedBox(height: 10),
            Text(
              'Fahrenheit: ${fahrenheit.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter Fahrenheit',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  if (value.isEmpty) {
                    fahrenheit = 0;
                  } else {
                    fahrenheit = double.tryParse(value) ?? 0.0;
                  }
                });
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (fahrenheit != 0) {
                  convertFahrenheitToCelsius();
                } else {
                  Fluttertoast.showToast(
                    msg: 'Please enter a valid value for Fahrenheit',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                  );
                }
              },
              child: const Text('Convert to Celsius'),
            ),
            const SizedBox(height: 10),
            Text(
              'Celsius: ${celsius.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
