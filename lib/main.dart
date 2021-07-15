import 'package:commerce_app/provider_model.dart';
import 'package:commerce_app/screens/cart_screen.dart';
import 'package:commerce_app/screens/02_category_Frame.dart';
import 'package:commerce_app/screens/favorites_screen.dart';
import 'package:commerce_app/screens/itemdetail_screen.dart';
import 'package:commerce_app/screens/listeddItemsWithFilter_screen.dart';
import 'package:commerce_app/screens/00_main_frame_screen.dart';
import 'package:commerce_app/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() => {
      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(statusBarColor: Colors.pink)),
      runApp(MyApp())
    };

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

GlobalKey<NavigatorState> key00 = new GlobalKey();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProviderModel(),
      child: MaterialApp(
        // navigatorKey: key00,
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => MainScreen(),
          "/Item": (context) => ItemDetailScreen(),
          "/Cart": (context) => CartScreen(),
          "/Favorite": (context) => FavoriteScreen(),
          "/Category": (context) => const CategoryFramePage(),
          "/Profile": (context) => const ProfileScreen(),
          "/ListedItems": (context) =>
              ListedItemsWithFilterScreen(title: "Items"),
        },
        initialRoute: "/",
      ),
    );
  }
}
