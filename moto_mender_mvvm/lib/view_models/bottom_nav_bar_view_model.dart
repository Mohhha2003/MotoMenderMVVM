import 'package:flutter/material.dart';
import 'package:moto_mender_mvvm/view/screens/profile_view.dart';
import 'package:moto_mender_mvvm/view_models/store_view_model.dart';

class BottomNavBarViewModel extends StatefulWidget {
  const BottomNavBarViewModel({super.key});

  @override
  State<BottomNavBarViewModel> createState() => _BottomNavBarViewModelState();
}

class _BottomNavBarViewModelState extends State<BottomNavBarViewModel> {
  Widget currentWidget = const StoreViewModel();
  int index = 0;

  void changeScreen(int index) {
    switch (index) {
      case 0:
        currentWidget = const StoreViewModel();
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        currentWidget = ProfileView();
        break;
      default:
        currentWidget = const StoreViewModel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            changeScreen(value);
            index = value;
            setState(() {});
          },
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline), label: 'Likes'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
      body: SafeArea(child: currentWidget),
    );
  }
}