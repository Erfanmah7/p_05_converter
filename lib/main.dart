import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

TextEditingController controllerr = TextEditingController();
String From = 'kg';
String To = 'g';
String Result = 'not';

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Converter'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Value',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              child: TextField(
                controller: controllerr,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'please enter a value firset...',
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'From',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButton(
              value: From,
              onChanged: (String newValue) {
                setState(() {
                  From = newValue;
                });
              },
              items: const [
                DropdownMenuItem(
                  child: Text(
                    'kg',
                    style: TextStyle(fontSize: 20),
                  ),
                  value: 'kg',
                ),
                DropdownMenuItem(
                  child: Text(
                    'g',
                    style: TextStyle(fontSize: 20),
                  ),
                  value: 'g',
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'To',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButton(
              value: To,
              onChanged: (String newValue) {
                setState(() {
                  To = newValue;
                });
              },
              items: const [
                DropdownMenuItem(
                  child: Text(
                    'kg',
                    style: TextStyle(fontSize: 20),
                  ),
                  value: 'kg',
                ),
                DropdownMenuItem(
                  child: Text(
                    'g',
                    style: TextStyle(fontSize: 20),
                  ),
                  value: 'g',
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  calculeat();
                });
              },
              child: const Text('Convert'),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              Result,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void calculeat() {
    String Typed = controllerr.text;
    double value;
    if (Typed.length != 0) {
      value = double.parse(Typed);
    } else {
      Result = 'is not value!!!';
      return;
    }

    if (From == 'kg' && To == 'g') {
      value = value * 1000;
      Result = '$Typed $From are $value $To';
    } else if (From == 'g' && To == 'kg') {
      value = value / 1000;
      Result = '$Typed $From are $value $To';
    } else {
      value = value;
      Result = '$Typed $From are $value $To';
    }
  }
}
