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
          Container(
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
                SizedBox(width: 5),
                Expanded(
                    child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: ['Aftabe', 'Lagan', 'Addidas', 'Puma', 'Banana']
                      .map((e) => Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              // width: 100,
                              // color: Colors.blue,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                border: Border.all(
                                    width: 1, color: appBargrey.withOpacity(0)),
                              ),
                              height: 30,
                              child: Center(
                                child: Text(e,
                                    style: itemBrandFontStyle.copyWith(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                          ))
                      .toList(),
                ))
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
                    .map<Widget>((dynamic itemTitle) => Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              color: Colors.white,
                              // width: (MediaQuery.of(context).size.width / 2) - 5,
                              child: Item(
                                title: itemTitle,
                                imageWidth:
                                    (MediaQuery.of(context).size.width / 2) -
                                        35,
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
