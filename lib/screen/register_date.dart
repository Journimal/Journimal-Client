import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:journimal_client/screen/register_place.dart';

class RegisterDateScreen extends StatefulWidget {
  const RegisterDateScreen({super.key});

  @override
  State<RegisterDateScreen> createState() => _RegisterDateState();
}

class _RegisterDateState extends State<RegisterDateScreen> {
  final DateTime _focusedDay = DateTime.now();
  DateTime? _startDate; // 출발 날짜
  DateTime? _endDate; // 도착 날짜

  // 날짜 선택 로직
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      if (_startDate == null || (_startDate != null && _endDate != null)) {
        // 출발 날짜 선택
        _startDate = selectedDay;
        _endDate = null; // 기존 도착 날짜 초기화
      } else if (selectedDay.isAfter(_startDate!)) {
        // 도착 날짜 선택
        _endDate = selectedDay;
      } else {
        // 도착 날짜가 출발 날짜보다 이전일 경우 재설정
        _startDate = selectedDay;
        _endDate = null;
      }
    });
  }

  // 화면 이동
  void _navigateToNextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPlaceScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 128,
            ),
            const Text(
              'Select your Travel Date',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Color(0xff022169),
              ),
            ),
            const SizedBox(height: 60),
            TableCalendar(
              firstDay: DateTime(2000), // 최소 날짜
              lastDay: DateTime(2100), // 최대 날짜
              focusedDay: _focusedDay,
              rangeStartDay: _startDate, // 범위 시작 날짜
              rangeEndDay: _endDate, // 범위 종료 날짜
              calendarStyle: CalendarStyle(
                rangeHighlightColor: const Color(0xff7B8AAE),
                rangeStartDecoration: const BoxDecoration(
                  color: Color(0xff022169),
                  shape: BoxShape.circle,
                ),
                rangeEndDecoration: const BoxDecoration(
                  color: Color(0xff022169),
                  shape: BoxShape.circle,
                ),
              ),
              onDaySelected: _onDaySelected, // 콜백 메서드로 분리
              headerStyle: HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
                titleTextStyle: const TextStyle(
                  fontSize: 16,
                  color: Color(0xff022169),
                  fontWeight: FontWeight.bold,
                ),
                leftChevronIcon: const Icon(
                  Icons.chevron_left,
                  color: Color(0xff022169),
                ),
                rightChevronIcon: const Icon(
                  Icons.chevron_right,
                  color: Color(0xff022169),
                ),
              ),
            ),
            const SizedBox(height: 60),
            SizedBox(
              width: 150,
              height: 40,
              child: ElevatedButton(
                onPressed: _navigateToNextScreen, // 메서드로 분리
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff022169),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4), // radius 설정
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 15),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
