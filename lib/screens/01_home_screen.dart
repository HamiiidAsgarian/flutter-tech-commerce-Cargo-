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
  var _carouselData;
  var _windowsData;
  @override
  void initState() {
    super.initState();
    setState(() {
      _carouselData = getDataFromApi(url: "http://localhost:3000/Carousels");
      _carouselData = getDataFromApi(url: "http://localhost:3000/Carousels");
    });
  }

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
                      future: _carouselData,
                      builder: (context,
                          AsyncSnapshot<Map<String, dynamic>> snapshot) {
                        print("Carousel is Built");
                        if (snapshot.hasData) {
                          return Container(
                            child: CarouselSection(
                                items: snapshot.data!['FirstCarousel']),
                          );
                        }
                        return CircularProgressIndicator();
                      }),

                  SizedBox(height: 10),
                  // HorizontalItemsList(
                  //     sectionTitle: "For men",
                  //     ListItemsMargin: EdgeInsets.only(right: 10),
                  //     ListFramePadding: EdgeInsets.symmetric(horizontal: 15),
                  //     itemsList: [
                  //     ]),
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

  Future<Map<String, dynamic>> firstPageDataGet() async {
    var response = await http.get(Uri.parse("http://localhost:3000/firstpage"));

    var responseBody = response.body;
    Map<String, dynamic> parsedJson = jsonDecode(responseBody);

    // ApiFirstPageModel ModeledData = ApiFirstPageModel.fromJson(parsedJson);

    return parsedJson;
  }
}

Future<Map<String, dynamic>> getDataFromApi({String url = ""}) async {
  var response = await http.get(Uri.parse(url));

  var responseBody = response.body;
  Map<String, dynamic> parsedJson = jsonDecode(responseBody);

  // ApiFirstPageModel ModeledData = ApiFirstPageModel.fromJson(parsedJson);

  return parsedJson;
}



// give(Future a) async {
//   var z = a;

//   return a;
// }
