import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class RegisterDateScreen extends StatefulWidget {
  const RegisterDateScreen({super.key});

  @override
  State<RegisterDateScreen> createState() => _RegisterDateState();
}

class _RegisterDateState extends State<RegisterDateScreen> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  final DateTime _focusedDay = DateTime.now();

  DateTime? _startDate; // 사용자가 설정한 첫 번째 날짜
  DateTime? _endDate; // 사용자가 설정한 마지막 날짜

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 128,
            ),
            Text(
              'Select your Travel Date',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Color(0xff022169),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            TableCalendar(
              firstDay: DateTime(2000), // 기본값 설정
              lastDay: DateTime(2100), // 기본값 설정
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return day == _startDate || day == _endDate;
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  if (_startDate == null ||
                      (_startDate != null && _endDate != null)) {
                    // 출발 날짜 선택
                    _startDate = selectedDay;
                    _endDate = null; // 도착 날짜 초기화
                  } else if (selectedDay.isAfter(_startDate!)) {
                    // 도착 날짜 선택
                    _endDate = selectedDay;
                  } else {
                    // 도착 날짜가 출발 날짜보다 이전이면 재설정
                    _startDate = selectedDay;
                    _endDate = null;
                  }
                });
              },

              headerStyle: HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
                titleTextStyle: const TextStyle(
                  fontSize: 16,
                  color: Color(0xff022169),
                ),
              ),
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  if (_startDate != null &&
                      _endDate != null &&
                      day.isAfter(_startDate!) &&
                      day.isBefore(_endDate!)) {
                    return Container(
                      margin: const EdgeInsets.all(6.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xff7B8AAE).withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${day.day}',
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    );
                  }
                  return null;
                },
                selectedBuilder: (context, day, focusedDay) {
                  if (day == _startDate || day == _endDate) {
                    return Container(
                      margin: const EdgeInsets.all(6.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xff022169),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${day.day}',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
