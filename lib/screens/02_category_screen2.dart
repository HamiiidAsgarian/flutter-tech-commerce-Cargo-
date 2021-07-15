import 'dart:convert';

import 'package:commerce_app/provider_model.dart';
import 'package:commerce_app/screens/listeddItems_screen.dart';
import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../consts.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({this.hasBack = false, this.data});
  final bool hasBack;
  final data;

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  // ignore: unused_field
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderModel>(
      builder: (context, vals, child) {
        // return Navigator(
        //   onGenerateRoute: (RouteSettings settings) {
        //     return MaterialPageRoute(
        //       builder: (context) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Category",
              style: itemBrandFontStyle.copyWith(fontSize: 20),
            ),
            elevation: 0,
            backgroundColor:
                Colors.white, ////////////////////////* appbar color
            leading: widget.hasBack == true
                ? IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      MyFlutterApp.left_open,
                      // MdiIcons.walletPlusOutline,
                      color: appBargrey,
                    ),
                  )
                : SizedBox(),
          ),
          body: RefreshIndicator(
              onRefresh: () async {
                // print("object");
              },
              child: ListView.builder(
                  itemCount: widget.data?.length,
                  itemBuilder: (context, index) {
                    // print(
                    //     "2: ${widget.data!.keys.elementAt(index)}:${widget.data!.values.elementAt(index)}");
                    return Container(
                        height: 60,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 0.1, color: Colors.grey))),
                        child: Center(
                          child: ListTile(
                            onTap: () {
                              var result;
                              Type type = widget.data.values
                                  .elementAt(index)
                                  .runtimeType;

                              var data1 = widget.data.values
                                  .elementAt(index)
                                  .runtimeType;
                              // print('---> ${data1==List}');

                              type == List
                                  ? result = ListedItemsScreen(
                                      title: widget.data!.keys.elementAt(index),
                                      itemsList: (widget.data!.values
                                          .elementAt(index)),
                                    )
                                  : result = CategoryScreen(
                                      hasBack: true,
                                      data:
                                          widget.data!.values.elementAt(index));

                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return result;
                              }));
                            },
                            trailing: const Icon(Icons.keyboard_arrow_right,
                                size: 30),
                            title: Text(widget.data!.keys.elementAt(index),
                                style:
                                    itemBrandFontStyle.copyWith(fontSize: 17)),
                          ),
                        ));
                  })),
        );
        //       },
        //     );
        //   },
        // );
      },
    );
  }
}
