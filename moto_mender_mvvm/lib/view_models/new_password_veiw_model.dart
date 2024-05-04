import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/cubits/Auth_cubit/Auth_cubit.dart';
import 'package:moto_mender_mvvm/utils/show_error_snackbar.dart';
import 'package:moto_mender_mvvm/view/screens/new_password_view.dart';
import 'package:moto_mender_mvvm/view_models/login_view_model.dart';

class NewPasswordViewModel extends StatelessWidget {
  const NewPasswordViewModel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is ResetPasswordFailed) {
            showErrorSnackBar(text: state.message, context: context);
          } else if (state is ResetPasswordSuccess) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const LoginViewModel(),
            ));
          }
        },
        child: NewPasswordView());
  }
}
