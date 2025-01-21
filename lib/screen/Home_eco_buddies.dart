import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<String> fetchUserName(String token) async {
  try {
    final response = await http.get(
      Uri.parse('http://10.0.2.2:3000/user/name'),
      headers: {
        'Authorization': 'Bearer $token', // 토큰 추가
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] == 200) {
        return jsonResponse['data'];
      } else {
        throw Exception('Failed to load username: ${jsonResponse['message']}');
      }
    } else {
      throw Exception('HTTP error: ${response.statusCode}');
    }
  } catch (e) {
    log('Error fetching username: $e');
    throw Exception('Failed to load username');
  }
}

class HomeEcoBuddiesScreen extends StatefulWidget {
  const HomeEcoBuddiesScreen({super.key});

  @override
  _HomeEcoBuddiesScreenState createState() => _HomeEcoBuddiesScreenState();
}

class _HomeEcoBuddiesScreenState extends State<HomeEcoBuddiesScreen> {
  String? _username;

  @override
  void initState() {
    super.initState();

    const userToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiamVubmlmZXIwNTA4IiwiaWF0IjoxNzM3MzMwMzM4LCJleHAiOjE3MzczMzM5Mzh9.wpOyLVMxwkAvZ9pxPRRCGz0Gvs4LgDpY4UekUhFInZA'; // 실제 사용자 토큰으로 대체
    fetchUserName(userToken).then((name) {
      log('Fetched username: $name');
      setState(() {
        _username = name;
      });
    }).catchError((e) {
      log('Error in fetchUserName: $e');
      setState(() {
        _username = 'Error';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7E7B9),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(58),
        child: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 2.0,
          backgroundColor: Color(0xff022169),
          flexibleSpace: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 20),
                child: Image.asset(
                  "assets/images/journimal_logo.png",
                  width: 180,
                  height: 22,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(30.0),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Day 1',
                    style: TextStyle(
                      color: Color(0xff424242),
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  _username == null
                      ? const Center(child: CircularProgressIndicator())
                      : Text(
                          'Hi, $_username',
                          style: const TextStyle(
                            color: Color(0xff424242),
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/ani_koala.png',
              errorBuilder: (context, error, stackTrace) =>
                  const Text('Image not found'),
            ),
            const SizedBox(
              height: 40,
            ),
            // Progress Bar
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'LV.0',
                    style: TextStyle(
                      color: Color(0xff424242),
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      height: 10,
                      decoration: BoxDecoration(
                        color: const Color(0xffE0E0E0),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: 0.3, // Progress (adjust value as needed)
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffFFD966),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    '0 / 2',
                    style: TextStyle(
                      color: Color(0xff424242),
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xff003366),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Current Mission Button
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Current Mission',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Mission Placeholder and Grow Up Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Placeholder Text Box
                      Container(
                        width: 200,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xff003366),
                        ),
                        child: const Center(
                          child: Text(
                            "You haven’t chosen\nyour mission yet :(",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      // Grow Up Button
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'Grow Up',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes_outlined),
            label: 'Mission',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'My trip',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Info',
          ),
        ],
        selectedItemColor: const Color(0xff022169),
        unselectedItemColor: const Color(0xffD9D9D9),
        backgroundColor: Colors.white,
      ),
    );
  }
}
