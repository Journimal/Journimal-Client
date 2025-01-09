import 'package:flutter/material.dart';
import 'package:journimal_client/screen/register_date.dart';

class RegisterDateScreen extends StatelessWidget {
  const RegisterDateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('this is register')],
        ),
      ),
    );
  }
}
