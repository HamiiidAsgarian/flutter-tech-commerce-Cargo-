import 'package:commerce_app/consts.dart';
import 'package:commerce_app/screens/listeddItems_screen.dart';
// import 'package:commerce_app/http_classed.dart';
import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:commerce_app/widgets/item.dart';
import 'package:flutter/material.dart';

class HorizontalItemsList extends StatelessWidget {
  HorizontalItemsList({
    this.sectionTitle,
    required this.itemsList,
    this.ListFramePadding = const EdgeInsets.all(0.0),
    this.ListItemsMargin = const EdgeInsets.all(0.0),
  });
  final String? sectionTitle;
  final List<dynamic> itemsList;
  final EdgeInsets ListFramePadding;
  final EdgeInsets ListItemsMargin;
  // final Future<List<Watches>>? productsMap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ListFramePadding,
      color: cBackgroundGrey,
      child: Column(children: [
        // SizedBox(height: 10),
        CategoryTitle(sectionTitle: sectionTitle, data: itemsList),
        Container(
          alignment: Alignment(-1.0, 0.0),
          // color: Colors.black,
          // height: 270,
          child: RowListedItems(
              itemsList: itemsList,
              margin: ListItemsMargin), //REVIEW margin is changed to 0
        ),
        SizedBox(height: 25),
      ]),
    );
  }
}

//////*********************************************************/*///////////////////////////////////////////////////////
class RowListedItems extends StatelessWidget {
  RowListedItems({this.itemsList, this.margin = const EdgeInsets.all(0)});
  final List? itemsList;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return
        //  SingleChildScrollView(
        //     scrollDirection: Axis.horizontal,
        //     child:
        Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (cotext, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Item(
                        rate: itemsList![index]['rate'].toDouble(),
                        title: itemsList![index]['title'],
                        price: itemsList![index]['price'].toDouble(),
                        company: itemsList![index]['company'],
                        id: itemsList![index]['id'],
                        imgTumbnailUrl: itemsList![index]["thumbnail"],
                        data: itemsList![index]),
                  );
                  // itemsList![index];
                }));
    // (
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: itemsList!.map((e) {
    //       // print(e.title);
    //       return Container(
    //           margin: margin,
    //           // color: Colors.red,
    //           // padding: const EdgeInsets.only(right: 0, bottom: 0, top: 0),
    //           child: Item(
    //               title: e['title'],
    //               price: e['price'].toDouble(),
    //               company: e['company'],
    //               id: e['id'],
    //               imgTumbnailUrl: e["thumbnail"],
    //               data: e));
    //     }).toList()),
    // );
  }
}

//////*********************************************************/*///////////////////////////////////////////////////////
class CategoryTitle extends StatelessWidget {
  const CategoryTitle({required this.sectionTitle, this.data});

  final String? sectionTitle;
  final List? data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          sectionTitle != null ? sectionTitle! : "NA",
          style: forMenFontStyle,
        ),
        RawMaterialButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ListedItemsScreen(
                        title: sectionTitle, itemsList: data)));
            // //.pushNamed(context, "/ListedItems");
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "View More ",
                style: viewMoreFontStyle,
                // textAlign: TextAlign.center,
              ),
              Icon(
                MyFlutterApp.right_open,
                size: 15,
                color: appBargrey,
              )
            ],
          ),
        )
      ],
    );
  }
}
