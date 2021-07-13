import 'package:commerce_app/provider_model.dart';
import 'package:commerce_app/screens/02_category_screen2.dart';
import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../consts.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({this.hasBack = false});
  final bool hasBack;

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
              child: FutureBuilder(
                  future: _secondPageData,
                  builder: (context, AsyncSnapshot<Map> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
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
                                      var result;
                                      var type = snapshot.data!.values
                                          .elementAt(index)
                                          .runtimeType;
                                      type == List
                                          ? result = CategoryScreenTwo(
                                              hasBack: true,
                                              data: snapshot.data!.values
                                                  .elementAt(index))
                                          : result = CategoryScreenTwo(
                                              hasBack: true,
                                              data: snapshot.data!.values
                                                  .elementAt(index));
                                      // print(
                                      //     "1: ${snapshot.data!.values.elementAt(index)}");

                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return result;
                                      }));
                                    },
                                    trailing: const Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 30),
                                    title: Text(
                                        snapshot.data!.keys.elementAt(index),
                                        style: itemBrandFontStyle.copyWith(
                                            fontSize: 17)),
                                  ),
                                ));
                          });
                    }
                    return CircularProgressIndicator();
                  }),
            ),
          );
        });
      });
    });
  }
}

////////////////
class TestPage extends StatelessWidget {
  TestPage({this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color!,
      child: Center(
          child: TextButton(
              onPressed: () => Navigator.pop(context), child: Text("a"))),
    );
  }
}
