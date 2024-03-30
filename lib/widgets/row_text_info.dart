// ignore_for_file: file_names


import 'package:car_rental/helpers/constants/constants.dart';
import 'package:flutter/material.dart';
class RowTextInfo extends StatefulWidget {
  final String title;
  final String information;
  final Color? titleColor;
  final Color? informationColor;
  final TextStyle? titleStyle;
  final TextStyle? informationStyle;
  final double? titleWidth;
  final double? subTitleWidth;
  final int? titleMaxLine;
  final int? subTitleMaxLine;
  const RowTextInfo(
      {super.key,
        required this.title,
        required this.information,
        this.titleStyle,
        this.informationStyle,
        this.titleColor,
        this.informationColor,
        this.titleWidth,
        this.titleMaxLine,
        this.subTitleWidth,
        this.subTitleMaxLine});

  @override
  State<RowTextInfo> createState() => _RowTextInfoState();
}

class _RowTextInfoState extends State<RowTextInfo> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: widget.titleWidth ?? size.width * .3,
            child:Text(widget.title,
                maxLines: widget.titleMaxLine ?? 1,
                overflow: TextOverflow.ellipsis,
                style: widget.titleStyle ??
                    kTitleTextStyle.copyWith(
                        color: widget.titleColor ?? kSecounderyTextColor))),
        SizedBox(
            width: widget.subTitleWidth ?? size.width * .35,//update 0.05
            child:Text(widget.information,
                textAlign: TextAlign.end,
                maxLines: widget.subTitleMaxLine ?? 1,
                overflow: TextOverflow.ellipsis,
                style: widget.informationStyle ??
                    kTitleTextStyle.copyWith(
                        color: widget.informationColor ?? kTextColor))),
      ],
    );
  }
}
