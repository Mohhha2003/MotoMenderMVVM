import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => CustomCheckBoxState();
}

class CustomCheckBoxState extends State<CustomCheckBox> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), side: BorderSide.none),
      fillColor: MaterialStateProperty.all(const Color(0xff7A869A)),
      value: isSelected,
      onChanged: (value) {
        setState(() {
          isSelected = value!;
        });
      },
    );
  }
}
