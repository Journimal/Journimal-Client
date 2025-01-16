import 'package:flutter/material.dart';
import 'package:journimal_client/screen/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journimal',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: SignupScreen(),
    );
  }
}
