import 'package:flutter/material.dart';
import 'package:journimal_client/screen/login.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void showSnackBar(BuildContext context, String message,
      {bool isError = true}) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          Icon(
            isError ? Icons.error_outline : Icons.check_circle_outline,
            color: Colors.white,
          ),
          SizedBox(width: 8),
          Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      backgroundColor: isError ? Color(0xffFA7A7A) : Color(0xff4CAF50),
      duration: Duration(seconds: 30),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> validateAndSignup(BuildContext context) async {
    if (nameController.text.isEmpty ||
        idController.text.isEmpty ||
        passwordController.text.isEmpty) {
      showSnackBar(context, 'Please enter all fields.');
      return;
    }

    const String apiUrl = "http://10.0.2.2:3000/auth/sign-up"; // 서버 IP 주소로 수정
    final Map<String, String> data = {
      "user_id": idController.text,
      "user_pw": passwordController.text,
      "user_name": nameController.text,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );

      if (!context.mounted) return; // 위젯이 여전히 트리에 존재하는지 확인

      if (response.statusCode == 201) {
        // request has been successfully processed
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      } else if (response.statusCode == 409) {
        // The server determines that the user is duplicated
        showSnackBar(context, 'User already exists');
      } else {
        // Handling Other Errors
        final responseBody = jsonDecode(response.body);
        showSnackBar(context,
            'Sign up failed: ${responseBody["message"] ?? "Unknown error"}');
      }
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context, '$e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff022169),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Text(
                'Welcome to',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              Text(
                'LOGO',
                style: TextStyle(fontSize: 60, color: Colors.white),
              ),
              SizedBox(height: 20),
              buildTextField(nameController, 'Enter your Name'),
              SizedBox(height: 16),
              buildTextField(idController, 'Enter your ID'),
              SizedBox(height: 16),
              buildTextField(passwordController, 'Enter your Password',
                  obscureText: true),
              SizedBox(height: 60),
              SizedBox(
                width: 319,
                height: 55,
                child: ElevatedButton(
                  onPressed: () => validateAndSignup(context),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffffffff)),
                  child: Text(
                    'Sign up',
                    style: TextStyle(color: Color(0xff022169), fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffffffff),
                      minimumSize: const Size(48, 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        color: Color(0xff022169),
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String hintText,
      {TextInputType keyboardType = TextInputType.text,
      bool obscureText = false}) {
    return SizedBox(
      width: 319,
      height: 62,
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white, width: 1.0),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white),
        ),
        keyboardType: keyboardType,
        obscureText: obscureText,
      ),
    );
  }
}
