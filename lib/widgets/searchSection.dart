import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:commerce_app/widgets/text_field.dart';
import 'package:flutter/material.dart';

import '../consts.dart';

//////////////////////////////////////////////////* SearchSection
class SearchSection extends StatefulWidget {
  @override
  _SearchSectionState createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  String? _chosenOption;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading:
          false, //////////////////////////////////* removing default unwanted back button
      titleSpacing: 0 //* for  deleting unexpected padding of title
      // automaticallyImplyLeading: false,
      ,
      toolbarHeight: 130,
      expandedHeight: 130, //* IMPORTANT: making space for whole Bar
      // pinned: true,
      // floating: true, ////* instance appearance when slid up
      // centerTitle: true,
      // flexibleSpace: FlexibleSpaceBar(
      //   background: Column(children: [
      //     SizedBox(height: 40),
      //     Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      //       SizedBox(width: 400, child: TextFieldWithIcon()),
      //       SizedBox(width: 10),
      //       IconButton(icon: Icon(MyFlutterApp.params), onPressed: null)
      //     ]),
      //   ]),
      // ),
      title: Container(
        // color: cBackgroundGrey, //NOTE search section bg color
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(children: [
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
                    print(_chosenOption);
                  },
                ),
                CategoryTextButton(
                  isChosen: _chosenOption == "Recommended" ? true : false,
                  text: "Recommended",
                  function: (String e) {
                    setState(() {
                      _chosenOption = e;
                    });
                    print(_chosenOption);
                  },
                ),
                CategoryTextButton(
                  isChosen: _chosenOption == "Top Brands" ? true : false,
                  text: "Top Brands",
                  function: (String e) {
                    setState(() {
                      _chosenOption = e;
                    });
                    print(_chosenOption);
                  },
                ),
              ],
            ),
          )
        ]),
      ),

      backgroundColor: appBarWhite,
      // title:
    );
  }
}

///

class CategoryTextButton extends StatelessWidget {
  final String text;
  final Function function;
  final bool isChosen;

  const CategoryTextButton(
      {required this.text, required this.function, required this.isChosen});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: isChosen == true
          ? const BoxDecoration(border: Border(bottom: BorderSide()))
          : BoxDecoration(
              border: Border.all(
                  width: 0.0, color: Colors.blueGrey.withOpacity(0))),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        onPressed: () => function(text),
        child: Text(text, style: categoryFontStyle),
      ),
    );
  }
}
