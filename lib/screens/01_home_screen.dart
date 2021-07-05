import 'dart:convert';

// import 'package:commerce_app/http_classed.dart';
import 'package:commerce_app/models/api_first_page_model.dart';
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
  @override
  void initState() {
    super.initState();
    setState(() {
      _future = firstPageDataGet();
    });
  }

  var _future;
  List<String> fakeList5 = List.generate(5, (index) => "number $index");
  List carouselsList = [];
  List scrolablesList = [];
  List windowsList = [];

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
              print("object");
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FutureBuilder(
                      future: _future,
                      builder:
                          (context, AsyncSnapshot<ApiFirstPageModel> snapshot) {
                        List<Widget> carouselsList2 = [];
                        if (snapshot.hasData) {
                          print("-------");
                          snapshot.data!.carousels.toJson().forEach(
                            (key, value) {
                              carouselsList2.add(CarouselSection());
                              // carouselsList.add(CarouselSection());
                              ;
                            },
                          );
                          snapshot.data!.scrollableItems.toJson().forEach(
                            (String key, value) {
                              // List<Watch>  q = Watch.fromJson(value);
                              carouselsList2.add(HorizontalItemsList(
                                  ListItemsMargin: EdgeInsets.only(right: 10),
                                  ListFramePadding:
                                      EdgeInsets.symmetric(horizontal: 15),
                                  sectionTitle: key,
                                  itemsList:
                                      snapshot.data!.scrollableItems.watches
                                  // snapshot.data!.scrollableItems.watches
                                  ));
                              // carouselsList.add(CarouselSection());
                              ;
                            },
                          );

                          return Container(
                              child: Column(children: carouselsList2));
                        } else
                          return CircularProgressIndicator();
                      }),
                  CarouselSection(),
                  SizedBox(height: 10),
                  HorizontalItemsList(
                      sectionTitle: "For men",
                      ListItemsMargin: EdgeInsets.only(right: 10),
                      ListFramePadding: EdgeInsets.symmetric(horizontal: 15),
                      itemsList: [
                        Watch(
                            id: 1,
                            title: "title",
                            company: "company",
                            price: 200,
                            imageUrl: "imageUrl",
                            thumbnail: "thumbnail"),
                        Watch(
                            id: 1,
                            title: "title",
                            company: "company",
                            price: 200,
                            imageUrl: "imageUrl",
                            thumbnail: "thumbnail")
                      ]),
                  SizedBox(height: 10),
                  WindowsCategorySection(),
                ],
              ),
            ),
          ),
        );
      });
    });
  }

  Future<ApiFirstPageModel> firstPageDataGet() async {
    var response = await http.get(Uri.parse("http://localhost:3000/firstpage"));

    var responseBody = response.body;
    var parsedJson = jsonDecode(responseBody);
    ApiFirstPageModel ModeledData = ApiFirstPageModel.fromJson(parsedJson);

    return ModeledData;
  }
}

// give(Future a) async {
//   var z = a;

//   return a;
// }
