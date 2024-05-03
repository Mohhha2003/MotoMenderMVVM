import 'package:flutter/material.dart';

class ProfileListTiles extends StatelessWidget {
  const ProfileListTiles({
    super.key,
    required this.style,
    required this.text,
    this.onTap,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.iconColor,
  });

  final TextTheme style;
  final String text;
  final void Function()? onTap;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: InkWell(
        onTap: () => onTap!(),
        child: Container(
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xffBDBDBD), width: 1)),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            splashColor: Colors.transparent,
            title: Text(
              text,
              style: style.titleLarge,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_sharp,
              color: Color(0xffBDBDBD),
            ),
            leading: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: color ?? const Color.fromARGB(255, 230, 227, 227),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Icon(
                icon,
                size: 30,
                color: iconColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
