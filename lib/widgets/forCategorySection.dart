import 'package:commerce_app/consts.dart';
import 'package:commerce_app/screens/listeddItems_screen.dart';
// import 'package:commerce_app/http_classed.dart';
import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:commerce_app/widgets/item.dart';
import 'package:flutter/cupertino.dart';
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
class RowListedItems extends StatefulWidget {
  RowListedItems({
    this.itemsList,
    this.margin = const EdgeInsets.all(0),
  });
  final List? itemsList;
  final EdgeInsets margin;

  @override
  _RowListedItemsState createState() => _RowListedItemsState();
}

class _RowListedItemsState extends State<RowListedItems> {
  List _mylist = [];
  int _ListLimit = 3;

  ScrollController _itemsScrollController = new ScrollController();

  @override
  void initState() {
    super.initState();

    _mylist = List.generate(3, (i) => widget.itemsList![i]);
    // setState(() {});

    // int totalListItems = widget.itemsList.length;
    _itemsScrollController.addListener(() {
      if (_itemsScrollController.position.pixels ==
          _itemsScrollController.position.maxScrollExtent) {
        setState(() {
          if (_ListLimit < widget.itemsList!.length) {
            for (int i = _ListLimit; i < _ListLimit + 3; i++) {
              _mylist.add(widget.itemsList![i]);
            }
            _ListLimit = _ListLimit + 3;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 270,
        child: ListView.builder(
            controller: _itemsScrollController,
            scrollDirection: Axis.horizontal,
            itemCount: _ListLimit + 1 <= widget.itemsList!.length
                ? _ListLimit + 1
                : _ListLimit,
            itemBuilder: (cotext, index) {
              if (index == _mylist.length &&
                  index != widget.itemsList!.length) {
                // print(
                //     "$index  ${widget.itemsList!.length} $_ListLimit"); //NOTE for showing progress indicator we creat an imaginary +1 item and indicated it as progress indicator
                return Center(child: CupertinoActivityIndicator());
              }
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Item(
                    rate: _mylist[index]['rate'].toDouble(),
                    // title: widget.itemsList![index]['title'],
                    title: _mylist[index]['title'],
                    price: _mylist[index]['price'].toDouble(),
                    company: _mylist[index]['company'],
                    id: _mylist[index]['id'],
                    imgTumbnailUrl: _mylist[index]["thumbnail"],
                    data: _mylist[index]),
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
