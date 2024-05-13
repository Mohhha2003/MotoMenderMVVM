import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.onChanged,
      required this.style,
      required this.text,
      this.validator,
      this.suffix,
      required this.prefixIcon,
      this.obscureText,
      required this.controller,
      this.padding,
      this.onFieldSubmitted,
      this.onTapOutside});

  final TextTheme style;
  final TextEditingController controller;
  final String text;
  final String? Function(String?)? validator;
  final IconData prefixIcon;
  final bool? obscureText;
  final Widget? suffix;
  final EdgeInsets? padding;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function(PointerDownEvent)? onTapOutside;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
        onTapOutside ?? (event) {};
      },
      onFieldSubmitted: (value) => onFieldSubmitted ?? (value) {},
      onChanged: (value) => onChanged ?? (value) {},
      controller: controller,
      obscureText: obscureText ?? false,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: padding,
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
    );
  }
}
