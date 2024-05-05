import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/cubits/Auth_cubit/Auth_cubit.dart';
import 'package:moto_mender_mvvm/utils/functions/navigation_with_slide.dart';
import 'package:moto_mender_mvvm/utils/functions/navigation_with_slide_replacment.dart';
import 'package:moto_mender_mvvm/view/screens/otp_view.dart';
import 'package:moto_mender_mvvm/view_models/bottom_nav_bar_view_model.dart';
import 'package:moto_mender_mvvm/view_models/new_password_veiw_model.dart';

class OTPViewModel extends StatelessWidget {
  const OTPViewModel({super.key, this.isNewUser = false});

  final bool isNewUser;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is FortgetPassowrdOTPMatch) {
            navigationWithSlide(context, const NewPasswordViewModel());
          } else if (state is SingUpOTPMatch) {
            slideAndRemove(context, const BottomNavBarViewModel());
          } else if (state is OTPWrong) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Wrong OTP'),
              backgroundColor: Colors.red,
            ));
          }
        },
        child: OTPView(isNewUser: isNewUser));
  }
}
