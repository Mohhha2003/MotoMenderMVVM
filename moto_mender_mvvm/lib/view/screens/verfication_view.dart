import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moto_mender_mvvm/view/widgets/custom_button.dart';
import 'package:moto_mender_mvvm/view/widgets/custom_text_field.dart';

class VerficationView extends StatelessWidget {
  const VerficationView({super.key});

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Verfication',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please enter your phone number or Gmail to receive a verification code',
              style: style.displayMedium,
            ),
            const Gap(30),
            Text(
              'Mobile',
              style: style.titleLarge,
            ),
            const Gap(10),
            CustomTextField(
                style: style, text: '+1 000 000 000', prefixIcon: Icons.phone),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Or',
                style: style.titleLarge,
              ),
            ),
            Text(
              'Mail',
              style: style.titleLarge,
            ),
            const Gap(10),
            CustomTextField(
                style: style, text: 'Example@mail.com', prefixIcon: Icons.mail),
            const Gap(30),
            CustomButton(
              style: style,
              text: 'Send',
              padding: const EdgeInsets.symmetric(vertical: 20),
            )
          ],
        ),
      ),
    );
  }
}
