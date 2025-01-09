import 'package:flutter/material.dart';
import 'package:journimal_client/screen/login.dart';
import 'package:journimal_client/screen/signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: LoginScreen(), //원래 여기 MyHomePage 해서 바로 아래에 class를
      // 생성했지만 지금은 외부 패키지 (파일)을 불러와서
      // 다른 파일에서 생성한 클래스를 사용!
    );
  }
}
