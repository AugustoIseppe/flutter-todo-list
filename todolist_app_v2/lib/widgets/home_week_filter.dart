import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';

class HomeWeekFilter extends StatelessWidget {
  const HomeWeekFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 95,
          child: DatePicker(
            DateTime.now(),
            locale: "pt_BR",
            initialSelectedDate: DateTime.now(),
            selectedTextColor: Colors.white,
            selectionColor: Colors.deepPurpleAccent,
            daysCount: 7,
            monthTextStyle: TextStyle(fontSize: 8),
            dayTextStyle: TextStyle(fontSize: 13),
            dateTextStyle: TextStyle(fontSize: 13),
          ),
        )
      ],
    );
  }
}
