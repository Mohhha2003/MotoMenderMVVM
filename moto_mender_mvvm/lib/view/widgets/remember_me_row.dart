import 'package:flutter/material.dart';

import 'custom_check_box.dart';

class RemeberMeRow extends StatelessWidget {
  const RemeberMeRow({
    Key? key,
    required this.style,
  }) : super(key: key);

  final TextTheme style;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomCheckBox(),
        Text(
          'Remember Me',
          style: style.displayMedium,
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Forget Password?',
            style: TextStyle(
              color: Color(0xffFA8345),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
