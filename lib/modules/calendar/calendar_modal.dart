import 'package:flutter/material.dart';
import 'package:smuzy_flutter/common/utils/dates.dart';
import 'package:smuzy_flutter/modules/app/navigation.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarModal extends StatelessWidget {
  const CalendarModal({
    super.key,
    required this.visibleDay,
    required this.onDaySelect,
  });

  final DateTime visibleDay;
  final Function(DateTime date) onDaySelect;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TableCalendar(
            selectedDayPredicate: ((day) => visibleDay.isSameDay(day)),
            onDaySelected: (selectedDay, focusedDay) {
              onDaySelect(selectedDay);
              Navigation.closeModal(context);
            },
            calendarStyle: const CalendarStyle(
              selectedTextStyle: TextStyle(color: Colors.white),
              selectedDecoration:
                  BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
              todayTextStyle: TextStyle(color: Colors.black),
              todayDecoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
            headerStyle: const HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
            ),
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: visibleDay,
          ),
          ElevatedButton(
            onPressed: () {
              onDaySelect(DateTime.now());
              Navigation.closeModal(context);
            },
            child: const Text('Today').padding(vertical: 15),
          ).padding(horizontal: 20, vertical: 10)
        ],
      ),
    );
  }
}
