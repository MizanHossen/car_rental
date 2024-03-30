import 'package:car_rental/helpers/constants/constants.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Widget child;
  final Color? color;
  const ContainerWidget({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.padding,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      //width: width ?? MediaQuery.sizeOf(context).width,
      width: width,

      padding: padding ?? const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
          border: Border.all(color: kPrimaryColor.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(8)),
      child: child,
    );
  }
}
