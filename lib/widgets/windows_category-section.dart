import 'package:commerce_app/consts.dart';
import 'package:commerce_app/provider_model.dart';
// import 'package:commerce_app/screens/02_category_screen.dart';
import 'package:commerce_app/screens/listeddItems_screen.dart';
// import 'package:commerce_app/widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WindowsCategorySection extends StatelessWidget {
  final List items;
  const WindowsCategorySection({Key? key, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    windowsListMaker(List items) {
      List<Widget> windows = [];
      for (var i = 0; i < items.length; i++) {
        windows.add(ScreenWidthSizedContainer(
          imageUrl: items[i]["imageURL"],
          title: items[i]["label"],
          // data: data[items[i]['ctegory']],
          referenceTitle: items[i]['ctegory'],
        ));
      }
      return windows;
    }

    return Consumer<ProviderModel>(builder: (context, vals, child) {
      return Container(
        color: cBackgroundGrey,
        padding: const EdgeInsets.symmetric(horizontal: 10),

        ///*    15px instead of 25px because the children padding adds 10px from the sides,
        child: Wrap(children: windowsListMaker(items)),
        // FutureBuilder(
        //     future: vals.getDataFromApi(
        //         url: 'http://localhost:3000/scrollableItems'),
        //     builder: (context, AsyncSnapshot<dynamic> snapshot) {
        //       if (snapshot.hasData) {
        //         // print(snapshot.data);
        //         return Wrap(
        //           runSpacing: 0,
        //           spacing: 0,
        //           children: windowsListMaker(items, snapshot.data!),
        //         );
        //       }
        //       return CircularProgressIndicator();
        //     }),
      );
    });
  }
}

class ScreenWidthSizedContainer extends StatelessWidget {
  ScreenWidthSizedContainer(
      {this.imageUrl, this.title, this.data = const [], this.referenceTitle});
  final String? title;
  final String? imageUrl;
  final List data;
  final String? referenceTitle;
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderModel>(builder: (context, vals, child) {
      return Padding(
        padding: EdgeInsets.all(5),
        child: Container(
          height: (MediaQuery.of(context).size.width / 2) -
              20, //////////* 25px for the 25px of section padding
          width: (MediaQuery.of(context).size.width / 2) - 20,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: RawMaterialButton(
              splashColor: cBackgroundGrey.withOpacity(0.5),
              // fillColor: color,
              onPressed: () async {
                var categoryData = await vals.getDataFromApiToList(
                    url: 'http://localhost:3000/$referenceTitle');

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ListedItemsScreen(
                      title: this.referenceTitle, itemsList: categoryData);
                }));
              },

              child: Stack(children: [
                Container(
                    child: Image.network(imageUrl ?? "", fit: BoxFit.fill)),
                Align(
                  alignment: const Alignment(0, -0.7),
                  child: FittedBox(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(title ?? "",
                          textAlign: TextAlign.center,
                          style: priceFontStyle.copyWith(
                              fontSize: 17, color: Colors.white)),
                    ),
                  ),
                )
              ]),
            ),
          ),
        ),
      );
    });
  }
}
