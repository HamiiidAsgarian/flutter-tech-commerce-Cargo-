import 'package:commerce_app/screens/01_home_screen.dart';
import 'package:commerce_app/widgets/navAndAppbar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentpage = 0;
  List<Widget> screens = [
    // TestScreen(),
    HomeScreen(),
    // CategoryScreen(),
    // SearchScreen(),
    // ProfileScreen2(),
  ];
  // PageController pageController = PageController(initialPage: 0);

  // @override
  // void dispose() {
  //   pageController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // if (pageController.hasClients) pageController.jumpToPage(currentpage);//NOTE:if it was pageView
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
      body: IndexedStack(
        index: currentpage,
        // onPageChanged: (e) {
        //   setState(() {
        //     currentpage = e;
        //   });
        // },
        children: screens,
        // controller: pageController
      ),
    );
    // });
  }
}
