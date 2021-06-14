import 'package:commerce_app/providerModel.dart';
import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../consts.dart';

//////////////////////////////////////////////////////////////////////* bottomNav bar
class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  // var selectedindex = 0;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     selectedindex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderModel>(builder: (context, vals, child) {
      return SizedBox(
        height: 70,
        child: BottomNavigationBar(
          // fixedColor: Colors.red,
          selectedLabelStyle: priceFontStyle,
          type: BottomNavigationBarType.fixed,
          currentIndex: vals.appBarSelectedIndex,
          selectedItemColor: Colors.blueGrey[900],
          onTap: (index) {
            vals.onItemTapped(index);
            setState(() {});
          },

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.home_outline),
              label: 'Home',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.wallet),
              label: 'Wallet',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.heart_empty),
              label: 'Favourites',
              backgroundColor: Colors.purple,
            ),
            BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.user_outline),
              label: 'Profile',
              backgroundColor: Colors.pink,
            ),
          ],
        ),
      );
    });
  }
}

////////////////////////////////// *Appbar
