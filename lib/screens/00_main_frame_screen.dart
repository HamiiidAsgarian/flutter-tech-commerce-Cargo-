import 'package:commerce_app/screens/01_home_screen.dart';
// import 'package:commerce_app/screens/02_category_Frame.dart';
// import 'package:commerce_app/screens/03_search_screen_frame.dart';
// import 'package:commerce_app/screens/04_Profile_screen.dart';
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
    // CategoryFramePage(),
    // SearchFramePage(),
    // ProfileScreen2(),
  ];

  @override
  Widget build(BuildContext context) {
    // if (pageController.hasClients) pageController.jumpToPage(currentpage);//NOTE:if it was pageView
    // return Consumer<ProviderModel>(builder: (context, vals, child) {
    return WillPopScope(
      onWillPop: () async {
        bool res = false;

        Function a(e) {
          res = true;
          return e;
        }

        await showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text('Dialog Title'),
                  content: Row(
                    children: [
                      ElevatedButton(
                          onPressed: () => a(true), child: Text("T")),
                      ElevatedButton(
                          onPressed: () => a(false), child: Text("F"))
                    ],
                  ),
                ));
        print(res);
        Duration t = Duration(seconds: 5);
        var z = Future.delayed(t);
        return z.then((value) {
          print(res);
          return res;
        });
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        bottomNavigationBar: MyBottomNavigationBar(
          newvalue: currentpage,
          function: (int e) {
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
      ),
    );
    // });
  }
}
