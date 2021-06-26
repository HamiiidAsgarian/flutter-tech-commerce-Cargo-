// import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:commerce_app/provider_model.dart';
import 'package:commerce_app/screens/01_home_screen.dart';
// import 'package:commerce_app/screens/Profile_screen2.dart';
// import 'package:commerce_app/screens/category_screen.dart';
import 'package:commerce_app/screens/03_search_screen.dart';
import 'package:commerce_app/widgets/navAndAppbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '02_category_screen.dart';
import '04_Profile_screen2.dart';

// import '../consts.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentpage1 = 0;
  List<Widget> screens = [
    HomeScreen(),
    CategoryScreen(),
    SearchScreen(),
    ProfileScreen2(),
  ];
  @override
  Widget build(BuildContext context) {
    // pageController1.jumpTo(1);
    return Consumer<ProviderModel>(builder: (context, vals, child) {
      print(vals.appBarSelectedIndex);

      return Scaffold(
        extendBodyBehindAppBar:
            true, //////////* for fixing one pixle gap under the appbar
        bottomNavigationBar: MyBottomNavigationBar(),
        // screens[vals.appBarSelectedIndex
        body: SafeArea(
            child: PageView(
                physics: NeverScrollableScrollPhysics(),
                children: screens,
                controller: vals.pgc)),
        // screens[Provider.of<ProviderModel>(context).appBarSelectedIndex]
      );
    });
  }
}
