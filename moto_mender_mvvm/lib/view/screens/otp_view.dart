import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:moto_mender_mvvm/cubits/Auth_cubit/Auth_cubit.dart';
import 'package:moto_mender_mvvm/view/widgets/custom_button.dart';

class OTPView extends StatefulWidget {
  OTPView({Key? key, required this.isNewUser}) : super(key: key);

  @override
  _OTPViewState createState() => _OTPViewState();
  final bool isNewUser;
}

class _OTPViewState extends State<OTPView> {
  // List of FocusNodes, one for each OTP digit.
  late List<FocusNode> focusNodes;
  // List of controllers for each text field.
  late List<TextEditingController> textControllers;
  final GlobalKey<FormState> formstate = GlobalKey();
  bool isAllFilled = false;
  String currentOTP = '';

  @override
  void initState() {
    super.initState();
    int otpLength = 4;
    focusNodes = List.generate(otpLength, (_) => FocusNode());
    textControllers = List.generate(otpLength, (_) => TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in textControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Verification Code',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
            ),
          ),
          Text(
            'Enter your OTP code here',
            style: style.displayMedium,
          ),
          const Gap(20),
          Form(
            key: formstate,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(textControllers.length, (index) {
                return Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xffF4F5F7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextFormField(
                    controller: textControllers[index],
                    focusNode: focusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      // Move focus Forward
                      if (value.length == 1 && index < focusNodes.length - 1) {
                        FocusScope.of(context)
                            .requestFocus(focusNodes[index + 1]);
                      }
                      // Move focus
                      else if (value.isEmpty && index > 0) {
                        FocusScope.of(context)
                            .requestFocus(focusNodes[index - 1]);
                      }

                      //  AUTOMATIC CHECK FOR OTP
                      currentOTP = '';
                      for (int i = 0; i < 4; i++) {
                        if (textControllers[i].text.isNotEmpty) {
                          currentOTP += textControllers[i].text;

                          isAllFilled = true;
                        } else {
                          isAllFilled = false;
                          break;
                        }
                      }
                      if (isAllFilled) {
                        context.read<AuthCubit>().checkOTP(userOTP: currentOTP, isNewUser: widget.isNewUser);
                      }
                    },
                  ),
                );
              }),
            ),
          ),
          const Gap(40),
          CustomButton(
            onPressed: () =>
                context.read<AuthCubit>().checkOTP(userOTP: currentOTP, isNewUser: widget.isNewUser,),
            style: style,
            text: 'Submit',
            padding: const EdgeInsets.symmetric(vertical: 20),
          ),
          const Gap(30),
          Text(
            'Didn’t have  received any oTP ?',
            style: style.displayMedium,
          ),
          TextButton(
              onPressed: () {
                context.read<AuthCubit>().forgetPassword();
              },
              child: const Text(
                'Resend OTP ?',
                style: TextStyle(
                    color: Color(0xffFB8B50),
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ))
        ],
      ),
    );
  }
}
