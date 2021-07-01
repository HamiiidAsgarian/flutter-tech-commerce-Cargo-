import 'dart:math';

import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:commerce_app/widgets/searchSection.dart';
import 'package:commerce_app/widgets/text_field.dart';
import 'package:flutter/material.dart';

import '../consts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Navigator(onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute(builder: (context) {
        return Scaffold(
          backgroundColor: cBackgroundGrey,
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // SizedBox(height: 15),
            const SearchSection(),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            //   child: FittedBox(
            //     child: Text(
            //       "Users top searches",
            //       style: itemBrandFontStyle.copyWith(fontSize: 18),
            //       textAlign: TextAlign.left,
            //     ),
            //   ),
            // ),
            SizedBox(height: 15),
            SearchItemsSection()
          ]),
        );
      });
    });
  }
}

/////////////////////////////----------------------------------------------------//////////////////
class SearchItemsSection extends StatelessWidget {
  SearchItemsSection({Key? key}) : super(key: key);
  final List<Color> myColors = [
    Colors.amber,
    Colors.red,
    Colors.pink,
    Colors.greenAccent,
    Colors.blueAccent,
    Colors.yellow.shade500,
    Colors.lightBlue,
    Colors.brown
  ];

  @override
  Widget build(BuildContext context) {
    final double screensize = MediaQuery.of(context).size.width;

    return Expanded(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Wrap(
              children: ['a', 'b', 'c', 'a', 'b', 'c', 'a', 'b', 'c']
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
                              fillColor: Colors.amber,
                              splashColor: Colors.grey.withOpacity(0.5),
                              onPressed: () {
                                print("pressed");
                              },
                              child: Container(
                                  // color: Colors.amber,
                                  ),
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
              children: [
                'Addiada',
                ' V',
                'Corleone',
                'tea',
                'ran',
                'arrawar',
                'RED',
                'Venn',
                'cadasdad',
                'Eorne',
                'tea',
                'ran',
                'arrawar',
              ]
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: MaterialButton(
                          elevation: 0,
                          minWidth: 20,
                          color: myColors[Random().nextInt(myColors.length)],
                          onPressed: () {},
                          child: Text(e,
                              style: itemTitleFontStyle.copyWith(
                                  fontSize: 12, color: Colors.white)),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}

////////----------------------------------------------------------------------------------/////////
class SearchSection extends StatefulWidget {
  const SearchSection({Key? key}) : super(key: key);

  @override
  _SearchSectionState createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  String? _chosenOption;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, //NOTE search section bg color
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(children: [
        const SizedBox(height: 25),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Expanded(
              child: TextFieldWithIcon(
            hint: 'Type something to search',
            icon: MyFlutterApp.search_5,
          )),
          // SizedBox(width: 20),
          // IconButton(
          //   icon: const Icon(
          //     MyFlutterApp.params,
          //     color: appBargrey,
          //   ),
          //   onPressed: () {},
          //   // splashColor: Colors.red,
          // )
        ]),
        Container(
          height: 50,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryTextButton(
                  isChosen: _chosenOption == "Popular" ? true : false,
                  text: "Popular",
                  function: (String e) {
                    setState(() {
                      _chosenOption = e;
                    });
                    // print(this._chosenOption);
                  },
                ),
                CategoryTextButton(
                  isChosen: _chosenOption == "Recommended" ? true : false,
                  text: "Recommended",
                  function: (String e) {
                    setState(() {
                      _chosenOption = e;
                    });
                    // print(this._chosenOption);
                  },
                ),
                CategoryTextButton(
                  isChosen: _chosenOption == "Top Brands" ? true : false,
                  text: "Top Brands",
                  function: (String e) {
                    setState(() {
                      _chosenOption = e;
                    });
                    // print(this._chosenOption);
                  },
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
