import 'package:car_rental/helpers/constants/constants.dart';
import 'package:flutter/material.dart';

class DatePickerField extends StatelessWidget {
  final String title;
  final String date;
  final VoidCallback onPickDate;

  const DatePickerField({super.key, required this.title, required this.date, required this.onPickDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: kTitleTextStyle),
            Text("*", style: kTitleTextStyle.copyWith(color: Colors.red)),
          ],
        ),
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: kBorderColor, width: 1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(date, style: kTitleTextStyle),
              IconButton(onPressed: onPickDate, icon: const Icon(Icons.calendar_today_outlined, color: kPrimaryColor))
            ],
          ),
        ),
      ],
    );
  }
}
