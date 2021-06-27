// import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:commerce_app/screens/01_home_screen.dart';
// import 'package:commerce_app/screens/Profile_screen2.dart';
// import 'package:commerce_app/screens/category_screen.dart';
import 'package:commerce_app/screens/03_search_screen.dart';
import 'package:commerce_app/widgets/navAndAppbar.dart';
import 'package:flutter/material.dart';

import '02_category_screen.dart';
import '04_Profile_screen2.dart';

// import '../consts.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentpage = 0;
  List<Widget> screens = [
    HomeScreen(),
    CategoryScreen(),
    SearchScreen(),
    ProfileScreen2(),
  ];
  PageController pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (pageController.hasClients) pageController.jumpToPage(currentpage);
    // return Consumer<ProviderModel>(builder: (context, vals, child) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: MyBottomNavigationBar(
        newvalue: currentpage,
        function: (int e) {
          print(e);
          setState(() {
            currentpage = e;
          });
        },
      ),
      body: PageView(
          onPageChanged: (e) {
            setState(() {
              currentpage = e;
            });
          },
          children: screens,
          controller: pageController),
    );
    // });
  }
}
