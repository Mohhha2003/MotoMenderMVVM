import 'package:flutter/material.dart';
import 'package:moto_mender_mvvm/view/screens/profile_view.dart';

class StoreCategorieButton extends StatelessWidget {
  const StoreCategorieButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: 40,
        shape: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5)),
        color: const Color(0xff0CBB80),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProfileView(),
          ));
        },
        child: Text(
          'Exterior Care',
          style: Theme.of(context).textTheme.bodySmall,
        ));
  }
}
