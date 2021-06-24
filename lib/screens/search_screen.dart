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
    final double screensize = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: cBackgroundGrey,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SearchSection(),
        Padding(
          padding: const EdgeInsets.only(left: 25, top: 25),
          child: Text(
            "Users top searches",
            style: itemBrandFontStyle.copyWith(fontSize: 25),
            textAlign: TextAlign.left,
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Wrap(
                  children: ['a', 'b', 'c', 'a', 'b', 'c', 'a', 'b', 'c']
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.all(10),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: TextButton(
                                onPressed: () {},
                                child: Container(
                                  width: screensize / 3 - 37,
                                  height: screensize / 3 - 37,
                                  color: Colors.amber,
                                ),
                              )),
                        ),
                      )
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Wrap(
                  children: [
                    'aaasd',
                    ' asdffb',
                    'ac',
                    'ad',
                    'asdasdb',
                    'cds',
                    'aasdadad',
                    'bdd',
                    'cadasdad'
                  ]
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.all(5),
                          child: GestureDetector(
                            onTap: () {},
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 10),
                                  color: Colors.amberAccent,
                                  child: Text(e)),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}

/////////////////////////////----------------------------------------------------//////////////////

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
          IconButton(
            icon: const Icon(
              MyFlutterApp.params,
              color: appBargrey,
            ),
            onPressed: () {},
            // splashColor: Colors.red,
          )
        ]),
        Container(
          height: 60,
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
        )
      ]),
    );
  }
}
