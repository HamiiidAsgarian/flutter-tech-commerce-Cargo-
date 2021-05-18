import 'package:commerce_app/providerModel.dart';
import 'package:commerce_app/screens/mainScreen.dart';
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
          "/Main": (context) => MainScreen(),
        },
        initialRoute: "/Main",
      ),
    );
  }
}
