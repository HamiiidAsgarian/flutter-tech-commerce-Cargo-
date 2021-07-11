import 'dart:html';

// import 'package:commerce_app/http_classed.dart';
import 'package:commerce_app/provider_model.dart';
import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:commerce_app/widgets/appbar.dart';
import 'package:commerce_app/widgets/carousel.dart';
import 'package:commerce_app/widgets/forCategorySection.dart';
import 'package:commerce_app/widgets/windows_category-section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../consts.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // var _carouselData;
  // var _windowsData;
  // var _ScrolableOne;
  var _firstPageData;

  @override
  void initState() {
    super.initState();
    setState(() {
      _firstPageData = Provider.of<ProviderModel>(context,
              listen:
                  false) //NOTE maybe better to delete this and pass it to provider totally
          .getDataFromApi(url: "http://localhost:3000/firstPage");

      // _firstPageData = getDataFromApi(url: "http://localhost:3000/firstPage");

      // _carouselData = getDataFromApi(url: "http://localhost:3000/Carousels");
      // _windowsData = getDataFromApi(url: "http://localhost:3000/Windows");
      // _ScrolableOne =
      // getDataFromApi(url: "http://localhost:3000/scrollableItems");
    });
  }

  // List<String> fakeList5 = List.generate(5, (index) => "number $index");

  // List carouselsList = [];
  // List scrolablesList = [];
  // List windowsList = [];

  Widget build(BuildContext context) {
    return Consumer<ProviderModel>(builder: (context, val, child) {
      return Navigator(onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            backgroundColor: cBackgroundGrey,
            appBar: const MyAppBar(
              leadingIcon: Icon(
                MyFlutterApp.menu,
                // MdiIcons.walletPlusOutline,
                color: appBargrey,
              ),
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                setState(() {});
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextButton(
                      child: Text("data"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return HomeScreen();
                        }));
                      },
                    ),
                    FutureBuilder(
                        future: _firstPageData,
                        builder: (context,
                            AsyncSnapshot<Map<String, dynamic>> snapshot) {
                          if (snapshot.hasData) {
                            return Column(children: [
                              Container(
                                child: CarouselSection(
                                    items: snapshot.data!['Carousels']
                                        ['FirstCarousel']),
                              ),
                              Container(
                                child: HorizontalItemsList(
                                    sectionTitle: "Watches",
                                    ListItemsMargin: EdgeInsets.only(right: 10),
                                    ListFramePadding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    itemsList: snapshot.data!['scrollableItems']
                                        ['Watches']),
                              ),
                              Container(
                                child: WindowsCategorySection(
                                    items: snapshot.data!['Windows']
                                        ['FirstWindow']),
                              )
                            ]);
                          }
                          return Container(
                            // height: 500,
                            // color: Colors.amber,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          );
        });
      });
    });
  }
}

// sum of two numbers
