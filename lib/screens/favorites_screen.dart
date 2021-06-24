import 'package:commerce_app/consts.dart';
import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Widget> testItems() {
    final List<Widget> a = [];
    for (var i = 0; i < 20; i++) {
      a.add(Container(
        padding: const EdgeInsets.symmetric(vertical: 10),

        // color: Colors.blue,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                color: Colors.grey,
                width: 90,
                height: 90,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 1,
              ////////////////////////////////////////////* middle part of the cartitem

              // color: Colors.amber,
              child: Container(
                height: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Big hoodies",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      softWrap: false,
                      style: itemBrandFontStyle.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "150\$",
                      style: priceFontStyle.copyWith(
                          fontSize: 18, color: Colors.black87),
                    ),
                    // SizedBox(height: 5),
                    // Row(
                    //   children: [
                    //     ClipRRect(
                    //       borderRadius: BorderRadius.circular(10),
                    //       child: Material(
                    //         color: Colors.black87,
                    //         child: InkWell(
                    //           onTap: () {
                    //             print("-");
                    //           },
                    //           child: Container(
                    //             width: 25,
                    //             height: 25,
                    //             child: Center(
                    //                 child: Icon(Icons.remove,
                    //                     color: Colors.white, size: 15)),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(horizontal: 10),
                    //       child: Text(
                    //         "3",
                    //         style: priceFontStyle.copyWith(fontSize: 15),
                    //       ),
                    //     ),
                    //     //////////////////////////////////////////////////////////* add botton
                    //     ClipRRect(
                    //       borderRadius: BorderRadius.circular(10),
                    //       child: Material(
                    //         color: Colors.black87,
                    //         child: InkWell(
                    //           onTap: () {
                    //             print("+");
                    //           },
                    //           child: Container(
                    //             width: 25,
                    //             height: 25,
                    //             child: Center(
                    //                 child: Icon(Icons.add,
                    //                     color: Colors.white, size: 15)),
                    //           ),
                    //         ),
                    //       ),
                    //     )
                    //   ],
                    // )
                  ],
                ),
              ),
            ), ////////////////////////////////////////////////* remove and add to cart
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Material(
                    color: Colors.blueAccent,
                    child: InkWell(
                      onTap: () {
                        print("X");
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        child: const Center(
                            child: Padding(
                          padding: EdgeInsets.only(bottom: 7),
                          child: Icon(
                            MyFlutterApp.cart,
                            color: Colors.white,
                            size: 20,
                          ),
                        )),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Material(
                    color: Colors.red,
                    child: InkWell(
                      onTap: () {
                        print("X");
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        child: const Center(
                            child: Icon(
                          Icons.close,
                          color: Colors.white,
                        )),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ));
    }
    return a;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white, ////////////////////////* appbar color
      //   leading: GestureDetector(
      //     onTap: () {
      //       Navigator.pushNamed(context, "/");
      //     },
      //     child: Icon(
      //       MyFlutterApp.left_open,
      //       // MdiIcons.walletPlusOutline,
      //       color: appBargrey,
      //     ),
      //   ),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              decoration: const BoxDecoration(
                color: Colors
                    .white, //////////////////////// * MY cart section color

                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              padding: const EdgeInsets.only(left: 25, bottom: 15, top: 25),
              // margin: EdgeInsets.only(bottom: 10),
              alignment: Alignment.topLeft,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("My Favorites",
                        style: itemTitleFontStyle.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w700)),
                    Text("you have 2 itrms in your Favorites",
                        style: itemTitleFontStyle.copyWith(
                            fontSize: 11, fontWeight: FontWeight.w500)),
                  ])),
          const Divider(height: 1),
          Expanded(
            //////////////////////////////////////////////* items
            flex: 13,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ListView(children: testItems())),
          ),
        ],
      ),
    );
  }
}
