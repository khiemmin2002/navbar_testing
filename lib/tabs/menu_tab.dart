import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

class MenuEntry {
  final String name;
  final String description;
  final String mealPeriod;
  final String classroom;
  final String 
  final Color backgroundColor;

  MenuEntry({
    required this.name,
    required this.description,
    required this.backgroundColor,
  });
}

class MenuTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          EasyDateTimeLine(
            initialDate: DateTime.now(),
            onDateChange: (selectedDate) {
              //`selectedDate` the new date selected.
            },
            activeColor: Color.fromRGBO(254, 206, 38, 1),
            dayProps: const EasyDayProps(
              dayStructure: DayStructure.dayStrDayNum,
              width: 55.0,
              height: 70.0,
              todayHighlightStyle: TodayHighlightStyle.withBorder,
              todayHighlightColor: Color.fromRGBO(254, 206, 38, 1),
            ),
          )
        ],
      ),
    );
  }
}
