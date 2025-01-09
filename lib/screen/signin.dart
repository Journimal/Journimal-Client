// lib/screens/second_screen.dart
import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is Second Screen'),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Go to First Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
