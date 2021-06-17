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
        body: Container(
          width: double.infinity,
          color: Colors.blueAccent,
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
          child: Center(
            child: SingleChildScrollView(
              // gridview.count
              // childAspectRatio: MediaQuery.of(context).size.height / 900,
              // // childAspectRatio: 2,
              // crossAxisSpacing: 10,
              // mainAxisSpacing: 10,
              // crossAxisCount: 2,
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
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
                    .map<Widget>((dynamic itemTitle) => Item(
                          title: itemTitle,
                        ))
                    .toList(),
              ),
            ),
          ),
        ));
  }
}
