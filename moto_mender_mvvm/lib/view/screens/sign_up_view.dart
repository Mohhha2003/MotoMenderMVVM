import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:moto_mender_mvvm/cubits/Auth_cubit/Auth_cubit.dart';
import 'package:moto_mender_mvvm/view/widgets/custom_button.dart';
import 'package:moto_mender_mvvm/view/widgets/custom_text_field.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: context.read<AuthCubit>().signUpState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'welcome to Medi-deliver',
                      style: style.displayLarge,
                    ),
                    const Gap(10),
                    const Icon(
                      Icons.waving_hand_rounded,
                      size: 30,
                      color: Color(0xffFFDD67),
                    ),
                  ],
                ),
                const Gap(10),
                Text(
                  'Sign Up now to enjoy our service',
                  style: style.displayMedium,
                ),
                const Gap(20),
                Text(
                  'Full Name',
                  style: style.titleLarge,
                ),
                const Gap(10),
                CustomTextField(
                    controller: context.read<AuthCubit>().name,
                    validator: (p0) {
                      if (p0!.isEmpty) return 'Requried';
                    },
                    style: style,
                    text: 'Enter Your Full Name',
                    prefixIcon: Icons.person),
                Text(
                  'Email',
                  style: style.titleLarge,
                ),
                const Gap(10),
                CustomTextField(
                    controller: context.read<AuthCubit>().email,
                    validator: (p0) {
                      if (p0!.isEmpty) return 'Requried';
                    },
                    style: style,
                    text: 'Example@Mail.com',
                    prefixIcon: Icons.email),
                Text(
                  'Password',
                  style: style.titleLarge,
                ),
                const Gap(10),
                CustomTextField(
                    controller: context.read<AuthCubit>().password,
                    validator: (p0) {
                      if (p0!.isEmpty) return 'Requried';
                    },
                    obscureText: true,
                    style: style,
                    suffix: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.remove_red_eye)),
                    text: 'Enter Password',
                    prefixIcon: Icons.lock),
                Text(
                  'Re Enter Password',
                  style: style.titleLarge,
                ),
                const Gap(10),
                CustomTextField(
                    controller: context.read<AuthCubit>().reTypePassword,
                    validator: (p0) {
                      if (p0!.isEmpty) return 'Requried';
                    },
                    obscureText: true,
                    style: style,
                    suffix: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.remove_red_eye)),
                    text: 'Re Enter Password',
                    prefixIcon: Icons.person),
                Text(
                  'Phone',
                  style: style.titleLarge,
                ),
                const Gap(10),
                CustomTextField(
                    controller: context.read<AuthCubit>().phone,
                    validator: (p0) {
                      if (p0!.isEmpty) return 'Requried';
                    },
                    style: style,
                    text: '+20 0100 000 000',
                    prefixIcon: Icons.phone),
                Text(
                  'Address',
                  style: style.titleLarge,
                ),
                const Gap(10),
                CustomTextField(
                    controller: context.read<AuthCubit>().address,
                    validator: (p0) {
                      if (p0!.isEmpty) return 'Requried';
                    },
                    style: style,
                    text: 'Address',
                    prefixIcon: Icons.home),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CustomButton(
                    onPressed: () {
                      if (context
                          .read<AuthCubit>()
                          .signUpState
                          .currentState!
                          .validate()) {
                        context.read<AuthCubit>().signUp();
                      }
                    },
                    style: style,
                    text: 'Sign Up',
                    padding: const EdgeInsets.symmetric(vertical: 20),
                  ),
                ),
                const Gap(20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
