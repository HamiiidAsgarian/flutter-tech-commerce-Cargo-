import 'package:commerce_app/consts.dart';
import 'package:commerce_app/provider_model.dart';
import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
//   _FavoriteScreenState createState() => _FavoriteScreenState();
// }

// class _FavoriteScreenState extends State<FavoriteScreen> {

  List<Widget> testItems(List favoritesList, Function addToCartFunction,
      Function removeFromCart, context) {
    final List<Widget> a = [];
    favoritesList.forEach((element) {
      a.add(Container(
        padding: const EdgeInsets.symmetric(vertical: 10),

        // color: Colors.blue,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                child: Image.network(element['thumbnail']),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      element['title'],
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      softWrap: false,
                      style: itemBrandFontStyle.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      element['company'],
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      softWrap: false,
                      style: itemBrandFontStyle.copyWith(
                        fontSize: 11,
                      ),
                    ),
                    // const SizedBox(height: 10),
                    Text(
                      "Currently ${element['status'] ?? "unavailable"}",
                      style: priceFontStyle.copyWith(
                          fontSize: 12, color: Colors.black87),
                    ),
                    Text(
                      "${element['price']} \$",
                      style: priceFontStyle.copyWith(
                          fontSize: 18, color: Colors.black87),
                    ),
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
                  child: Container(
                    color: Colors.blueAccent[700],
                    height: 30,
                    width: 30,
                    child: IconButton(
                      padding: EdgeInsets.all(0),
                      iconSize: 20,
                      icon: Icon(MyFlutterApp.cart, color: Colors.white),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(milliseconds: 600),
                            backgroundColor: Colors.blueAccent[700],
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Item has been added to the cart.",
                                  style: itemBrandFontStyle.copyWith(
                                      color: Colors.white, fontSize: 15),
                                )
                              ],
                            ),
                          ),
                        );
                        addToCartFunction(element);
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.redAccent[700],
                    height: 30,
                    width: 30,
                    child: IconButton(
                        padding: EdgeInsets.all(0),
                        iconSize: 20,
                        icon: Icon(Icons.close, color: Colors.white),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: Duration(milliseconds: 600),
                              backgroundColor: Colors.redAccent[700],
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Item has been removed from the cart.",
                                      style: itemBrandFontStyle.copyWith(
                                          color: Colors.white, fontSize: 15))
                                ],
                              ),
                            ),
                          );

                          return removeFromCart(element);
                        }),
                  ),
                ),
              ],
            )
          ],
        ),
      ));
    });

    return a;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderModel>(builder: (context, vals, child) {
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
                            Text("My Favorites",
                                style: itemTitleFontStyle.copyWith(
                                    fontSize: 20, fontWeight: FontWeight.w700)),
                            IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  Navigator.pop(context);
                                })
                          ]),
                      Text(
                          "you have ${vals.favoriteItems.length} itrms in your Favorites",
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
                    children: testItems(
                        vals.favoriteItems,
                        (e) => vals.addToCartList(e),
                        (e) => vals.discartFavoriteItem(e),
                        context)),
              ),
            )
          ],
        ),
      );
    });
  }
}
