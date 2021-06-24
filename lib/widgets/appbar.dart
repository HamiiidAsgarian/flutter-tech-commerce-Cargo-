import 'package:commerce_app/screens/listeddItems_screen.dart';
import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../consts.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
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
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            icon: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/Cart");
              },
              child: Stack(children: [
                const Center(
                  child: Icon(
                    MyFlutterApp.cart,
                    color: appBargrey,
                    size: 26,
                  ),
                ),
                const Positioned(
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
        const SizedBox(
          width: 10,
        ), //* 24 PX Gap between Icons(same size as the icons with)
        SizedBox(
          width: 40,
          child: IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            icon: const Icon(
              MyFlutterApp.bell,
              color: appBargrey,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ListedItemsScreen();
              }));
            },
          ),
        ),
        const SizedBox(
          width: 25,
        ), //* 25 PX Right Margin
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
