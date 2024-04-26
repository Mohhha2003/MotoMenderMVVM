import 'package:flutter/material.dart';

class CustomeCheckBox extends StatefulWidget {
  const CustomeCheckBox({super.key});

  @override
  State<CustomeCheckBox> createState() => CustomeCheckBoxState();
}

class CustomeCheckBoxState extends State<CustomeCheckBox> {
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
