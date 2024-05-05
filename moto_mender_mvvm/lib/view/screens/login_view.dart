import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:moto_mender_mvvm/cubits/Auth_cubit/Auth_cubit.dart';
import 'package:moto_mender_mvvm/utils/functions/navigation_with_slide.dart';
import 'package:moto_mender_mvvm/view_models/sign_up_view_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/remember_me_row.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final GlobalKey<FormState> loginState = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(30),
                  Image.asset('assets/image/logo.png'),
                  const Gap(20),
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
                  const Gap(5),
                  Text(
                    'Log in now to enjoy our service',
                    style: style.displayMedium,
                  ),
                  const Gap(30),
                  Form(
                      key: loginState,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: style.headlineLarge,
                          ),
                          const Gap(10),
                          CustomTextField(
                            controller: context.read<AuthCubit>().loginEmail,
                            validator: (p0) {
                              if (p0!.isEmpty) return 'Required';
                              if (!p0.contains('@') || !p0.endsWith('.com')) {
                                return 'Enter a valid Email';
                              }
                            },
                            style: style,
                            text: 'Example@mail.com',
                            prefixIcon: Icons.email,
                          ),
                          const Gap(30),
                          Text(
                            'Password',
                            style: style.headlineLarge,
                          ),
                          const Gap(10),
                          CustomTextField(
                            controller: context.read<AuthCubit>().loginPassword,
                            obscureText: true,
                            validator: (p0) {
                              if (p0!.isEmpty) return 'Required';
                            },
                            style: style,
                            text: 'Enter Password ',
                            prefixIcon: Icons.lock,
                          ),
                          const Gap(20),
                          RemeberMeRow(style: style),
                          CustomButton(
                            onPressed: () async {
                              if (loginState.currentState!.validate()) {
                                context.read<AuthCubit>().login();
                              }
                            },
                            style: style,
                            text: 'Log in',
                            padding: const EdgeInsets.symmetric(vertical: 20),
                          )
                        ],
                      )),
                  const Gap(25),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Or continue using',
                      style: style.displayMedium,
                    ),
                  ),
                  const Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(width: .2),
                        ),
                        child: Image.asset('assets/image/google.png'),
                      ),
                      const Gap(60),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(width: .2),
                        ),
                        child: Image.asset('assets/image/face.png'),
                      ),
                    ],
                  ),
                  const Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You don\'t have an account?',
                        style: style.displayMedium,
                      ),
                      const Gap(5),
                      InkWell(
                        onTap: () {
                          navigationWithSlide(context, const SignUpViewModel());
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Color(0xffFA8345),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
