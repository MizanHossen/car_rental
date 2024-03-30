// ignore_for_file: file_names

import 'package:car_rental/helpers/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../helpers/constants/validation_class.dart';

class SimpleInputField extends StatefulWidget {
  final TextEditingController controller;
  final String fieldTitle;
  final String hintText;
  final bool needValidation;
  final String errorMessage;
  final TextInputAction? textInputAction;
  final TextInputType? inputType;
  final String? suffixText;
  final IconData? prefixIcon;
  final Color? backgroundColor;
  final bool? viewOnly;
  final bool? needTitle;
  final TextAlign? textAlign;
  final TextStyle? hintTextStyle;
  final TextStyle? inputTextStyle;
  final Key? itemkey;
  final Function? onValueChange;

  final FormFieldValidator<String>? validatorClass;

  const SimpleInputField(
      {super.key,
      this.onValueChange,
      required this.controller,
      required this.hintText,
      required this.needValidation,
      required this.errorMessage,
      this.textInputAction,
      this.inputType,
      this.suffixText,
      this.backgroundColor,
      this.viewOnly,
      required this.fieldTitle,
      this.validatorClass,
      this.needTitle,
      this.textAlign,
      this.prefixIcon,
      this.itemkey,
      this.hintTextStyle,
      this.inputTextStyle});

  @override
  State<SimpleInputField> createState() => _SimpleInputFieldState();
}

class _SimpleInputFieldState extends State<SimpleInputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.needTitle ?? true)
          Wrap(
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(text: widget.fieldTitle, style: kTitleTextStyle),
                  if (widget.needValidation)
                    TextSpan(
                      text: "*",
                      style: kTitleTextStyle.copyWith(color: Colors.red)
                    )
                ]),
              ),
            ],
          ),
        if (widget.needTitle ?? true) const SizedBox(height: 5),
        TextFormField(
          key: widget.itemkey,
          controller: widget.controller,
          keyboardType: widget.inputType ?? TextInputType.text,
          style: widget.inputTextStyle ?? kTitleTextStyle,
          textAlign: widget.textAlign ?? TextAlign.start,
          readOnly: widget.viewOnly ?? false,
          // maxLength: null,
          decoration: InputDecoration(
            // counter:AutoSizeText(""),
            errorStyle: kTitleTextStyle.copyWith(fontSize: 11, color: Colors.red),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            //label: FocusScope.of(context).focusedChild != null ?AutoSizeText(widget.hintText) : null,
            hintText: widget.hintText,
            filled: true,
            fillColor: widget.backgroundColor ?? Colors.white,
            suffixText: widget.suffixText != null ? widget.suffixText.toString() : "",
            suffixIcon: null,
            prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
            border: OutlineInputBorder(borderSide: const BorderSide(color: kBorderColor), borderRadius: BorderRadius.circular(8)),

            enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: kBorderColor), borderRadius: BorderRadius.circular(8)),
          ),
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          validator: widget.validatorClass ?? ValidatorClass().noValidationRequired,

          onFieldSubmitted: (value) {
            widget.controller.text = value;
          },
          onSaved: (value) {
            widget.controller.text = value!;
          },
          onChanged: (value) {
            if (value.isNotEmpty && widget.onValueChange != null) {
              widget.onValueChange!(value);
            }
          },
          // {
          //   if(!widget.needValidation) return null;
          //   if (value == null || value.isEmpty) {
          //     return widget.errorMessage;
          //   }
          //   return null;
          // },
        ),
      ],
    );
  }
}
