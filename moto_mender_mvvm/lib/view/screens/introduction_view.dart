import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moto_mender_mvvm/cache/cache_helper.dart';
import 'package:moto_mender_mvvm/models/user.dart';
import 'package:moto_mender_mvvm/utils/functions/navigate_with_animation.dart';
import 'package:moto_mender_mvvm/view/widgets/custom_button.dart';
import 'package:moto_mender_mvvm/view_models/bottom_nav_bar_view_model.dart';
import 'package:moto_mender_mvvm/view_models/login_view_model.dart';
import 'package:moto_mender_mvvm/view_models/sign_up_view_model.dart';

class IntroductionView extends StatelessWidget {
  const IntroductionView({super.key});

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('MotoMender', style: style.displayLarge),
            const Gap(20),
            Text('Buy,Sell & Try', style: style.titleMedium),
            Gap(MediaQuery.of(context).size.height * .4),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    onPressed: () {
                      navigateWithTransition(context, const LoginViewModel());
                    },
                    style: style,
                    text: 'LogIn',
                    padding: const EdgeInsets.all(15),
                  ),
                  const Gap(10),
                  CustomButton(
                    onPressed: () {
                      navigateWithTransition(context, const SignUpViewModel());
                    },
                    color: Colors.red,
                    style: style,
                    text: 'Sign Up',
                    padding: const EdgeInsets.all(15),
                  ),
                  const Gap(10),
                  CustomButton(
                    onPressed: () {
                      CacheHelper.currentUser = User(
                        name: 'Anynmous',
                        phone: '',
                        id: '66333e2a4a39a9f9e22b85e8',
                      );
                      navigateWithTransition(
                          context, const BottomNavBarViewModel(),
                          removeStack: true);
                    },
                    color: Colors.grey,
                    style: style,
                    text: 'Continue as Anynomus',
                    padding: const EdgeInsets.all(15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
