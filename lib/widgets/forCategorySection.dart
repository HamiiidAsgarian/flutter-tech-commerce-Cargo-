import 'package:commerce_app/screens/itemDetailScreen.dart';
import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';

import '../consts.dart';

class ForCategorySection extends StatelessWidget {
  const ForCategorySection({Key? key, this.sectionTitle}) : super(key: key);
  final String? sectionTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        //////////*For men section
        color: Colors.white, //////////////////////////* section back color
        height: 240,
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/ListedItems");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    this.sectionTitle != null ? this.sectionTitle! : "",
                    style: forMenFontStyle,
                  ),
                  Row(
                    children: [
                      Text(
                        "View More",
                        style: viewMoreFontStyle,
                      ),
                      Icon(
                        MyFlutterApp.right_open,
                        size: 13,
                        color: appBargrey,
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                color: Colors.white //////////////////////* list view fill color
                ,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Item(title: "${this.sectionTitle}1"),
                    Item(title: "${this.sectionTitle}2"),
                    Item(title: "${this.sectionTitle}3"),
                    Item(title: "${this.sectionTitle}4"),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

////////////////////////////////////////////////////////////* items
class Item extends StatelessWidget {
  final String? title;

  const Item({Key? key, this.title}) : super(key: key);

  Future<Widget> loadimage(url) async {
    var a = Image.network(url);
    return a;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        print(this.title);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ItemDetailScreen(title: this.title)));
      },
      child: Container(
        width: 130,
        margin: EdgeInsets.only(right: 20),
        // padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        color: Colors
            .white, //////////////////////////////////////////* item main frame
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Hero(
                  tag: this.title!,
                  child: Container(
                    // height: 90,
                    // width: 90,
                    color: Colors.amber,
                    // decoration: BoxDecoration(
                    //   image: DecorationImage(
                    //     image: NetworkImage(
                    //         "https://i.picsum.photos/id/77/200/300.jpg?grayscale&hmac=0XOpv5k16oN2OIdXA51RRwpKHuMnidcPYoVk6X5iUaI"),
                    //     //whatever image you can put here
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),

                Text(
                  "${this.title != null ? this.title : ""} Classical",
                  style: itemTitleFontStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                Text("Boomerage", style: itemBrandFontStyle),
                // SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("\$250.00", style: priceFontStyle),
                    Icon(MyFlutterApp.heart_2, size: 15)
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
