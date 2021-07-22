import 'package:commerce_app/provider_model.dart';
import 'package:commerce_app/screens/listeddItemsWithFilter_screen.dart';
import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../consts.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen(
      {this.hasBack = false, required this.data, this.title = ""});
  final bool hasBack;
  final dynamic data;
  final String title;

  iconBuilder(var currentIndexData) {
    bool result = currentIndexData.runtimeType.toString() == "_JsonMap";
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderModel>(
      builder: (context, vals, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              title,
              style: itemBrandFontStyle.copyWith(fontSize: 20),
            ),
            elevation: 0,
            backgroundColor:
                Colors.white, ////////////////////////* appbar color
            leading: hasBack == true
                ? IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      MyFlutterApp.left_open,
                      color: appBargrey,
                    ),
                  )
                : SizedBox(),
          ),
          body: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                    height: 60,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 0.1, color: Colors.grey))),
                    child: Center(
                      child: ListTile(
                        ///NOTE making list of categories based on having sub-cagagories or not
                        onTap: () {
                          var result;
                          Type type = data.values.elementAt(index).runtimeType;
                          type == List
                              ? result = ListedItemsWithFilterScreen(
                                  otherBrands: data,
                                  title: data.keys.elementAt(index),
                                  itemsList: (data.values.elementAt(index)),
                                )
                              : result = CategoryScreen(
                                  title: data.keys.elementAt(index),
                                  hasBack: true,
                                  data: data.values.elementAt(index));

                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return result;
                            },
                          ));
                        },

                        ///NOTE if the list is nested adds back(pop) icon.
                        trailing:
                            iconBuilder(data.values.elementAt(index)) == false
                                ? SizedBox()
                                : Icon(Icons.keyboard_arrow_right, size: 30),
                        title: Text(data.keys.elementAt(index),
                            style: itemBrandFontStyle.copyWith(fontSize: 17)),
                      ),
                    ));
              }),
        );
        //   });
        // });
      },
    );
  }
}
