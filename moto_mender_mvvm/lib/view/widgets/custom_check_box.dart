import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/cubits/Auth_cubit/Auth_cubit.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => CustomCheckBoxState();
}

class CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), side: BorderSide.none),
      fillColor: MaterialStateProperty.all(const Color(0xff7A869A)),
      value: context.read<AuthCubit>().rememberMe,
      onChanged: (value) {
        setState(() {
          context.read<AuthCubit>().rememberMe = value!;
        });
      },
    );
  }
}
