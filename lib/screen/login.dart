import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:journimal_client/screen/register_date.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController id = TextEditingController();
  final TextEditingController pw = TextEditingController();

  // Secure storage instance
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff022169),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'LOGO',
              style: TextStyle(
                fontSize: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 60),
            SizedBox(
              width: 319,
              height: 62,
              child: TextField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  hintText: 'Enter your ID',
                  hintStyle: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                controller: id,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 319,
              height: 62,
              child: TextField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  hintText: 'Enter your Password',
                  hintStyle: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                controller: pw,
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
            ),
            const SizedBox(height: 60),
            SizedBox(
              width: 319,
              height: 55,
              child: ElevatedButton(
                onPressed: () async {
                  await _login(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    color: Color(0xff022169),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _login(BuildContext context) async {
    final userId = id.text.trim();
    final password = pw.text.trim();

    // 유효성 검사 (서버에서 요구하는 조건에 맞게 확인)
    if (userId.length < 4 || userId.length > 20) {
      showSnackBar(context, const Text('아이디는 4자 이상 20자 이하이어야 합니다.'));
      return;
    }

    if (password.length < 4 || password.length > 20) {
      showSnackBar(context, const Text('비밀번호는 4자 이상 20자 이하이어야 합니다.'));
      return;
    }

    // 서버에 전송할 id와 pw가 알파벳, 숫자, 특수문자만 포함하는지 확인
    final regex = RegExp(r'^[a-zA-Z0-9!@#$%^&*()._-]+$');
    if (!regex.hasMatch(password)) {
      showSnackBar(context, const Text('비밀번호는 알파벳, 숫자, 특수문자만 포함할 수 있습니다.'));
      return;
    }

    // API endpoint
    const String apiUrl =
        'http://10.0.2.2:3000/auth/log-in'; // Replace with your API URL

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'user_id': userId, 'user_pw': password}),
      );

      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);

        // token을 storage에 저장
        await _secureStorage.write(key: 'jwt', value: responseData['token']);

        // Navigate to the next screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RegisterDateScreen(),
          ),
        );
      } else {
        final errorResponse = jsonDecode(response.body);
        final errorMessage = errorResponse['message'];

        if (errorMessage is List) {
          // 에러 메시지가 배열인 경우
          final formattedError = errorMessage.join('\n'); // 배열을 문자열로 변환
          showSnackBar(context, Text(formattedError));
        } else if (errorMessage is String) {
          // 에러 메시지가 문자열인 경우
          showSnackBar(context, Text(errorMessage));
        } else {
          // 예상치 못한 에러 포맷
          showSnackBar(context, const Text('알 수 없는 오류가 발생했습니다.'));
        }
      }
    } catch (e) {
      // Print the exception to the terminal
      print('Exception: $e');
    }
  }
}

void showSnackBar(BuildContext context, Text text) {
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Row(
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.white,
        ),
        const SizedBox(
          width: 8,
        ),
        text,
      ],
    ),
    backgroundColor: const Color(0xffFA7A7A),
    duration: const Duration(seconds: 3),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
