import 'package:flutter/material.dart';

class SuccessSurveyScreen extends StatelessWidget {
  const SuccessSurveyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WellDoneScreen(),
    );
  }
}

class WellDoneScreen extends StatelessWidget {
  const WellDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Well done!",
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    color: Color(0xff424242),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Nailed it,\n your mission has been certified.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    color: Color(0xff666666),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    // 버튼 클릭 시 동작 추가
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff022169),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 130, vertical: 16.0),
                  ),
                  child: const Text(
                    "Done",
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
