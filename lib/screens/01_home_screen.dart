import 'dart:convert';

// import 'package:commerce_app/http_classed.dart';
import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:commerce_app/widgets/appbar.dart';
import 'package:commerce_app/widgets/carousel.dart';
import 'package:commerce_app/widgets/forCategorySection.dart';
import 'package:commerce_app/widgets/windows_category-section.dart';
import 'package:flutter/material.dart';
import '../consts.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _carouselData;
  var _windowsData;
  var _ScrolableOne;

  @override
  void initState() {
    super.initState();
    setState(() {
      _carouselData = getDataFromApi(url: "http://localhost:3000/Carousels");
      _windowsData = getDataFromApi(url: "http://localhost:3000/Windows");
      _ScrolableOne =
          getDataFromApi(url: "http://localhost:3000/scrollableItems");
    });
  }

  List<String> fakeList5 = List.generate(5, (index) => "number $index");
  // List carouselsList = [];
  // List scrolablesList = [];
  // List windowsList = [];

  Widget build(BuildContext context) {
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
                  FutureBuilder(
                      future: _carouselData,
                      builder: (context,
                          AsyncSnapshot<Map<String, dynamic>> snapshot) {
                        print("carousel is Built");

                        if (snapshot.hasData) {
                          return Container(
                            child: CarouselSection(
                                items: snapshot.data!['FirstCarousel']),
                          );
                        }
                        return CircularProgressIndicator();
                      }),
                  FutureBuilder(
                      future: _ScrolableOne,
                      builder: (context,
                          AsyncSnapshot<Map<String, dynamic>> snapshot) {
                        print("scroll is Built");
                        if (snapshot.hasData) {
                          return Container(
                            child: HorizontalItemsList(
                                sectionTitle: "Watches",
                                ListItemsMargin: EdgeInsets.only(right: 10),
                                ListFramePadding:
                                    EdgeInsets.symmetric(horizontal: 15),
                                itemsList: snapshot.data!['Watches']),
                          );
                        }
                        return CircularProgressIndicator();
                      }),
                  FutureBuilder(
                      future: _windowsData,
                      builder: (context,
                          AsyncSnapshot<Map<String, dynamic>> snapshot) {
                        print("windows is Built");
                        if (snapshot.hasData) {
                          return Container(
                            child: WindowsCategorySection(
                                items: snapshot.data!['FirstWindow']),
                          );
                        }
                        return CircularProgressIndicator();
                      }),
                  SizedBox(height: 10),
                  FutureBuilder(
                      future: _ScrolableOne,
                      builder: (context,
                          AsyncSnapshot<Map<String, dynamic>> snapshot) {
                        List<Widget> a = [];
                        print("scroll is Built");
                        if (snapshot.hasData) {
                          snapshot.data!.forEach((key, value) {
                            a.add(Container(
                              child: HorizontalItemsList(
                                  sectionTitle: key,
                                  ListItemsMargin: EdgeInsets.only(right: 10),
                                  ListFramePadding:
                                      EdgeInsets.symmetric(horizontal: 15),
                                  itemsList: value),
                            ));
                          });
                          return Container(child: Column(children: a));
                        }
                        return CircularProgressIndicator();
                      }),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        );
      });
    });
  }

  Future<Map<String, dynamic>> getDataFromApi({String url = ""}) async {
    var response = await http.get(Uri.parse(url));

    var responseBody = response.body;
    Map<String, dynamic> parsedJson = jsonDecode(responseBody);

    // ApiFirstPageModel ModeledData = ApiFirstPageModel.fromJson(parsedJson);

    return parsedJson;
  }
}
