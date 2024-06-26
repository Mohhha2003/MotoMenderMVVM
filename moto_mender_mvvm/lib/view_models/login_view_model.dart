import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/cubits/Auth_cubit/Auth_cubit.dart';
import 'package:moto_mender_mvvm/utils/functions/show_loading.dart';
import 'package:moto_mender_mvvm/utils/functions/floating_bottom_sheet.dart';
import 'package:moto_mender_mvvm/view_models/bottom_nav_bar_view_model.dart';
import 'package:moto_mender_mvvm/view/screens/login_view.dart';
import 'package:moto_mender_mvvm/view_models/favorties/cubit/favorites_cubit.dart';

class LoginViewModel extends StatelessWidget {
  const LoginViewModel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginFailed) {
          Navigator.of(context).pop();
          showFloatingBottomSheet(text: state.message, context: context);
        } else if (state is LoginSuccess) {
          context.read<FavoritesCubit>().getAllFavorites();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => const BottomNavBarViewModel()),
              (route) => false);
        } else if (state is LoginLoading) {
          showLoading(context);
        }
      },
      child: LoginView(),
    );
  }
}
