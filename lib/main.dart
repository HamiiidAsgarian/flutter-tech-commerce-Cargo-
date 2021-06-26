import 'package:commerce_app/provider_model.dart';
import 'package:commerce_app/screens/cart_screen.dart';
import 'package:commerce_app/screens/02_category_screen.dart';
import 'package:commerce_app/screens/favorites_screen.dart';
import 'package:commerce_app/screens/itemdetail_screen.dart';
import 'package:commerce_app/screens/listeddItems_screen.dart';
import 'package:commerce_app/screens/00_main_frame_screen.dart';
import 'package:commerce_app/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProviderModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => MainScreen(),
          "/Item": (context) => const ItemDetailScreen(),
          "/Cart": (context) => CartScreen(),
          "/Favorite": (context) => FavoriteScreen(),
          "/Category": (context) => const CategoryScreen(),
          "/Profile": (context) => const ProfileScreen(),
          "/ListedItems": (context) => const ListedItemsScreen(),
        },
        initialRoute: "/",
      ),
    );
  }
}
