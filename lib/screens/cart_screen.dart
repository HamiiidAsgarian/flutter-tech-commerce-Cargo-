import 'package:commerce_app/consts.dart';
import 'package:commerce_app/widgets/blackroundedbutton.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Widget> testItems() {
    final List<Widget> a = [];
    for (var i = 0; i < 100; i++) {
      a.add(Container(
        padding: const EdgeInsets.symmetric(vertical: 10),

        // color: Colors.blue,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                color: Colors.grey,
                width: 90,
                height: 90,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Text(
                      "150\$",
                      style: priceFontStyle.copyWith(
                          fontSize: 18, color: Colors.black87),
                    ),
                    // SizedBox(height: 5),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Material(
                            color: Colors.black87,
                            child: InkWell(
                              onTap: () {
                                print("-");
                              },
                              child: Container(
                                width: 25,
                                height: 25,
                                child: const Center(
                                    child: Icon(Icons.remove,
                                        color: Colors.white, size: 15)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "3",
                            style: priceFontStyle.copyWith(fontSize: 15),
                          ),
                        ),
                        //////////////////////////////////////////////////////////* add botton
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Material(
                            color: Colors.black87,
                            child: InkWell(
                              onTap: () {
                                print("+");
                              },
                              child: Container(
                                width: 25,
                                height: 25,
                                child: const Center(
                                    child: Icon(Icons.add,
                                        color: Colors.white, size: 15)),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
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
        children: [
          Container(
              decoration: const BoxDecoration(
                color: Colors
                    .white, //////////////////////// * MY cart section color

                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              padding: const EdgeInsets.only(
                  left: 25, bottom: 15, top: 25, right: 25),
              // margin: EdgeInsets.only(bottom: 10),
              alignment: Alignment.topLeft,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "My Cart",
                            style: itemTitleFontStyle.copyWith(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () => Navigator.pop(context))
                        ]),
                    Text("you have 2 itrms in your cart",
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            color:
                greySearchbarBackground, //////////////////////////////////////* total price color
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Subtotal",
                      style: itemBrandFontStyle.copyWith(
                          fontSize: 14, color: Colors.black)),
                  Text("25\$",
                      style: itemBrandFontStyle.copyWith(
                          fontSize: 14, color: Colors.black)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Shopping fee",
                      style: itemBrandFontStyle.copyWith(fontSize: 13)),
                  Text("118\$",
                      style: itemBrandFontStyle.copyWith(fontSize: 13)),
                ],
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total",
                        style: itemBrandFontStyle.copyWith(
                            fontSize: 25, color: Colors.black)),
                    Text("138\$",
                        style: itemBrandFontStyle.copyWith(
                            fontSize: 18, color: Colors.black)),
                  ],
                ),
              ),
              const BlackRoundedButton(
                title: 'Submit',
              )
            ]),
          ),
        ],
      ),
    );
  }
}
