import 'package:flutter/material.dart';
import 'package:journimal_client/screen/home_eco_buddies.dart';
// import 'package:journimal_client/screen/home_eco_buddies.dart';

class RegisterPlaceScreen extends StatelessWidget {
  final TextEditingController departureController = TextEditingController();
  final TextEditingController arrivalController = TextEditingController();

  RegisterPlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 128,
                ),
                Text(
                  'Select your Travel Route',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                    color: Color(0xff022169),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Where are you traveling to?',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xff666666),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 56,
            ),
            buildTextField(
              controller: departureController,
              label: 'Departing from',
              hint: 'Enter your departure here',
            ),
            SizedBox(
              height: 34,
            ),
            buildTextField(
              controller: arrivalController,
              label: 'Arriving at',
              hint: 'Enter your arrival here',
            ),
            SizedBox(
              height: 112,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // 출발지와 도착지 입력 확인
                  if (departureController.text.trim().isEmpty ||
                      arrivalController.text.trim().isEmpty) {
                    // 스낵바 표시
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Please fill in both departure and arrival fields!',
                          style: TextStyle(
                            fontFamily: 'Pretendard',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        backgroundColor: Color(0xffFA7A7A),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const HomeEcoBuddiesScreen()));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff022169),
                  padding: EdgeInsets.symmetric(horizontal: 90, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Let's Begin the Journal!",
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Color(0xff666666),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        SizedBox(
          width: 300,
          height: 55,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Color(0xff666666),
              ),
              filled: true, // 내부 색상 채우기 활성화
              fillColor: Color(0xffF2F2F2), // 내부 색상 설정
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: Color(0xffF2F2F2),
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: Color(0xffF2F2F2),
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
