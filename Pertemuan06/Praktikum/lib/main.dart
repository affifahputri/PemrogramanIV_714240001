import 'package:flutter/material.dart';
import 'bottom_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const DynamicBottomNavbar(),
    );
  }
}

class MyInput extends StatefulWidget {
  const MyInput({super.key});

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  final TextEditingController _controller = TextEditingController();

  // State Switch
  bool lightOn = false;

  // State Radio
  String? language;

  // 1. State Checkbox (E. Checkbox)
  bool agree = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Method Snackbar untuk Radio
  void showSnackbar() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$language selected'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Widget'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // A. TextField
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Write your name here...',
                  labelText: 'Your Name',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text('Hello, ${_controller.text}'),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 20),

              // C. Switch
              Switch(
                value: lightOn,
                onChanged: (bool value) {
                  setState(() {
                    lightOn = value;
                  });

                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(lightOn ? 'Light On' : 'Light Off'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),

              // D. Radio
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<String>(
                    title: const Text('Dart'),
                    value: 'Dart',
                    groupValue: language,
                    onChanged: (String? value) {
                      setState(() {
                        language = value;
                        showSnackbar();
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Kotlin'),
                    value: 'Kotlin',
                    groupValue: language,
                    onChanged: (String? value) {
                      setState(() {
                        language = value;
                        showSnackbar();
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Swift'),
                    value: 'Swift',
                    groupValue: language,
                    onChanged: (String? value) {
                      setState(() {
                        language = value;
                        showSnackbar();
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // 2. E. CheckboxListTile & SnackBar tantangan modul
              CheckboxListTile(
                title: const Text('Agree / Disagree'),
                value: agree,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool? value) {
                  setState(() {
                    agree = value!;
                  });

                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(agree ? 'Agree' : 'Disagree'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}