import 'package:car_rental/helpers/constants/constants.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  final bool required;
  final Widget? suffix;

  const InputField({
    super.key,
    required this.title,
    this.controller,
    this.required = true,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: kTitleTextStyle),
            Text(required ? "*" : '', style: kTitleTextStyle.copyWith(color: Colors.red)),
          ],
        ),
        // Container(
        //   height: 50,
        //   padding: EdgeInsets.symmetric(horizontal: 10),
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(8),
        //       border: Border.all(color: AppColors.kBorderColor, width: 2)),
        //   child: TextField(
        //     decoration: InputDecoration(border: InputBorder.none),
        //   ),
        // ),
        SizedBox(
          height: 50,
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                suffix: suffix,
                suffixIconColor: kPrimaryColor,
                border: OutlineInputBorder(borderSide: const BorderSide(color: kBorderColor), borderRadius: BorderRadius.circular(8)),
                enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: kBorderColor, width: 2), borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
