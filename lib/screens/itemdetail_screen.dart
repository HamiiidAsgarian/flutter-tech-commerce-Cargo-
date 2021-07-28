import 'package:commerce_app/provider_model.dart';
import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:commerce_app/widgets/blackroundedbutton.dart';
// import 'package:commerce_app/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../consts.dart';

class ItemDetailScreen extends StatefulWidget {
  final String? title;
  final Map? data;
  ItemDetailScreen({this.title, this.data});

  @override
  _ItemDetailScreenState createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  @override
  Widget build(BuildContext context) {
    // print(widget.title);

    return Scaffold(
        // bottomNavigationBar: MyBottomNavigationBar(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              color: Colors.black,
              icon: Icon(Icons.arrow_back_ios_outlined),
              onPressed: () => Navigator.pop(context)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ItemsSlideView(images: (widget.data?['imageUrl'])),
              SizedBox(height: 20),
              ItemTitle(
                  title: (widget.data?['title']) ?? "NO TITLE",
                  score: widget.data?['rate'],
                  company: widget.data?['company']),
              ItemDescription(
                  description: (widget.data?['description']) ?? "NO TITLE"),
              SizedBox(height: 10),
              ItemFooter(
                price: widget.data?['price'],
                data: widget.data!,
              )
            ],
          ),
        ));
  }
}

class ItemFooter extends StatelessWidget {
  const ItemFooter({this.price, required this.data});

  final double? price;
  final Map data;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderModel>(builder: (context, vals, child) {
////

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Colors:",
                        style: priceFontStyle.copyWith(color: Colors.black)),
                    SizedBox(height: 10),
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
                    Text("$price\$",
                        style: priceFontStyle.copyWith(
                            color: Colors.black, fontSize: 25, height: 1)),
                    // Text("75.00\$",
                    //     style: priceFontStyle.copyWith(
                    //         color: Colors.black, fontSize: 25, height: 1)),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            BlackRoundedButton(
              function: () {
                vals.addToCartList(data);
                // print(vals.cartItems);
              },
              title: 'Add to basket',
            ),
            const SizedBox(height: 25),
          ],
        ),
      );
    });
  }
}

class ItemDescription extends StatelessWidget {
  const ItemDescription({this.description});

  final String? description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Describtin",
              style: itemBrandFontStyle.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Colors.black)),
          Text(
            description ?? "NO DESCRIPTION",
            // overflow: TextOverflow.ellipsis
            style: itemBrandFontStyle,
          ),
        ],
      ),
    );
  }
}

class ItemTitle extends StatelessWidget {
  final String? title;
  final String? company;
  final double? score;

  const ItemTitle({this.title, tite, this.company, this.score});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      // color: Colors.white,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(title ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                forMenFontStyle.copyWith(color: Colors.black)),
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        MyFlutterApp.star_3,
                        size: 10,
                        color: Colors.yellow,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        score.toString(),
                        style: priceFontStyle.copyWith(fontSize: 12),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Row(
                  children: const [
                    Icon(MyFlutterApp.share_alt),
                    SizedBox(width: 25),
                    Icon(MyFlutterApp.heart_empty),
                  ],
                )
              ],
            ),
            Text(company ?? "NA", style: itemTitleFontStyle)
          ]),
    );
  }
}

class ItemsSlideView extends StatefulWidget {
  const ItemsSlideView({this.images});

  final List<dynamic>? images;

  @override
  _ItemsSlideViewState createState() => _ItemsSlideViewState();
}

class _ItemsSlideViewState extends State<ItemsSlideView> {
  int imageIndex = 0;
  dotMaker(List<dynamic> images) {
    List<Widget> dots = [];

    for (var i = 0; i < images.length; i++) {
      dots.add(
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: CircleAvatar(
              radius: 7,
              backgroundColor: i == imageIndex
                  ? Colors.black.withOpacity(0.5)
                  : Colors.grey.withOpacity(0.5)),
        ),
      );
    }

    return dots;
  }

  //
  List<Widget> imagesBuilder(List images) {
    List<Widget> imagesList = [];
    for (var item in images) {
      imagesList.add(Image.network(item));
    }
    return imagesList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, //NOTE page view background color
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: Stack(children: [
            PageView(
              onPageChanged: (index) {
                setState(() {
                  imageIndex = index;
                });
              },
              children: imagesBuilder(widget.images ?? []),
            ),
            Align(
              alignment: const Alignment(0, 0.9),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: dotMaker(widget.images ?? [])

                  //  [
                  //   Padding(
                  //     padding: const EdgeInsets.only(right: 5),
                  //     child: CircleAvatar(
                  //         radius: 7,
                  //         backgroundColor: Colors.white.withOpacity(0.5)),
                  //   ),
                  //   Padding(
                  //     padding: const EdgeInsets.only(right: 5),
                  //     child: CircleAvatar(
                  //         radius: 7,
                  //         backgroundColor: Colors.white.withOpacity(0.5)),
                  //   ),
                  // ],
                  ),
            )
          ]),
        ),
      ),
    );
  }
}
