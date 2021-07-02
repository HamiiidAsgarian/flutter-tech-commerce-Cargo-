import 'dart:convert';

import 'package:commerce_app/http_classed.dart';
import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:commerce_app/widgets/appbar.dart';
import 'package:commerce_app/widgets/carousel.dart';
import 'package:commerce_app/widgets/forCategorySection.dart';
import 'package:commerce_app/widgets/windows_category-section.dart';
import 'package:flutter/material.dart';
import '../consts.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  static const List<String> data = ['men', '2', '3', '4', 'men', '2', '3', '4'];
  final List<String> fakeList5 = List.generate(5, (index) => "number $index");

  final String url = "http://localhost:3000/Watches";

  @override
  Widget build(BuildContext context) {
    getWatches(url);
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
                  SizedBox(height: 10),
                  Carousel(),
                  FutureBuilder(
                      future: getWatches(url),
                      builder: (context,
                          AsyncSnapshot<List<Watches>> asyncSnapshot) {
                        if (asyncSnapshot.hasData) {
                          return HorizontalItemsList(
                              sectionTitle: "For men",
                              ListItemsMargin: EdgeInsets.only(right: 10),
                              ListFramePadding:
                                  EdgeInsets.symmetric(horizontal: 15),
                              itemsList: asyncSnapshot.data!);
                        } else
                          return CircularProgressIndicator();
                      }),
                  SizedBox(height: 10),

                  WindowsCategorySection(),
                  // HorizontalItemsList(
                  //   ListItemsMargin: EdgeInsets.only(right: 10),
                  //   ListFramePadding: EdgeInsets.symmetric(horizontal: 15),
                  //   sectionTitle: "For women",
                  //   itemsList: fakeList5,
                  // ), // Expanded(
                  //   child: ItemsColumnMaker(itemRows: fakeList1),
                  // ),
                ],
              ),
            ),
          ),
        );
      });
    });
  }

//* get watches
  Future<List<Watches>> getWatches(String url) async {
    final response =
        await http.get(Uri.parse(url), headers: {"accept": "application/json"});
    // final statusCode = response.statusCode;
    // final headers = response.headers;
    // final contentType = headers['content-type'];
    // final jsonBody = response.body;
    // print(jsonBody[1]);
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<Watches> posts =
          List<Watches>.from(l.map((model) => Watches.fromJson(model)));
      // var a = Watches.fromJson(jsonDecode(response.body)); //NOTE if respose is map

      print(json.decode(response.body));
      print("-------");
      print(posts[0].title);

      return posts; // [0] is for situatio that respose is a list
    } else
      throw Exception('failed to load Watches');
  }
}

// class ItemsColumnMaker extends StatelessWidget {
//   final List<String>? itemRows;
//   const ItemsColumnMaker({Key? key, this.itemRows}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         // cacheExtent: 500,
//         scrollDirection: Axis.vertical,
//         itemCount: itemRows!.length,
//         itemBuilder: (context, index) => HorizontalItemsList(
//               sectionTitle: itemRows![index],
//               itemsList: List.generate(20, (index) => index.toString()),
//             ));
//   }
// }
