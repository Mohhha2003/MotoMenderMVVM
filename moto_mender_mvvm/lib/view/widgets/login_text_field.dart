import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField(
      {super.key,
      required this.style,
      required this.text,
      this.validator,
      required this.prefixIcon});

  final TextTheme style;
  final String text;
  final String? Function(String?)? validator;
  final IconData prefixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: TextFormField(
        validator: validator,
        decoration: InputDecoration(
          hintText: text,
          prefixIcon: Icon(
            prefixIcon,
            color: const Color(0xff42526E),
          ),
          hintStyle: style.displayMedium,
          filled: true,
          fillColor: Colors.grey[300],
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.greenAccent)),
        ),
      ),
    );
  }
}
