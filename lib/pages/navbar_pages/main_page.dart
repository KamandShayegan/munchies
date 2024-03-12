import 'package:flutter/material.dart';
import 'package:munch/utils/my_colors.dart';
import 'package:munch/pages/navbar_pages/home_page.dart';
import 'package:munch/pages/navbar_pages/page_2.dart';
import 'package:munch/pages/navbar_pages/page_3.dart';
import 'package:munch/pages/navbar_pages/page_4.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> pages = const [HomePage(), PageTwo(), PageThree(), PageFour()];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          currentIndex: currentIndex,
          selectedItemColor: MyColors.primary,
          unselectedItemColor: MyColors.secondary.withOpacity(0.7),
          unselectedFontSize: 0,
          selectedFontSize: 10,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart), label: 'Top Places'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
          ]),
    );
  }
}
