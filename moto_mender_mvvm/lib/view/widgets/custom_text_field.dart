import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.style,
      required this.text,
      this.validator,
      this.suffix,
      required this.prefixIcon,
      this.obscureText});

  final TextTheme style;
  final String text;
  final String? Function(String?)? validator;
  final IconData prefixIcon;
  final bool? obscureText;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: TextFormField(
        obscureText: obscureText ?? false,
        validator: validator,
        decoration: InputDecoration(
          suffixIcon: suffix,
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
