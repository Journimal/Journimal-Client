import 'package:flutter/material.dart';
import 'package:journimal_client/screen/register_date.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController id = TextEditingController();
  final TextEditingController pw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff022169),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(),
      ),
      body: Builder(
        builder: (BuildContext context) {
          // Builder를 사용하여 context를 적절히 연결
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'LOGO',
                  style: TextStyle(
                    fontSize: 60,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 60),
                SizedBox(
                  width: 319,
                  height: 62,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      hintText: 'Enter your Email address',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    controller: id,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: 319,
                  height: 62,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      hintText: 'Enter your Password',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    controller: pw,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 60),
                SizedBox(
                  width: 319,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      // 임시 로그인
                      if (id.text == 'mei@hello.com' && pw.text == '1234') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterDateScreen(),
                          ),
                        );
                      } else if (id.text == 'mei@hello.com' &&
                          pw.text != '1234') {
                        showSnackBar(context, Text('Wrong password'));
                      } else if (id.text != 'mei@hello.com' &&
                          pw.text == '1234') {
                        showSnackBar(context, Text('Wrong email'));
                      } else {
                        showSnackBar(context, Text('Check your info again'));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: Text(
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
          );
        },
      ),
    );
  }
}

void showSnackBar(BuildContext context, Text text) {
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Row(
      children: [
        Icon(
          Icons.error_outline,
          color: Colors.white,
        ),
        SizedBox(
          width: 8,
        ),
        text,
      ],
    ),
    backgroundColor: Color(0xffFA7A7A),
    duration: Duration(seconds: 3),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
