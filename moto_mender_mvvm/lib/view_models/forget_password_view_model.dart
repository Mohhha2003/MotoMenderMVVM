import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/cubits/Auth_cubit/Auth_cubit.dart';
import 'package:moto_mender_mvvm/utils/functions/dialog_utils.dart';
import 'package:moto_mender_mvvm/view/screens/verfication_view.dart';
import 'package:moto_mender_mvvm/view_models/otp_view_model.dart';

class ForgetPasswordViewModel extends StatelessWidget {
  const ForgetPasswordViewModel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccess) {
          Navigator.of(context).pop();
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const OTPViewModel(),
          ));
        } else if (state is ForgetPasswordFailed) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
            backgroundColor: Colors.red,
          ));
        } else if (state is ForgetPasswordLoading) {
          showLoading(context);
        }
      },
      child: VerficationView(),
    );
  }
}
