import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

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

class ProfileListTiles extends StatelessWidget {
  const ProfileListTiles({
    super.key,
    required this.style,
    required this.text,
    this.onTap,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.iconColor,
  });

  final TextTheme style;
  final String text;
  final void Function()? onTap;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: InkWell(
        onTap: () => onTap!(),
        child: Container(
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xffBDBDBD), width: 1)),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            splashColor: Colors.transparent,
            title: Text(
              text,
              style: style.titleLarge,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_sharp,
              color: Color(0xffBDBDBD),
            ),
            leading: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: color ?? const Color.fromARGB(255, 230, 227, 227),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              child: Icon(
                icon,
                size: 30,
                color: iconColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
