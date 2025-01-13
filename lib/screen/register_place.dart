import 'package:flutter/material.dart';

class RegisterPlaceScreen extends StatelessWidget {
  const RegisterPlaceScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 128,
            ),
            const Text(
              'Select your Travel Place',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Color(0xff022169),
              ),
            ),
            const Text(
              'Where are you traveling to?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xff666666),
              ),
            ),
            SizedBox(
              height: 120,
            ),
            SizedBox(
              width: 280,
              height: 45,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xff022169),
                ),
                child: Text(
                  "Let's Journimal!",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
