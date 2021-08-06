import 'package:commerce_app/provider_model.dart';
import 'package:commerce_app/widgets/appbar.dart';
import 'package:commerce_app/widgets/carousel.dart';
import 'package:commerce_app/widgets/forCategorySection.dart';
import 'package:commerce_app/widgets/windows_category-section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../consts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Map<String, dynamic>> _firstPageData;

  @override
  void initState() {
    super.initState();
    setState(() {
      _firstPageData = Provider.of<ProviderModel>(context, listen: false)
          .getDataFromApi(url: "http://192.168.1.6:4000/firstPage")
          .timeout(Duration(seconds: 30));

      // .getDataFromApi(url: "http://localhost:3000/firstPage");
    });
  }

  Widget build(BuildContext context) {
    return Consumer<ProviderModel>(builder: (context, val, child) {
      return Navigator(onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            backgroundColor: cBackgroundGrey,
            appBar: MyAppBar(
                // leadingIcon: Icon(
                //   MyFlutterApp.menu,
                //   color: cIconGrey,
                // ),
                ),
            body: RefreshIndicator(
              onRefresh: () async {
                setState(() {});
              },
              child: SingleChildScrollView(
                //REVIEW
                child: Column(
                  children: [
                    FutureBuilder(
                        future: _firstPageData.timeout(Duration(seconds: 15)),
                        builder: (context,
                            AsyncSnapshot<Map<String, dynamic>> snapshot) {
                          var a = {};
                          List<Widget> b = [];
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasError) {
                              return Center(
                                  child: Text(snapshot.error.toString()));
                            }
                            a = snapshot.data!['scrollableItems'];
                            a.forEach((key, value) {
                              b.add(HorizontalItemsList(
                                  sectionTitle: key,
                                  ListItemsMargin: EdgeInsets.only(right: 10.0),
                                  ListFramePadding:
                                      EdgeInsets.symmetric(horizontal: 15.0),
                                  itemsList: value));
                            });

                            return Column(children: [
                              // CarouselSection(
                              //     items: snapshot.data!['Carousels']
                              //         ['FirstCarousel']),
                              HorizontalItemsList(
                                  sectionTitle: "Watches",
                                  ListItemsMargin: EdgeInsets.only(right: 10.0),
                                  ListFramePadding:
                                      EdgeInsets.symmetric(horizontal: 15.0),
                                  itemsList: snapshot.data!['scrollableItems']
                                      ['Watches']),
                              // WindowsCategorySection(
                              //     items: snapshot.data!['Windows']
                              //         ['FirstWindow']),
                              // Column(children: b)
                            ]);
                          }
                          return Container(
                              child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 200,
                                // color: Colors.blueGrey[900],
                                child: Center(
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Color(0xff263238)),
                                        strokeWidth: 15,
                                        backgroundColor: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ));
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
