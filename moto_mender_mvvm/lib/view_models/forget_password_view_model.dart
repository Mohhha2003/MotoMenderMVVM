import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/cubits/Auth_cubit/Auth_cubit.dart';
import 'package:moto_mender_mvvm/utils/dialog_utils.dart';
import 'package:moto_mender_mvvm/view/screens/otp_screen.dart';
import 'package:moto_mender_mvvm/view/screens/verfication_view.dart';

class ForgetPasswordViewModel extends StatelessWidget {
  const ForgetPasswordViewModel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          Navigator.of(context).pop();

          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => OTPView(),
          ));
        } else if (state is ResetPasswordFailed) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
            backgroundColor: Colors.red,
          ));
        } else if (state is ResetPasswordLoading) {
          showLoading(context);
        }
      },
      child: VerficationView(),
    );
  }
}
