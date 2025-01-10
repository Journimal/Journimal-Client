// lib/screens/first_screen.dart
import 'package:flutter/material.dart';
import 'package:journimal_client/screen/register_date.dart';
import 'package:journimal_client/screen/signup.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'LOGO',
              style: TextStyle(
                fontSize: 50,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            SizedBox(
              width: 319,
              height: 62,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Enter Email',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(
              width: 319,
              height: 62,
              child: TextField(
                decoration: InputDecoration(labelText: 'Enter password'),
                keyboardType: TextInputType.text,
                obscureText: true, // 비밀번호 안보이게
              ),
            ),
            SizedBox(
              height: 60,
            ),
            SizedBox(
              width: 319,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignupScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff666666),
                ),
                child: Text(
                  'Log in',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterDateScreen()),
                );
              },
              child: Text('Sign up here!'),
            ),
          ],
        ),
      ),
    );
  }
}
