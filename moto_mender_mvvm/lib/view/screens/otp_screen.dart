import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moto_mender_mvvm/view/widgets/custom_button.dart';

class OTPView extends StatefulWidget {
  OTPView({Key? key}) : super(key: key);

  @override
  _OTPViewState createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  // List of FocusNodes, one for each OTP digit.
  late List<FocusNode> focusNodes;
  // List of controllers for each text field.
  late List<TextEditingController> textControllers;

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
          Row(
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
                child: TextField(
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
                  },
                ),
              );
            }),
          ),
          const Gap(40),
          CustomButton(
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
              onPressed: () {},
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
