import 'package:flutter/material.dart';
import 'package:journimal_client/screen/success_survey.dart';
import 'package:journimal_client/screen/fail_survey.dart'; // 실패 화면 import

class MissionSurvey1Screen extends StatefulWidget {
  const MissionSurvey1Screen({super.key});

  @override
  _MissionSurvey1ScreenState createState() => _MissionSurvey1ScreenState();
}

class _MissionSurvey1ScreenState extends State<MissionSurvey1Screen> {
  String? firstquestion; // 첫 번째 질문 상태 변수
  String? secondquestion; // 두 번째 질문 상태 변수
  String? thirdquestion; // 세 번째 질문 상태 변수

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(58),
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text('Use a personal water bottle'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/mission_photo/m_ph_1.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Use a personal water bottle',
                    style: TextStyle(
                      color: Color(0xff424242),
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      fontSize: 21,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Bring your own water bottle instead of disposable plastic.',
                    style: TextStyle(
                      color: Color(0xff666666),
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Divider(indent: 15, endIndent: 15),
            const SizedBox(height: 20),
            // 첫 번째 질문
            _buildQuestion(
              question:
                  'Did you bring a reusable water bottle for your trip instead of buying a plastic one?',
              value: firstquestion,
              onChanged: (value) {
                setState(() {
                  firstquestion = value;
                });
              },
            ),
            const SizedBox(height: 20),
            const Divider(indent: 15, endIndent: 15),
            const SizedBox(height: 20),
            // 두 번째 질문
            _buildQuestion(
              question:
                  'Did you actively look for refill stations during your trip?',
              value: secondquestion,
              onChanged: (value) {
                setState(() {
                  secondquestion = value;
                });
              },
            ),
            const SizedBox(height: 20),
            const Divider(indent: 15, endIndent: 15),
            const SizedBox(height: 20),
            // 세 번째 질문
            _buildQuestion(
              question:
                  'Did you save money and reduce waste by refilling your water bottle instead of purchasing drinks?',
              value: thirdquestion,
              onChanged: (value) {
                setState(() {
                  thirdquestion = value;
                });
              },
            ),
            const SizedBox(height: 20),
            // 제출 버튼
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (firstquestion != null &&
                      secondquestion != null &&
                      thirdquestion != null) {
                    // Yes 응답 개수 계산
                    int yesCount = [
                      firstquestion,
                      secondquestion,
                      thirdquestion
                    ].where((response) => response == 'yes').length;

                    // 조건에 따라 화면 이동
                    if (yesCount >= 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SuccessSurveyScreen(),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FailSurveyScreen(),
                        ),
                      );
                    }
                  } else {
                    // 모든 질문에 응답하지 않은 경우 경고 메시지
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please answer all questions!'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff022169),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 130,
                    vertical: 16.0,
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // 질문 위젯 생성 함수
  Widget _buildQuestion({
    required String question,
    required String? value,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(
              color: Color(0xff424242),
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
              fontSize: 21,
            ),
          ),
          RadioListTile<String>(
            value: 'yes',
            groupValue: value,
            title: const Text('Yes, I did.'),
            onChanged: onChanged,
          ),
          RadioListTile<String>(
            value: 'no',
            groupValue: value,
            title: const Text('No, I didn’t.'),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
