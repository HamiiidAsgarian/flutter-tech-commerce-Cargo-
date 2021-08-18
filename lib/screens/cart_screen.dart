import 'dart:io';

import 'package:commerce_app/consts.dart';
import 'package:commerce_app/provider_model.dart';
import 'package:commerce_app/widgets/blackroundedbutton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CartScreen extends StatelessWidget {
  List<Widget> testItems(
      List itemsList, Function discartFunction, Function countChange, context) {
    var b = [];
    final List<Widget> a = [];
    for (var i = 0; i < itemsList.length; i++) {
      if (!b.contains(itemsList[i])) {
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
                  child: Image.network(itemsList[i]['thumbnail'],
                      fit: BoxFit.fill),
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
                        itemsList[i]['title'],
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        softWrap: false,
                        style: itemBrandFontStyle.copyWith(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "${itemsList[i]['price'].toString()} \$",
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
                                  countChange(itemsList[i], '-');
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
                              itemsList[i]['count'].toString(),
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
                                  countChange(itemsList[i], '+');
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            duration: Duration(milliseconds: 900),
                            backgroundColor: Colors.redAccent[700],
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Item has been added to cart.",
                                    style: itemBrandFontStyle.copyWith(
                                        color: Colors.white, fontSize: 15))
                              ],
                            )),
                      );
                      return discartFunction(itemsList[i]);
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
    }
    return a;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderModel>(builder: (context, val, child) {
      return Scaffold(
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
                      Text(
                          "you have ${val.cartItems.length} itrms in your cart",
                          style: itemTitleFontStyle.copyWith(
                              fontSize: 11, fontWeight: FontWeight.w500)),
                    ])),
            const Divider(height: 1),
            Expanded(
              //////////////////////////////////////////////* items
              flex: 13,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: ListView(
                      children: testItems(val.cartItems, (e) {
                    val.discartItem(e);
                  }, (element, operation) {
                    val.countChange(element, operation);
                  }, context))),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              color:
                  greySearchbarBackground, //////////////////////////////////////* total price color
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Subtotal",
                        style: itemBrandFontStyle.copyWith(
                            fontSize: 14, color: Colors.black)),
                    Text("${val.totalPriceNumber.toStringAsFixed(2)} \$",
                        style: itemBrandFontStyle.copyWith(
                            fontSize: 14, color: Colors.black)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Shopping fee",
                        style: itemBrandFontStyle.copyWith(fontSize: 13)),
                    Text("${(val.totalPriceFee).toStringAsFixed(2)} \$",
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
                      Text(
                          "${(val.totalPriceNumber - val.totalPriceFee).toStringAsFixed(2)} \$",
                          style: itemBrandFontStyle.copyWith(
                              fontSize: 18, color: Colors.black)),
                    ],
                  ),
                ),
                BlackRoundedButton(
                  function: () async {
                    // if (kIsWeb) {
                    //   js.context.callMethod('open',
                    //       ['https://github.com/HamiiidAsgarian']);
                    //   print("platform is windows");
                    // } else
                    if (Platform.isAndroid) {
                      const url = 'https://github.com/HamiiidAsgarian';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }
                  },
                  title: 'Submit',
                )
              ]),
            ),
          ],
        ),
      );
    });
  }
}
