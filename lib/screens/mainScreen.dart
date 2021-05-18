// import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:commerce_app/widgets/carousel.dart';
import 'package:commerce_app/widgets/forCategorySection.dart';
import 'package:commerce_app/widgets/navAndAppbar.dart';
import 'package:commerce_app/widgets/searchSection.dart';
import 'package:flutter/material.dart';

// import '../consts.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int sliderIndex = 1;
  var currentpage1 = 0;

  @override
  void initState() {
    print("Hellow");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar:
          true, //////////* for fixing one pixle gap under the appbar
      appBar: MyAppBar(),
      bottomNavigationBar: MyBottomNavigationBar(),
      body: CustomScrollView(slivers: [
        SearchSection(),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              SizedBox(
                  height:
                      200, //////////////////////////////* carousel Section height
                  child: Carousel(sliderIndex: sliderIndex, itemIndex: 0)),
              ForCategorySection(),
              ForCategorySection(),
            ],
          ),
        )
      ]),
    );
  }
}
