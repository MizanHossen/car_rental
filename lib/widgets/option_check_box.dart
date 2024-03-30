import 'package:flutter/material.dart';
import '../helpers/constants/constants.dart';

class OptionCheckbox extends StatelessWidget {
  final String option;
  final String price;
  final String selectedOption;
  final Function(String, String, String) onSelect;
  bool? currency;
  bool? percentage;

  OptionCheckbox({
    required this.option,
    required this.price,
    required this.selectedOption,
    required this.onSelect,
    this.currency,
    this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          checkColor: kBorderColor,
          value: selectedOption == option,
          onChanged: (bool? newValue) {
            if (newValue == true) {
              onSelect(option, price, currency== true? "\$": "%");
            }
          },
        ),
        Text(option),
        Spacer(),
        Row(
          children: [
            if(currency == true)
            Text("\$"),
            
            Text(price),
            if(percentage == true)
            Text("%")
          ],
        )
      ],
    );
  }
}
