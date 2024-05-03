import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/cubits/Auth_cubit/Auth_cubit.dart';
import 'package:moto_mender_mvvm/view/screens/sign_up_view.dart';
import 'package:moto_mender_mvvm/view/screens/verfication_view.dart';

class SignUpViewModel extends StatelessWidget {
  const SignUpViewModel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSucces) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => VerficationView(),
          ));
        } else if (state is SignUpFailed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: const Duration(milliseconds: 500),
            content: Text(state.message),
            backgroundColor: Colors.red,
          ));
        }
      },
      child: const SignUpView(),
    );
  }
}
