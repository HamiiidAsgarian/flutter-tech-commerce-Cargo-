import 'package:commerce_app/screens/listeddItems_screen.dart';
// import 'package:commerce_app/style/my_flutter_app_icons.dart';
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
            // leading: GestureDetector(
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            //   child: const Icon(
            //     MyFlutterApp.left_open,
            //     // MdiIcons.walletPlusOutline,
            //     color: appBargrey,
            //   ),
            // ),
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              print("object");
            },
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return TextButton(
                    onPressed: () {},
                    child: Container(
                        height: 60,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 0.1, color: Colors.grey))),
                        child: Center(
                          child: ListTile(
                            onTap: () => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ListedItemsScreen(
                                title: "itemss",
                              );
                            })),
                            trailing: const Icon(Icons.keyboard_arrow_right,
                                size: 30),
                            title: Text("item $index",
                                style:
                                    itemBrandFontStyle.copyWith(fontSize: 17)),
                          ),
                        )),
                  );
                }),
          ),
        );
      });
    });
  }

  // Navigator _getNavigator(BuildContext context, Widget newPage) {
  //   return new Navigator(
  //     onGenerateRoute: (RouteSettings settings) {
  //       return new MaterialPageRoute(builder: (context) {
  //         return new Center(
  //           child: new Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: <Widget>[
  //               new Text(settings.name!),
  //               new ElevatedButton(
  //                 onPressed: () => Navigator.push(context,
  //                     MaterialPageRoute(builder: (context) => newPage)),
  //                 child: new Text('Next'),
  //               ),
  //               new ElevatedButton(
  //                 onPressed: () => Navigator.pop(context),
  //                 child: new Text('Back'),
  //               ),
  //             ],
  //           ),
  //         );
  //       });
  //     },
  //   );
  // }
}
