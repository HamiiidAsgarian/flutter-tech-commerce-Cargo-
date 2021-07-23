import 'dart:html';
import 'dart:math';

import 'package:commerce_app/screens/itemdetail_screen.dart';
import 'package:commerce_app/screens/listeddItemsWithFilter_screen.dart';
import 'package:commerce_app/style/my_flutter_app_icons.dart';
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
  String selectedOption = 'Popular';

  @override
  Widget build(BuildContext context) {
    return Navigator(onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute(builder: (context) {
        return Scaffold(
          backgroundColor: cBackgroundGrey,
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SearchSection(
                chosenOption: selectedOption,
                optionsFunctions: (e) {
                  setState(() {
                    selectedOption = e ?? "";
                  });
                }),
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
                    )
                    .toList(),
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
        ]),
        Container(
          height: 50,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
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
        )
      ]),
    );
  }
}
