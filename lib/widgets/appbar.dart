import 'package:commerce_app/provider_model.dart';
import 'package:commerce_app/screens/cart_screen.dart';
import 'package:commerce_app/screens/favorites_screen.dart';
import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../consts.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({
    this.leadingIcon,
    this.leadingIconFunction,
    this.title,
    Key? key,
  }) : super(key: key);
  final Icon? leadingIcon;
  final Function? leadingIconFunction;
  final Widget? title;
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderModel>(builder: (context, vals, child) {
      return AppBar(
        // automaticallyImplyLeading: false,
        // titleSpacing: 0 //* for  deleting unexpected padding of title
        title: title,
        shadowColor: Colors.red,
        // title: Text("data"),
        // titleSpacing: 18,
        elevation: 0,
        backgroundColor: appBarWhite,
        // title: Text('My App'),
        leading: Padding(
          padding: const EdgeInsets.only(left: 25), //* 25 pixle Left margin
          child: IconButton(
            padding: const EdgeInsets.all(0),
            icon: leadingIcon == null ? const Text("") : leadingIcon!,
            onPressed: () => leadingIconFunction!(),
          ),
        ),
        actions: <Widget>[
          SizedBox(
            width: 40,
            child: IconButton(
              padding: const EdgeInsets.symmetric(),
              icon: Stack(children: [
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
                    radius: 9,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.grey,
                      child: Center(
                        child: Text(
                          vals.cartItems.length.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              wordSpacing: 0,
                              letterSpacing: 0,
                              fontSize: 7,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen()));
                // do something
              },
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          //* 24 PX Gap between Icons(same size as the icons with)
          SizedBox(
            width: 40,
            child: IconButton(
              padding: const EdgeInsets.symmetric(),
              icon: Stack(children: [
                Center(
                  child: Icon(
                    MyFlutterApp.bell,
                    color: appBargrey,
                    size: 26,
                  ),
                ),
                Positioned(
                  right: -1,
                  top: 9,
                  child: CircleAvatar(
                    radius: 9,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.grey,
                      child: Center(
                        child: Text(
                          // "1",
                          vals.favoriteItems.length.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              wordSpacing: 0,
                              letterSpacing: 0,
                              fontSize: 7,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
              onPressed: () {
                // Navigator.pushNamed(context, "/Favorite");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return FavoriteScreen();
                    },
                  ),
                );
              },
            ),
          ),

          const SizedBox(
            width: 25,
          ), //* 25 PX Right Margin
        ],
      );
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
