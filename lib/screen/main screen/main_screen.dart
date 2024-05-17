import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:wall_waves_wallpaper_application/screen/favorite%20page/favorite_screen.dart';
import '../category/category_screen.dart';
import '../home screen/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int tabIndex = 0;

  List tabs = [
    {
      'name': 'All',
      'active': true,
    },
    {
      'name': 'Recommend',
      'active': false,
    },
    {
      'name': 'Live',
      'active': false,
    },
    {
      'name': 'Illustration',
      'active': false,
    },
    {
      'name': 'Motivational',
      'active': false,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 55,
        child: FlashyTabBar(
          height: 55,
          selectedIndex: tabIndex,
          showElevation: true,
          onItemSelected: (index) => setState(() {
            tabIndex = index;
          }),
          items: [
            FlashyTabBarItem(
              activeColor: Colors.black,
              inactiveColor: Colors.black.withOpacity(0.5),
              icon: const Icon(
                Icons.home_outlined,
                size: 25,
              ),
              title: const Text('Home'),
            ),
            FlashyTabBarItem(
              activeColor: Colors.black,
              inactiveColor: Colors.black.withOpacity(0.5),
              icon: const Icon(
                Icons.category_outlined,
                size: 25,
              ),
              title: const Text('Category'),
            ),
            FlashyTabBarItem(
              activeColor: Colors.black,
              inactiveColor: Colors.black.withOpacity(0.5),
              icon: const Icon(
                Icons.star_border_outlined,
                size: 25,
              ),
              title: const Text('Favourite'),
            ),
            // FlashyTabBarItem(
            //   activeColor: Colors.black,
            //   inactiveColor: Colors.black.withOpacity(0.5),
            //   icon: const Icon(CupertinoIcons.person),
            //   title: const Text('Profile'),
            // ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: tabIndex == 0
          ? HomeScreen()
          : tabIndex == 1
              ? const CategoryScreen()
              : tabIndex == 2
                  ? FavoriteScreen()
                  : const SizedBox(),
    );
  }
}
