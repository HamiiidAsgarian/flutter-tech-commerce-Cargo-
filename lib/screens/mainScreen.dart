// import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:commerce_app/providerModel.dart';
import 'package:commerce_app/screens/CartScreen.dart';
import 'package:commerce_app/screens/favoritesScreen.dart';
import 'package:commerce_app/screens/profileScreen.dart';
import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:commerce_app/widgets/carousel.dart';
import 'package:commerce_app/widgets/forCategorySection.dart';
import 'package:commerce_app/widgets/navAndAppbar.dart';
import 'package:commerce_app/widgets/searchSection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../consts.dart';

// import '../consts.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var currentpage1 = 0;
  List<Widget> screens = [
    ProfileScreen(),
    MainScreenContetnts(),
    CartScreen(),
    FavoriteScreen()
  ];

  @override
  void initState() {
    print("Hellow");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderModel>(builder: (context, vals, child) {
      // var a = ValueNotifier(vals.appBarSelectedIndex);

      // print("aaaaaaaaaaaaaaaaaaaaaaaa ${a.value}");
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

class MainScreenContetnts extends StatefulWidget {
  const MainScreenContetnts({Key? key}) : super(key: key);

  @override
  _MainScreenContetntsState createState() => _MainScreenContetntsState();
}

class _MainScreenContetntsState extends State<MainScreenContetnts> {
  final int sliderIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        leadingIcon: Icon(
          MyFlutterApp.menu,
          // MdiIcons.walletPlusOutline,
          color: appBargrey,
        ),
      ),
      body: CustomScrollView(slivers: [
        SearchSection(),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              SizedBox(
                  height:
                      200, //////////////////////////////* carousel Section height
                  child: Carousel(sliderIndex: sliderIndex, itemIndex: 0)),
              ForCategorySection(sectionTitle: "For Men"),
              ForCategorySection(sectionTitle: "For WoMen"),

              // ForCategorySection(),
            ],
          ),
        )
      ]),
    );
  }
}
