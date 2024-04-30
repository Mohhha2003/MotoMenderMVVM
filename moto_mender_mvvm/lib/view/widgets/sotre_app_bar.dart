import 'package:flutter/material.dart';
import 'package:moto_mender_mvvm/view/screens/sign_up_view.dart';

class StoreAppBar extends StatelessWidget {
  const StoreAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24),
      child: Row(
        children: [
          const Text(
            'MotoMender',
            // style: Style.logo,
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SignUpView(),
                )); 
              },
              icon: const Icon(
                Icons.shopping_bag_outlined,
                size: 35,
              ))
        ],
      ),
    );
  }
}
