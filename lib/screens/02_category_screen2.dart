import 'package:commerce_app/provider_model.dart';
import 'package:commerce_app/screens/listeddItemsWithFilter_screen.dart';
import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../consts.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen(
      {this.hasBack = false, this.data, Key? key, this.title = "NA"})
      : super(key: key);
  final bool hasBack;
  final data;
  final String title;

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
// with AutomaticKeepAliveClientMixin<CategoryScreen>
{
  // ignore: unused_field

  // bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // super.build(context);
    // return Navigator(onGenerateRoute: (RouteSettings settings) {
    //   return MaterialPageRoute(builder: (context) {
    return Consumer<ProviderModel>(
      builder: (context, vals, child) {
        // print("key == ${widget.key}");
        // print(widget.data);
        // return Navigator(onGenerateRoute: (RouteSettings settings) {
        //   return MaterialPageRoute(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              widget.title,
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
                              // print(widget.data.values);
                              var result;
                              Type type = widget.data.values
                                  .elementAt(index)
                                  .runtimeType;

                              // var data1 =
                              //     widget.data.values.elementAt(index);
                              // print('---> ${data1.runtimeType}');

                              type == List
                                  ? result = ListedItemsWithFilterScreen(
                                      otherBrands: widget.data,
                                      // key: ValueKey(
                                      //     widget.data!.keys.elementAt(index)),
                                      title: widget.data!.keys.elementAt(index),
                                      itemsList: (widget.data!.values
                                          .elementAt(index)),
                                    )
                                  : result = CategoryScreen(
                                      // key: ValueKey(
                                      //     widget.data!.keys.elementAt(index)),
                                      title: widget.data!.keys.elementAt(index),
                                      hasBack: true,
                                      data:
                                          widget.data!.values.elementAt(index));

                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return result;
                                },
                                // settings: RouteSettings(
                                //     name: widget.data!.keys
                                //         .elementAt(index))
                              ));
                            },
                            trailing: iconBuilder(
                                        widget.data.values.elementAt(index)) ==
                                    false
                                ? SizedBox()
                                : Icon(Icons.keyboard_arrow_right, size: 30),
                            title: Text(widget.data!.keys.elementAt(index),
                                style:
                                    itemBrandFontStyle.copyWith(fontSize: 17)),
                          ),
                        ));
                  })),
        );
        //   });
        // });
      },
    );
  }
}

iconBuilder(var currentIndexData) {
  bool result = currentIndexData.runtimeType.toString() == "_JsonMap";
  // print("==>  ${result}");
  return result;
}
