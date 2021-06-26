import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:commerce_app/widgets/appbar.dart';
import 'package:commerce_app/widgets/carousel.dart';
import 'package:commerce_app/widgets/forCategorySection.dart';
import 'package:flutter/material.dart';

import '../consts.dart';

////////////////////////////////////////////////////////////////////////////////////* Home Screen
enum panel { carousel, rowList, windows }

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  static const List<String> data = ['men', '2', '3', '4', 'men', '2', '3', '4'];
  final List<String> fakeList5 = List.generate(5, (index) => "number $index");

  call() {
    print("object");
  }

  @override
  Widget build(BuildContext context) {
    // var a = ListView.builder(
    //   itemCount: testL.length,
    //   itemBuilder: (context, index) =>
    //       HorizontalItemsList(sectionTitle: "For men1", itemsList: testL),
    // );
    return Scaffold(
        appBar: const MyAppBar(
          leadingIcon: Icon(
            MyFlutterApp.menu,
            // MdiIcons.walletPlusOutline,
            color: appBargrey,
          ),
        ),
        body: Column(
          children: [
            Carousel(),
            HorizontalItemsList(
              sectionTitle: "1",
              itemsList: fakeList5,
            ),
            // Expanded(
            //   child: ItemsColumnMaker(itemRows: fakeList1),
            // ),
          ],
        ));
  }
}

class ItemsColumnMaker extends StatelessWidget {
  final List<String>? itemRows;
  const ItemsColumnMaker({Key? key, this.itemRows}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // cacheExtent: 500,
        scrollDirection: Axis.vertical,
        itemCount: itemRows!.length,
        itemBuilder: (context, index) => HorizontalItemsList(
              sectionTitle: itemRows![index],
              itemsList: List.generate(20, (index) => index.toString()),
            ));
  }
}
