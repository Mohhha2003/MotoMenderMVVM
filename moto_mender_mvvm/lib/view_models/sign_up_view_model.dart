import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/cubits/Auth_cubit/Auth_cubit.dart';
import 'package:moto_mender_mvvm/utils/functions/floating_bottom_sheet.dart';
import 'package:moto_mender_mvvm/view/screens/sign_up_view.dart';
import 'package:moto_mender_mvvm/view_models/otp_view_model.dart';

class SignUpViewModel extends StatelessWidget {
  const SignUpViewModel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSucces) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const OTPViewModel(isNewUser: true),
          ));
        } else if (state is SignUpFailed) {
          showFloatingBottomSheet(text: state.message, context: context);
        }
      },
      child: SignUpView(),
    );
  }
}
