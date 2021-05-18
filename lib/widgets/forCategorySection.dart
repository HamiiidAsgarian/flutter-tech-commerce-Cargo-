import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';

import '../consts.dart';

class ForCategorySection extends StatelessWidget {
  const ForCategorySection({
    Key? key,
  }) : super(key: key);

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "For Men",
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
            SizedBox(height: 10),
            Expanded(
              child: Container(
                color: Colors.white //////////////////////* list view fill color
                ,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [Item(), Item(), Item(), Item()],
                ),
              ),
            ),
          ],
        ));
  }
}

class Item extends StatelessWidget {
  const Item({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      margin: EdgeInsets.only(right: 20),
      // padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      color: Colors
          .white, //////////////////////////////////////////* item main frame
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              color: Colors.blueGrey[900],
              height: 130,
              // width: 130,
            ),
          ),
          SizedBox(height: 5),

          Text("Classical Hoddie", style: itemTitleFontStyle),
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
      ),
    );
  }
}
