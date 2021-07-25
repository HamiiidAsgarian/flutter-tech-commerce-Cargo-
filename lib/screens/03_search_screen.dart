import 'dart:html';
import 'dart:math';

import 'package:commerce_app/screens/itemdetail_screen.dart';
import 'package:commerce_app/screens/listeddItemsWithFilter_screen.dart';
import 'package:commerce_app/widgets/searchSection.dart';
import 'package:commerce_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../consts.dart';
import '../provider_model.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({required this.data});
  final Map<String, dynamic> data;

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late Future<List<dynamic>> _allProducts;

  @override
  void initState() {
    super.initState();
    _allProducts = Provider.of<ProviderModel>(context, listen: false)
        .getDataFromApiToList(url: "http://localhost:3000/allProducts");
  }

  String selectedOption = 'Popular';
  String _searchedText = "";

  @override
  Widget build(BuildContext context) {
    // print("axa".contains('xx'));
    return Navigator(onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute(builder: (context) {
        return Scaffold(
          backgroundColor: cBackgroundGrey,
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(height: 25, color: Colors.white),
            FutureBuilder(
                future: _allProducts,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: AutoCompleteCustomInput(
                          hint: "Type product name to seach",
                          icon: Icons.search,
                          function: (e) {
                            setState(() {
                              _searchedText = e;
                              print(".....$_searchedText");
                            });
                          },
                          listItems: snapshot.data,
                        ),
                        color: Colors.white);
                  }

                  return CircularProgressIndicator();
                }),
            Container(height: 10, color: Colors.white),
            SearchSection(
                // function: (e) {
                //   setState(() {
                //     _searchedText = e;
                //   });
                // },
                chosenOption: selectedOption,
                optionsFunctions: (e) {
                  setState(() {
                    selectedOption = e ?? "";
                  });
                }),
            Container(height: 10, color: Colors.white),
            SizedBox(height: 15),
            SearchItemsSection(
                categoryData: widget.data[selectedOption.toLowerCase()]
                    ['categories'],
                data: widget.data[selectedOption.toLowerCase()]['items'])
          ]),
        );
      });
    });
  }
}

/////////////////////////////----------------------------------------------------//////////////////
class SearchItemsSection extends StatelessWidget {
  SearchItemsSection({required this.data, required this.categoryData});
  final List<dynamic> data;
  final List<dynamic> categoryData;
  final List<Color> myColors = [
    Colors.amber.shade900,
    Colors.red,
    Colors.pink,
    Colors.greenAccent.shade700,
    Colors.blueAccent,
    Colors.purpleAccent.shade700,
    Colors.lightBlue,
    Colors.brown
  ];

  categoryMaker(context, categoryData) {
    List<Widget> result = [];
    for (var item in categoryData) {
      result.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: MaterialButton(
            elevation: 0,
            minWidth: 20,
            color: myColors[Random().nextInt(myColors.length)],
            onPressed: () async {
              //REVIEW makes loading the new page a bit slower
              List<dynamic> allProducts =
                  await Provider.of<ProviderModel>(context, listen: false)
                      .getDataFromApiToList(url: "http://localhost:3000/$e");

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListedItemsWithFilterScreen(
                          itemsList: allProducts, title: item)));
            },
            child: Text(item,
                style: itemTitleFontStyle.copyWith(
                    fontSize: 12, color: Colors.white)),
          ),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screensize = MediaQuery.of(context).size.width;
    return Consumer<ProviderModel>(builder: (context, vals, child) {
////
      return Expanded(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Wrap(
                children: data
                    .map(
                      (e) => ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: Container(
                          width: (screensize / 3) - 17,
                          height: (screensize / 3) - 17,
                          // color: Colors.blue,
                          padding: const EdgeInsets.all(5),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: RawMaterialButton(
                                // fillColor: Colors.amber,
                                splashColor: Colors.grey.withOpacity(0.5),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ItemDetailScreen(
                                                  title: '', data: e)));
                                },
                                child: Image.network(e['thumbnail'],
                                    fit: BoxFit.fill),
                              )),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Wrap(
                children: categoryData
                    .asMap()
                    .map((i, e) => MapEntry(
                          i,
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: MaterialButton(
                                elevation: 0,
                                minWidth: 20,
                                color: myColors[i % myColors.length],
                                onPressed: () async {
                                  //REVIEW makes loading the new page a bit slower
                                  List<dynamic> allProducts =
                                      await Provider.of<ProviderModel>(context,
                                              listen: false)
                                          .getDataFromApiToList(
                                              url: "http://localhost:3000/$e");

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ListedItemsWithFilterScreen(
                                                  itemsList: allProducts,
                                                  title: e)));
                                },
                                child: Text(e,
                                    style: itemTitleFontStyle.copyWith(
                                        fontSize: 12, color: Colors.white)),
                              ),
                            ),
                          ),
                        ))
                    .values
                    .toList(),
                // .map(
                //   (e) =>
                // Padding(
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: 5, vertical: 5),
                //     child: ClipRRect(
                //       borderRadius: BorderRadius.circular(5),
                //       child: MaterialButton(
                //         elevation: 0,
                //         minWidth: 20,
                //         color: myColors[Random().nextInt(myColors.length)],
                //         onPressed: () async {
                //           //REVIEW makes loading the new page a bit slower
                //           List<dynamic> allProducts =
                //               await Provider.of<ProviderModel>(context,
                //                       listen: false)
                //                   .getDataFromApiToList(
                //                       url: "http://localhost:3000/$e");

                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) =>
                //                       ListedItemsWithFilterScreen(
                //                           itemsList: allProducts,
                //                           title: e)));
                //         },
                //         child: Text(e,
                //             style: itemTitleFontStyle.copyWith(
                //                 fontSize: 12, color: Colors.white)),
                //       ),
                //     ),
                //   ),
                // )
                // .toList(),
              ),
            )
          ],
        ),
      );
////
    });
  }
}

////////----------------------------------------------------------------------------------/////////
class SearchSection extends StatelessWidget {
  SearchSection({this.chosenOption, this.optionsFunctions});

  final String? chosenOption;
  final Function? optionsFunctions;
  // final Function function;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white, //NOTE search section bg color
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child:
          //  Column(children: [
          //   const SizedBox(height: 25),
          // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          //   Expanded(
          //       child: TextFieldWithIcon(
          //     function: function,
          //     hint: 'Type something to search',
          //     icon: MyFlutterApp.search_5,
          //   )),
          // ]),
          //   Container(
          // width: double.infinity,
          // height: 50,
          // child:
          SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: ['Popular', 'Recommended', 'Top Brands']
                .map((e) => CategoryTextButton(
                    isChosen: chosenOption == e ? true : false,
                    text: e,
                    function: optionsFunctions!))
                .toList()

            //  [

            //   CategoryTextButton(
            //     isChosen: _chosenOption == "Recommended" ? true : false,
            //     text: "Recommended",
            //     function: (String e) {
            //       setState(() {
            //         _chosenOption = e;
            //       });
            //       // print(this._chosenOption);
            //     },
            //   ),
            //   CategoryTextButton(
            //     isChosen: _chosenOption == "Top Brands" ? true : false,
            //     text: "Top Brands",
            //     function: (String e) {
            //       setState(() {
            //         _chosenOption = e;
            //       });
            //       // print(this._chosenOption);
            //     },
            //   ),
            // ],
            ),
      ),
      // )
      // ]),
    );
  }
}
