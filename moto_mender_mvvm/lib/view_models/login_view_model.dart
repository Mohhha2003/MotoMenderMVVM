import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/cubits/Auth_cubit/Auth_cubit.dart';
import 'package:moto_mender_mvvm/utils/functions/dialog_utils.dart';
import 'package:moto_mender_mvvm/view_models/bottom_nav_bar_view_model.dart';
import 'package:moto_mender_mvvm/view/screens/login_view.dart';

class LoginViewModel extends StatelessWidget {
  const LoginViewModel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginFailed) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: const Duration(milliseconds: 500),
            content: Text(state.message),
            backgroundColor: Colors.red,
          ));
        } else if (state is LoginSuccess) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const BottomNavBarViewModel()));
        } else if (state is LoginLoading) {
          showLoading(context);
        }
      },
      child: LoginView(),
    );
  }
}
