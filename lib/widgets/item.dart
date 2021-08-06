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
  final double? price;
  final double? rate;

  final double imageWidth;

  final Map data;

  Item(
      {Key? key,
      this.title,
      this.imageWidth = 130,
      this.id,
      this.imgTumbnailUrl,
      this.company,
      this.price,
      this.rate,
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
          height: 270, //* item size,
          // color: Colors.white,
          padding: EdgeInsets.symmetric(
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
                          : (Image.network(imgTumbnailUrl!,
                              loadingBuilder: (context, child, progress) {
                              return progress == null
                                  ? child
                                  : Container(
                                      color: Colors.blueGrey[900],
                                      child: Center(
                                        child: Container(
                                            width: 100,
                                            height: 100,
                                            child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(Colors.white),
                                                strokeWidth: 15,
                                                backgroundColor:
                                                    Colors.white10)),
                                      ),
                                    );
                            })),
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
                    Text(" $price \$", style: priceFontStyle),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            color: Colors.pinkAccent[400],
                            // height: 25,
                            child: Center(
                              child: Text(
                                "25% off",
                                style: priceFontStyle.copyWith(
                                    color: Colors.white, fontSize: 15),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              MyFlutterApp.star,
                              size: 15,
                              color: Colors.amber,
                            ),
                            SizedBox(width: 2),
                            Text(
                              "$rate",
                              style: priceFontStyle.copyWith(
                                  color: Colors.amber, fontSize: 15),
                            )
                          ],
                        ),
                        // Icon(MyFlutterApp.heart_2, size: 15, color: Colors.red),
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
