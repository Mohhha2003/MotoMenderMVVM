import 'package:flutter/material.dart';
import 'package:moto_mender_mvvm/view/screens/store_view.dart';

class BottomNavBarRoute extends StatelessWidget {
   BottomNavBarRoute({super.key});

  Widget currentWidget = const  StoreView();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          BottomNavigationBar(showUnselectedLabels: true, items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline), label: 'Likes'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ]),
    );
  }
}
