import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';

import '../consts.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Category",
          style: itemBrandFontStyle.copyWith(fontSize: 20),
        ),
        elevation: 0,
        backgroundColor: Colors.white, ////////////////////////* appbar color
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            MyFlutterApp.left_open,
            // MdiIcons.walletPlusOutline,
            color: appBargrey,
          ),
        ),
      ),
      body: RefreshIndicator(
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return TextButton(
                  onPressed: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 0.1, color: Colors.grey))),
                    child: ListTile(
                      title: Text("item $index",
                          style: itemBrandFontStyle.copyWith(fontSize: 15)),
                    ),
                  ),
                );
              }),
          onRefresh: () async {
            print("object");
          }),
    );
  }
}
