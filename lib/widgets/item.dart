import 'package:commerce_app/consts.dart';
// import 'package:commerce_app/models/api_first_page_model.dart';
import 'package:commerce_app/screens/itemdetail_screen.dart';
import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final int? id;
  final String? imgTumbnailUrl;
  final String? imgUrl;

  final String? title;
  final String? company;
  final int? price;

  final double imageWidth;

  final Map data;

  const Item(
      {Key? key,
      this.title,
      this.imageWidth = 130,
      this.id,
      this.imgTumbnailUrl,
      this.company,
      this.price,
      this.imgUrl,
      required this.data})
      : super(key: key);

  // Future<Widget> loadimage(String url) async {
  //   final a = Image.network(url);
  //   return a;
  // }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      child: RawMaterialButton(
        fillColor: Colors.white,
        splashColor: cBackgroundGrey.withOpacity(1),
        onPressed: () {
          // print(title);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemDetailScreen(
                        title: " h ",
                        data: data,
                      )));
        },
        child: Container(
          // color: Colors.white,
          padding: const EdgeInsets.symmetric(
              horizontal: 7, vertical: 7), //NOTE Item main margin
          child: Container(
            padding: const EdgeInsets.all(5),
            width: imageWidth,
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
                  height: imageWidth,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    //NOTE Image border
                    child: Container(
                      // color: Colors.amber,
                      child: (imgTumbnailUrl == "" || imgTumbnailUrl == null)
                          ? Center(child: CircularProgressIndicator())
                          : (Image.network(imgTumbnailUrl!)),
                      // (Image.network(imgTumbnailUrl)) ?? Container(),
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
                const SizedBox(
                    height:
                        5), ////////////////////////////* image and title gap
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${title ?? ""} ",
                      style: itemTitleFontStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(company.toString(),
                        style:
                            itemBrandFontStyle), // NOTE changed from company ?? ""
                    // SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text("\$250.00", style: priceFontStyle),
                        Icon(MyFlutterApp.heart_2, size: 15)
                      ],
                    ),
                    const SizedBox(
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
