import 'package:flutter/material.dart';
import 'login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const softPink = Color(0xFFF7A8B8);
    const softPinkDark = Color(0xFFE58A9E);
    const softCream = Color(0xFFFDF6EC);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: softCream,
        colorScheme: ColorScheme.fromSeed(
          seedColor: softPink,
          primary: softPink,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: softPink,
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: softPink,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: softPinkDark, width: 2),
          ),
          floatingLabelStyle: const TextStyle(color: softPinkDark),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}