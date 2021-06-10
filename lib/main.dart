import 'package:commerce_app/providerModel.dart';
import 'package:commerce_app/screens/CartScreen.dart';
import 'package:commerce_app/screens/categoryScreen.dart';
import 'package:commerce_app/screens/favoritesScreen.dart';
import 'package:commerce_app/screens/itemDetailScreen.dart';
import 'package:commerce_app/screens/mainScreen.dart';
import 'package:commerce_app/screens/profileScreen.dart';
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
        },
        initialRoute: "/",
      ),
    );
  }
}
