import 'package:commerce_app/providerModel.dart';
import 'package:commerce_app/screens/cart_screen.dart';
import 'package:commerce_app/screens/category_screen.dart';
import 'package:commerce_app/screens/favorites_screen.dart';
import 'package:commerce_app/screens/itemdetail_screen.dart';
import 'package:commerce_app/screens/listeddItems_screen.dart';
import 'package:commerce_app/screens/main_screen.dart';
import 'package:commerce_app/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() {
  runApp(MyApp());
}

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
          "/Item": (context) => ItemDetailScreen(),
          "/Cart": (context) => CartScreen(),
          "/Favorite": (context) => FavoriteScreen(),
          "/Category": (context) => CategoryScreen(),
          "/Profile": (context) => ProfileScreen(),
          "/ListedItems": (context) => ListedItemsScreen(),
        },
        initialRoute: "/",
      ),
    );
  }
}
