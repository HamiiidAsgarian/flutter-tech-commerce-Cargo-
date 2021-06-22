import 'package:commerce_app/screens/searchLimitScreen.dart';
import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:commerce_app/widgets/appbar.dart';
import 'package:commerce_app/widgets/item.dart';
import 'package:flutter/material.dart';

import '../consts.dart';

class ListedItemsScreen extends StatefulWidget {
  const ListedItemsScreen({Key? key}) : super(key: key);

  @override
  _ListedItemsScreenState createState() => _ListedItemsScreenState();
}

class _ListedItemsScreenState extends State<ListedItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: cBackgroundGrey,
        appBar: MyAppBar(
          title: Text(
            "Items",
            style: itemBrandFontStyle.copyWith(fontSize: 20),
          ),
          leadingIcon: Icon(
            MyFlutterApp.left_open,
            // MdiIcons.walletPlusOutline,
            color: appBargrey,
          ),
          leadingIconFunction: () {
            Navigator.pushNamed(context, "/");
          },
        ),
        body: Column(children: [
          Divider(
            height: 1,
            color: cBackgroundGrey,
          ),
          FilterAndSortSection(),
          SizedBox(height: 7),
          OtherBrandsSection(),
          SizedBox(height: 7),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
              // gridview.count
              // childAspectRatio: MediaQuery.of(context).size.height / 900,
              // // childAspectRatio: 2,
              // crossAxisSpacing: 10,
              // mainAxisSpacing: 10,
              // crossAxisCount: 2,
              child: Wrap(
                spacing: 0, runSpacing: 0,
                // alignment: WrapAlignment.spaceAround,
                // crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  "Reading",
                  "Speaking",
                  "listening",
                  "writing",
                  '1',
                  '',
                  '',
                  '',
                  '' "Reading",
                  "Speaking",
                  "listening",
                  "writing",
                  '1',
                  "Reading",
                  "Speaking",
                  "listening",
                  "writing",
                  '1',
                ]
                    .map<Widget>((dynamic itemTitle) => Container(
                          // color: Colors.amber,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              color: Colors.white,
                              // width: (MediaQuery.of(context).size.width / 2) - 5,
                              child: Item(
                                title: itemTitle,
                                imageWidth:
                                    (MediaQuery.of(context).size.width / 2) -
                                        59,
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ]));
  }
}

//////////////////////////////////////////////////////////////////////////////////
class OtherBrandsSection extends StatelessWidget {
  const OtherBrandsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0), //NOTE section margin
      // color: Colors.amber,
      // padding: EdgeInsets.symmetric(horizontal: 25),
      height: 40,
      // color: Colors.yellowAccent,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center, //todo
        children: [
          SizedBox(width: 25),
          Text("Other brands",
              style: itemBrandFontStyle.copyWith(fontSize: 15)),
          SizedBox(width: 7),
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: ['Aftabe', 'Lagan', 'Addidas', 'Puma', 'Banana']
                .map((e) => Padding(
                      padding: EdgeInsets.all(5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white, //NOTE Other brands
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(width: 1, color: cBorderGrey),
                        ),
                        height: 30,
                        child: TextButton(
                          onPressed: () {},
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            child: Text(e,
                                style: itemBrandFontStyle.copyWith(
                                    fontSize: 13, fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ))
        ],
      ),
    );
  }
}

class FilterAndSortSection extends StatelessWidget {
  const FilterAndSortSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //NOTE Filter and sort Section
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: Row(children: [
        Expanded(
          child: TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchLimitScreen();
              }));
            },
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.filter_list,
                size: 25,
                color: appBargrey,
              ),
              SizedBox(width: 5),
              Text("Filter", style: itemTitleFontStyle.copyWith(fontSize: 18))
            ]),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {
              sortPopup(context);
            },
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.sort,
                size: 25,
                color: appBargrey,
              ),
              SizedBox(width: 5),
              Text("Sort", style: itemTitleFontStyle.copyWith(fontSize: 18))
            ]),
          ),
        ),
      ]),
    );
  }
}

//////////////////////////////////////////////////////
sortPopup(context) {
  {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                height: (MediaQuery.of(context).size.height / 2),
                color: Colors.white,
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    color: Colors.white, //NOTE Title section color
                    child: ListTile(
                      title: Center(
                          child: Text("Sort",
                              style:
                                  itemBrandFontStyle.copyWith(fontSize: 25))),
                      trailing: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.cancel, size: 30)),
                    ),
                  ),
                  Divider(height: 0),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SortOption(text: "LowestPRice"),
                          SortOption(text: "LowestPRice"),
                          SortOption(text: "LowestPRice"),
                          SortOption(text: "LowestPRice"),
                          SortOption(text: "LowestPRice"),
                          SortOption(text: "LowestPRice"),
                          SortOption(text: "LowestPRice"),
                          SortOption(text: "LowestPRice"),
                          SortOption(text: "LowestPRice"),
                        ],
                      ),
                    ),
                  )
                ]),
              ));
        });
  }
}

//////////////////////////////////////////////////
class SortOption extends StatelessWidget {
  final String? text;
  SortOption({this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(text);
      },
      child: Padding(
          padding: EdgeInsets.only(right: 50, top: 25),
          child: Text(this.text!,
              style: itemBrandFontStyle.copyWith(fontSize: 25))),
    );
  }
}
