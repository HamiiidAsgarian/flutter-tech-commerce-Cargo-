// import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:commerce_app/provider_model.dart';
import 'package:commerce_app/screens/Profile_screen2.dart';
import 'package:commerce_app/screens/category_screen.dart';
import 'package:commerce_app/screens/search_screen.dart';
import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:commerce_app/widgets/appbar.dart';
import 'package:commerce_app/widgets/carousel.dart';
import 'package:commerce_app/widgets/forCategorySection.dart';
import 'package:commerce_app/widgets/navAndAppbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../consts.dart';

// import '../consts.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentpage1 = 0;
  List<Widget> screens = const [
    MainScreenContetnts(),
    CategoryScreen(),
    SearchScreen(),
    ProfileScreen2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderModel>(builder: (context, vals, child) {
      return Scaffold(
        extendBodyBehindAppBar:
            true, //////////* for fixing one pixle gap under the appbar
        bottomNavigationBar: MyBottomNavigationBar(),
        body: screens[vals.appBarSelectedIndex],
        // screens[Provider.of<ProviderModel>(context).appBarSelectedIndex]
      );
    });
  }
}

////////////////////////////////////////////////////////////////////////////////////* Home Screen
class MainScreenContetnts extends StatelessWidget {
  const MainScreenContetnts({Key? key}) : super(key: key);

//   @override
//   _MainScreenContetntsState createState() => _MainScreenContetntsState();
// }

// class _MainScreenContetntsState extends State<MainScreenContetnts> {
  // final int sliderIndex = 1;

  // Null get sectionTitle => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        leadingIcon: Icon(
          MyFlutterApp.menu,
          // MdiIcons.walletPlusOutline,
          color: appBargrey,
        ),
      ),
      body: CustomScrollView(slivers: [
        // SearchSection(),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Carousel(),
              ScrollviewCategory(
                  sectionTitle: "For men1",
                  itemsList: ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']),
              // WindowsCategorySection(),
              ScrollviewCategory(
                  sectionTitle: "For men1",
                  itemsList: ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']),
              ScrollviewCategory(
                  sectionTitle: "For men1",
                  itemsList: ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']),
            ],
          ),
        )
      ]),
    );
  }
}
