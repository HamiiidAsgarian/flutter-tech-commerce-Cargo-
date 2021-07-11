import 'package:commerce_app/provider_model.dart';
import 'package:commerce_app/screens/listeddItems_screen.dart';
import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../consts.dart';

class CategoryScreenTwo extends StatefulWidget {
  const CategoryScreenTwo({this.hasBack = false, this.data});
  final bool hasBack;
  final data;

  @override
  _CategoryScreenTwoState createState() => _CategoryScreenTwoState();
}

class _CategoryScreenTwoState extends State<CategoryScreenTwo> {
  var _secondPageData;
  @override
  void initState() {
    super.initState();

    _secondPageData = Provider.of<ProviderModel>(context,
            listen:
                false) //NOTE maybe better to delete this and pass it to provider totally
        .getDataFromApi(url: "http://localhost:3000/secondPage");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderModel>(builder: (context, vals, child) {
      return Navigator(onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
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
                  print("object");
                },
                child: ListView.builder(
                    itemCount: widget.data.length,
                    itemBuilder: (context, index) {
                      // print(snapshot.data!.values.elementAt(index));
                      return Container(
                          height: 60,
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 0.1, color: Colors.grey))),
                          child: Center(
                            child: ListTile(
                              onTap: () {
                                CategoryScreenTwo result;
                                var type = widget.data.values
                                    .elementAt(index)
                                    .runtimeType;
                                type == List
                                    ? result = CategoryScreenTwo(hasBack: false)
                                    : result = CategoryScreenTwo(hasBack: true);

                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return result;
                                }));
                              },
                              trailing: const Icon(Icons.keyboard_arrow_right,
                                  size: 30),
                              title: Text(widget.data.keys.elementAt(index),
                                  style: itemBrandFontStyle.copyWith(
                                      fontSize: 17)),
                            ),
                          ));
                    })),
          );
        });
      });
    });
  }
}
