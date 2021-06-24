import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:commerce_app/widgets/blackroundedbutton.dart';
import 'package:commerce_app/widgets/appbar.dart';
import 'package:flutter/material.dart';

import '../consts.dart';

class ItemDetailScreen extends StatefulWidget {
  const ItemDetailScreen({this.title});

  final String? title;

  @override
  _ItemDetailScreenState createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  @override
  Widget build(BuildContext context) {
    // print(widget.title);

    return Scaffold(
        // bottomNavigationBar: MyBottomNavigationBar(),
        appBar: MyAppBar(
          leadingIcon: const Icon(
            MyFlutterApp.left_open,
            // MdiIcons.walletPlusOutline,
            color: appBargrey,
          ),
          leadingIconFunction: () {
            Navigator.pushNamed(context, "/");
          },
        ),
        body: Column(
          children: [
            Expanded(
                flex: 6,
                child: Container(
                  color: Colors.yellow
                      .withOpacity(0), //////////* little radious color fade
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    child: Stack(children: [
                      PageView(
                        children: <Widget>[
                          Container(
                            color: Colors.pink,
                          ),
                          Container(
                            color: Colors.cyan,
                          ),
                          Container(
                            color: Colors.deepPurple,
                          ),
                        ],
                      ),
                      Align(
                        alignment: const Alignment(0, 0.9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: CircleAvatar(
                                  radius: 7,
                                  backgroundColor:
                                      Colors.white.withOpacity(0.5)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: CircleAvatar(
                                  radius: 7,
                                  backgroundColor:
                                      Colors.white.withOpacity(0.5)),
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                )),
            Expanded(
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              color: Colors.white,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("Classical hoodies",
                                style: forMenFontStyle.copyWith(
                                    color: Colors.black)),
                            const SizedBox(width: 5),
                            const Icon(
                              MyFlutterApp.star_3,
                              size: 10,
                              color: Colors.yellow,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "4.7",
                              style: priceFontStyle.copyWith(fontSize: 12),
                            )
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(MyFlutterApp.share_alt),
                            SizedBox(width: 25),
                            Icon(MyFlutterApp.heart_empty),
                          ],
                        )
                      ],
                    ),
                    const Text("boomstack", style: itemTitleFontStyle)
                  ]),
            )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Describtin",
                        style: itemBrandFontStyle.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Colors.black)),
                    const Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          "The definition of a description is a statement that gives details about someone or something. An example of description is a story about the places visited on a family trip. ... Published a description of the journey; gave a vivid description of the game.The definition of a description is a statement that gives details about someone or something. An example of description is a story about the places visited on a family trip. ... Published a description of the journey; gave a vivid description of the game.",
                          // overflow: TextOverflow.ellipsis
                          style: itemBrandFontStyle,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("Colors:",
                                  style: priceFontStyle.copyWith(
                                      color: Colors.black)),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(left: 7),
                                    child: const CircleAvatar(
                                      radius: 12.5,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 7),
                                    child: CircleAvatar(
                                      radius: 12.5,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Price:",
                                  style: priceFontStyle.copyWith(
                                      color: Colors.black)),
                              Text("75.00\$",
                                  style: priceFontStyle.copyWith(
                                      color: Colors.black,
                                      fontSize: 25,
                                      height: 1)),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      const BlackRoundedButton(
                        title: 'Add to basket',
                      )
                    ],
                  ),
                ))
          ],
        ));
  }
}
