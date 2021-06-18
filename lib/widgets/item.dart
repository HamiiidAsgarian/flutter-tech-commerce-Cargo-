import 'package:commerce_app/consts.dart';
import 'package:commerce_app/screens/itemDetailScreen.dart';
import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String? title;
  final double imageWidth;

  const Item({Key? key, this.title, this.imageWidth = 130}) : super(key: key);

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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: Container(
            padding: EdgeInsets.all(5),
            width: this.imageWidth,
            // margin: EdgeInsets.only(right: 20),
            // padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            color: Colors
                .white, //////////////////////////////////////////* item main frame
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  ////////////////////////////////////////* item image frame
                  height: this.imageWidth,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Hero(
                      tag: this.title!,
                      child: Container(
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
                SizedBox(
                    height:
                        5), ////////////////////////////* image and title gap
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    ),
                    SizedBox(
                        height:
                            5) //////////////////////////////////////////* additional gap from buttom
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
