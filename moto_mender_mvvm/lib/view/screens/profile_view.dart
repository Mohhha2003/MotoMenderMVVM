import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:moto_mender_mvvm/cache/cache_helper.dart';
import 'package:moto_mender_mvvm/view_models/login_view_model.dart';
import '../widgets/profile_list_tile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Gap(30),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border(
                          left:
                              BorderSide(color: Colors.greenAccent, width: 2))),
                  child: Image.asset('assets/image/user.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mohamed Alaa Abdo',
                      style: style.titleLarge,
                    ),
                    const Gap(5),
                    const Text(
                      '+20 17514703',
                      style: TextStyle(
                          color: Color(0xffBDBDBD),
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ],
                )
              ],
            ),
            const Gap(10),
            ProfileListTiles(
              icon: Icons.favorite_border,
              style: style,
              text: 'Favourites',
            ),
            ProfileListTiles(
              icon: Icons.location_on_outlined,
              style: style,
              text: 'Address',
            ),
            ProfileListTiles(
              icon: Icons.wallet,
              style: style,
              text: 'Wallet',
            ),
            ProfileListTiles(
              icon: Icons.mail_outline_rounded,
              style: style,
              text: 'Contact With Us',
            ),
            ProfileListTiles(
              onTap: () {
                CacheHelper().removeData(key: 'email');
                CacheHelper().removeData(key: 'password');
                Navigator.of(context).pop();
              },
              backgroundColor: const Color.fromARGB(255, 243, 217, 219),
              iconColor: const Color(0xffFE3A46),
              color: const Color.fromARGB(255, 247, 182, 184),
              icon: Icons.logout,
              style: style,
              text: 'Log Out',
            ),
          ],
        ),
      ),
    );
  }
}
