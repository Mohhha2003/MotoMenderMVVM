import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:moto_mender_mvvm/cubits/Auth_cubit/Auth_cubit.dart';
import 'package:moto_mender_mvvm/view/widgets/custom_button.dart';
import 'package:moto_mender_mvvm/view/widgets/custom_text_field.dart';

class NewPasswordView extends StatelessWidget {
  NewPasswordView({super.key});

  final GlobalKey<FormState> formState = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Password',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formState,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Please enter Your New Password',
                style: style.displayMedium,
              ),
              const Gap(30),
              Text(
                'New Password',
                style: style.titleLarge,
              ),
              const Gap(10),
              CustomTextField(
                  obscureText: true,
                  validator: (p0) {
                    if (p0!.isEmpty) return 'Required';
                  },
                  controller: context.read<AuthCubit>().newPassword,
                  style: style,
                  text: 'Enter password',
                  prefixIcon: Icons.password),
              const Gap(30),
              CustomButton(
                onPressed: () {
                  if (formState.currentState!.validate()) {
                    context.read<AuthCubit>().resetPassword();
                  }
                },
                style: style,
                text: 'Submit',
                padding: const EdgeInsets.symmetric(vertical: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
