import 'package:commerce_app/screens/search_limit_screen.dart';
import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:commerce_app/widgets/appbar.dart';
import 'package:commerce_app/widgets/item.dart';
import 'package:flutter/material.dart';

import '../consts.dart';

class ListedItemsScreen extends StatelessWidget {
  ListedItemsScreen({this.title, this.itemsList, Key? key}) : super(key: key);

  final String? title;

  final List<dynamic>? itemsList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: cBackgroundGrey,
        appBar: MyAppBar(
          title: Text(
            title!,
            style: itemBrandFontStyle.copyWith(fontSize: 20),
          ),
          leadingIcon: const Icon(
            MyFlutterApp.left_open,
            // MdiIcons.walletPlusOutline,
            color: appBargrey,
          ),
          leadingIconFunction: () {
            Navigator.pop(context);
          },
        ),
        body: Column(children: [
          Divider(
            height: 1,
            color: cBackgroundGrey,
          ),
          // const FilterAndSortSection(),
          // const SizedBox(height: 7),
          // const OtherBrandsSection(),
          const SizedBox(height: 7),
          BrandItemsList(itemsList: itemsList!)
        ]));
  }
}

class BrandItemsList extends StatelessWidget {
  const BrandItemsList({Key? key, required this.itemsList}) : super(key: key);
  final List<dynamic> itemsList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        // crossAxisSpacing: 20, // Left and right spacing between Widget
        // mainAxisSpacing: 10, //upper and lower spacing
        padding: EdgeInsets.symmetric(horizontal: 10),
        crossAxisCount: 2, //The number of Widgets in each row
        childAspectRatio: .65, //The ratio of width to height
        shrinkWrap: true,
        children: itemsList
            .map<Widget>((data) => Container(
                  // height: 200,
                  // width: 20,
                  // color: Colors.amber,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      color: Colors.white,
                      // width:
                      //     (MediaQuery.of(context).size.width / 2) - 5,
                      child: Item(
                        id: data['id'],
                        title: data['title'],
                        company: data['company'],
                        price: data['price'].toDouble(),
                        imgTumbnailUrl: data['thumbnail'],
                        imgUrl: "data['imageUrl']",
                        imageWidth:
                            (MediaQuery.of(context).size.width / 2) - 34,
                        data: data,
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
      // ),
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////
class OtherBrandsSection extends StatelessWidget {
  const OtherBrandsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(), //NOTE section margin
      // color: Colors.amber,
      // padding: EdgeInsets.symmetric(horizontal: 25),
      height: 40,
      // color: Colors.yellowAccent,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 25),
          Text("Other brands",
              style: itemBrandFontStyle.copyWith(fontSize: 15)),
          const SizedBox(width: 7),
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: ['Aftabe', 'ven', 'Adorabamma', 'Puma', 'S']
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 2.5, vertical: 5),
                      child: Container(
                        //   width: 5,

                        decoration: BoxDecoration(
                          // color: Colors.red,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: cBorderGrey),
                        ),
                        height: 30,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: RawMaterialButton(
                            fillColor: Colors.white,
                            constraints: BoxConstraints(minWidth: 50),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ListedItemsScreen(title: e)));
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(e,
                                  style: itemBrandFontStyle.copyWith(
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ))
        ],
      ),
    );
  }
}

class FilterAndSortSection extends StatelessWidget {
  const FilterAndSortSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //NOTE Filter and sort Section
      padding: const EdgeInsets.symmetric(vertical: 5),
      color: Colors.white,
      child: Row(children: [
        Expanded(
          child: TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchLimitScreen(function: () {
                  print("from FilterAndSortSection/listed items");
                });
              }));
            },
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(
                Icons.filter_list,
                size: 25,
                color: appBargrey,
              ),
              const SizedBox(width: 5),
              Text("Filter", style: itemTitleFontStyle.copyWith(fontSize: 18))
            ]),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {
              sortPopup(context);
            },
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(
                Icons.sort,
                size: 25,
                color: appBargrey,
              ),
              const SizedBox(width: 5),
              Text("Sort", style: itemTitleFontStyle.copyWith(fontSize: 18))
            ]),
          ),
        ),
      ]),
    );
  }
}

//////////////////////////////////////////////////////

void sortPopup(BuildContext context) {
  {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Container(
                //NOTE: popup sort height
                height: MediaQuery.of(context).size.height / 2,
                color: Colors.white,
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    color: Colors.black, //NOTE Title section color
                    child: ListTile(
                      // tileColor: Colors.amber,
                      title: Align(
                        alignment: Alignment(0.3, 0),
                        child: Text("Sort",
                            style: itemBrandFontStyle.copyWith(
                                fontSize: 25, color: Colors.white)),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.cancel,
                              size: 30, color: Colors.white)),
                    ),
                  ),
                  const Divider(height: 0),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 10),
                          PopupItem(text: "highest Value"),
                          PopupItem(text: "Lowestt Value"),
                          PopupItem(text: "Lowestt Value"),
                          PopupItem(text: "Lowestt Value"),
                          PopupItem(text: "Lowestt Value"),
                        ],
                      ),
                    ),
                  )
                ]),
              ));
        });
  }
}

class PopupItem extends StatelessWidget {
  final String? text;
  const PopupItem({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        print("object");
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        // height: 50,
        // color: Colors.amber,
        child: Center(
            child: Text(this.text ?? 'no text',
                style: itemBrandFontStyle.copyWith(fontSize: 25))),
      ),
    );
  }
}

//////////////////////////////////////////////////
