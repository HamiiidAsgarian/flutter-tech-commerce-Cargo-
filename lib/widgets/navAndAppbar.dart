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
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    this.leadingIcon,
    this.leadingIconFunction,
    Key? key,
  }) : super(key: key);
  final Icon? leadingIcon;
  final Function? leadingIconFunction;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // automaticallyImplyLeading: false,
      // titleSpacing: 0 //* for  deleting unexpected padding of title

      shadowColor: Colors.red,
      // title: Text("data"),
      // titleSpacing: 18,
      elevation: 0,
      backgroundColor: appBarWhite,
      // title: Text('My App'),
      leading: Padding(
        padding: EdgeInsets.only(left: 25), //* 25 pixle Left margin
        child: IconButton(
          padding: EdgeInsets.all(0),
          icon: this.leadingIcon == null ? Text("") : this.leadingIcon!,
          onPressed: () => leadingIconFunction!(),
        ),
      ),
      actions: <Widget>[
        SizedBox(
          width: 40,
          child: IconButton(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            icon: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/Cart");
              },
              child: Stack(children: [
                Center(
                  child: Icon(
                    MyFlutterApp.cart,
                    color: appBargrey,
                    size: 26,
                  ),
                ),
                Positioned(
                  right: -1,
                  top: 9,
                  child: CircleAvatar(
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.grey,
                      child: Text(
                        "1",
                        style: TextStyle(
                            fontSize: 7,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    radius: 9,
                    backgroundColor: Colors.white,
                  ),
                ),
              ]),
            ),
            onPressed: () {
              // do something
            },
          ),
        ),
        SizedBox(
          width: 10,
        ), //* 24 PX Gap between Icons(same size as the icons with)
        SizedBox(
          width: 40,
          child: IconButton(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            icon: Icon(
              MyFlutterApp.bell,
              color: appBargrey,
            ),
            onPressed: () {
              // do something
            },
          ),
        ),
        SizedBox(
          width: 25,
        ), //* 25 PX Right Margin
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
