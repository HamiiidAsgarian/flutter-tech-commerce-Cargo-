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
    return WillPopScope(
      onWillPop: () async {
        //REVIEW
        bool res = false;

        a(e) {
          res = e;
          Navigator.pop(context);
        }

        print(ModalRoute.of(context)!.settings.name);
        if (ModalRoute.of(context)!.settings.name != "/") {
          Navigator.pop(context);
        } else
          await showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: Text(
                      'Do you want to exit?',
                      textAlign: TextAlign.center,
                    ),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () => a(true), child: Text("Exit")),
                        ElevatedButton(
                            onPressed: () => a(false), child: Text("Cancel"))
                      ],
                    ),
                  ));
        print(res);
        print(context);

        return res;
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
