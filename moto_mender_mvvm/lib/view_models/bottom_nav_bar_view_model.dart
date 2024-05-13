import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moto_mender_mvvm/cache/cache_helper.dart';
import 'package:moto_mender_mvvm/view/screens/profile_view.dart';
import 'package:moto_mender_mvvm/view_models/favorties/favorites_view_model.dart';
import 'package:moto_mender_mvvm/view_models/search/search_view_model.dart';
import 'package:moto_mender_mvvm/view_models/store_view_model.dart';
import 'package:moto_mender_mvvm/view_models/support_view_model/cubit/chat_cubit.dart';

class BottomNavBarViewModel extends StatefulWidget {
  const BottomNavBarViewModel({super.key});

  @override
  State<BottomNavBarViewModel> createState() => _BottomNavBarViewModelState();
}

class _BottomNavBarViewModelState extends State<BottomNavBarViewModel> {
  @override
  void initState() {
    if (CacheHelper.currentUser.role == 'admin') {
      //   Start Chat cubit listener for customer support
      context.read<ChatCubit>().connectSocket();
      context.read<ChatCubit>().adminActive();
      context.read<ChatCubit>().listenChatRoomActive(context: context);
    }
    super.initState();
  }

  Widget currentWidget = const StoreViewModel();
  int index = 0;

  void changeScreen(int index) {
    setState(() {
      switch (index) {
        case 0:
          currentWidget = const StoreViewModel();
          break;
        case 1:
          currentWidget = const SearchViewModel();
          break;
        case 2:
          currentWidget = const FavortiesViewModel();
          break;
        case 3:
          currentWidget = ProfileView();
          break;
        default:
          currentWidget = const StoreViewModel();
      }
      this.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          changeScreen(value);
        },
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_outline),
            label: 'Likes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: SafeArea(
        child: chagetScreenWithTranstion(),
      ),
    );
  }

  AnimatedSwitcher chagetScreenWithTranstion() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: currentWidget,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
