// ignore_for_file: file_names
import 'package:car_rental/helpers/constants/constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropDownInputField extends StatefulWidget {
  final TextEditingController controller;
  final String fieldTitle;
  final String hintText;
  final bool needValidation;
  final String errorMessage;
  final TextInputAction? textInputAction;
  final String? suffixText;
  final Color? backgroundColor;
  final bool? needTitle;
  final bool? setInitialValue;
  final List<String>? items;
  final List<DropdownMenuItem>? itemBuilder;
  final Function? onValueChange;
  final Key? itemkey;

  ///Common Error factor
  /// 1=> If item list contains duplicate values

  const DropDownInputField(
      {super.key,
        required this.controller,
        required this.hintText,
        required this.needValidation,
        required this.errorMessage,
        this.textInputAction,
        this.suffixText,
        this.backgroundColor,
        required this.fieldTitle,
        this.needTitle,
        this.items,
        this.setInitialValue,
        this.itemkey,
        this.onValueChange,
        this.itemBuilder,
      });

  @override
  State<DropDownInputField> createState() => _DropDownInputFieldState();
}

class _DropDownInputFieldState extends State<DropDownInputField> {
  List<DropdownMenuItem> activeItemList = [];
  final TextEditingController searchController = TextEditingController();
  bool isMenuOpen = false;

  @override
  void initState() {
    if (widget.items != null && widget.itemBuilder == null) {
      activeItemList = widget.items!.map((e) => DropdownMenuItem(value: e.toString(), child:Text(e, style: kFieldTextStyle))).toList();
    } else if ((widget.items == null && widget.itemBuilder != null)) {
      activeItemList = widget.itemBuilder!;
    } else {
      activeItemList = [];
    }

    if (widget.setInitialValue ?? false) {
      widget.controller.text = activeItemList[0].value.toString();
    }

    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

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
                  if (widget.needValidation) TextSpan(text: "*", style: kTitleTextStyle.copyWith(color: Colors.red))
                ]),
              ),
            ],
          ),
        if (widget.needTitle ?? true) const SizedBox(height: 5),
        DropdownButtonFormField2(
          isExpanded: true,

          key: widget.itemkey,
          items: widget.items != null
              ? activeItemList =
              widget.items!.map((e) => DropdownMenuItem(
                  value: e.toString(),
                  child:Text(
                    e,
                    style: kFieldTextStyle,
                    // maxLines: isMenuOpen? 1 : null,
                    overflow: isMenuOpen ? null: TextOverflow.fade,
                  )
              )).toList()
              : widget.itemBuilder != null || widget.itemBuilder!.isEmpty
              ? widget.itemBuilder
              : [],

          style: kFieldTextStyle,
          decoration: InputDecoration(
            errorStyle: kTitleTextStyle.copyWith(fontSize: 11, color: Colors.red),
            contentPadding: widget.controller.text.isNotEmpty
                ? const EdgeInsets.only(right: 15, left: 0, bottom: 15, top: 15)
                : const EdgeInsets.only(right: 15, left: 15, bottom: 15, top: 15),
            //contentPadding: const EdgeInsets.only(top: 15 ,bottom: 15 ,right: 15),
            hintText: widget.hintText,
            hintStyle: kTitleTextStyle.copyWith(color: kSecounderyTextColor),
            filled: true,
            fillColor: widget.backgroundColor ?? Colors.white,
            suffixText: widget.suffixText != null ? widget.suffixText.toString() : "",
            suffixIcon: null,
            border: OutlineInputBorder(borderSide: const BorderSide(color: kBorderColor), borderRadius: BorderRadius.circular(8)),

            enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: kBorderColor), borderRadius: BorderRadius.circular(8)),
          ),

          value: widget.controller.text.isNotEmpty? widget.controller.text : (widget.setInitialValue ?? false) && activeItemList.isNotEmpty ? activeItemList[0].value : null,
          onChanged: (value) {
            widget.controller.text = value.toString();
            if (widget.onValueChange != null) {
              widget.onValueChange!();
            }
            searchController.clear();
          },
          onSaved: (value) {
            widget.controller.text = value!.toString();
            if (widget.onValueChange != null) {
              widget.onValueChange!();
            }
            searchController.clear();
          },
          menuItemStyleData: MenuItemStyleData(
            selectedMenuItemBuilder: (ctx, child) {
              return Container(
                color: Colors.white,
                child: child,
              );
            },),
          onMenuStateChange: (value){
            setState(() {
              isMenuOpen = value;
              print(value);
            });
          },



        ),
      ],
    );
  }
}
