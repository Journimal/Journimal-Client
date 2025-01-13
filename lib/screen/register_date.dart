import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class RegisterDateScreen extends StatefulWidget {
  const RegisterDateScreen({super.key});

  @override
  State<RegisterDateScreen> createState() => _RegisterDateState();
}

class _RegisterDateState extends State<RegisterDateScreen> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  DateTime? _firstDay;
  DateTime? _lastDay;

  @override
  void initState() {
    super.initState();
    // 여기에서 사용자가 설정한 날짜를 설정하거나 기본값을 설정할 수 있습니다.
    // 예시로 첫 번째 날짜는 2023년 1월 1일, 마지막 날짜는 2025년 12월 31일로 설정
    _firstDay = DateTime(2023, 1, 1);
    _lastDay = DateTime(2025, 12, 31);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TableCalendar(
        firstDay: _firstDay ?? DateTime(2020, 1, 1), // 기본값 설정
        lastDay: _lastDay ?? DateTime(2030, 12, 31), // 기본값 설정
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
        onPageChanged: (focusedDay) {
          setState(() {
            _focusedDay = focusedDay;
          });
        },
      ),
    );
  }
}
