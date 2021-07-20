import 'package:commerce_app/screens/search_limit_screen.dart';
import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:commerce_app/widgets/appbar.dart';
import 'package:commerce_app/widgets/item.dart';
import 'package:flutter/material.dart';

import '../consts.dart';

class ListedItemsWithFilterScreen extends StatefulWidget {
  ListedItemsWithFilterScreen(
      {Key? key, this.title, this.itemsList, this.otherBrands})
      : super(key: key);

  final String? title;

  final List<dynamic>? itemsList;
  final Map? otherBrands;

  @override
  _ListedItemsWithFilterScreenState createState() =>
      _ListedItemsWithFilterScreenState();
}

class _ListedItemsWithFilterScreenState
    extends State<ListedItemsWithFilterScreen> {
  late List data;
  @override
  void initState() {
    super.initState();
    data = widget.itemsList ?? [];
  }

  Filter myFilter = new Filter();
  List filterData = [];
  @override
  Widget build(BuildContext context) {
    filterData = myFilter.filteredList(data);
    print(widget.itemsList);
    print(
        "0- ${myFilter.statusFilter} , ${myFilter.maximumFilter} , ${myFilter.minimumFilter} ");
    print(data);
    return Scaffold(
        backgroundColor: cBackgroundGrey,
        appBar: MyAppBar(
          title: Text(
            this.widget.title ?? "",
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
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Divider(
            height: 1,
            color: cBackgroundGrey,
          ),
          FilterAndSortSection(
            sliderMin: myFilter.minimumFilter ?? 10,
            sliderMax: myFilter.maximumFilter ?? 400,
            statusCheck: myFilter.statusFilter ?? false,
            //NOTE filter
            data: data,
            function: (List e) {
              setState(() {
                // data = res;
                myFilter.minimumFilter = e[0];
                myFilter.maximumFilter = e[1];
                myFilter.statusFilter = e[2];

                filterData = myFilter.filteredList(data);
              });
              // });
              //NOTE 1
              // print(e);
            },
          ),
          const SizedBox(height: 7),
          OtherBrandsSection(
              currentTitle: widget.title,
              data: widget.otherBrands,
              function: () {}),
          const SizedBox(height: 7),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            child: Row(
                children: myFilter.Activefilters()
                    .map((e) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: MaterialButton(
                              color: Colors.red,
                              minWidth: 5,
                              // constraints: ,
                              // elevation: 0,
                              // fillColor: Colors.amber,
                              onPressed: () {
                                setState(() {
                                  switch (e.keys.first) {
                                    case ("Brand"):
                                      myFilter.brandFilter = null;
                                      break;
                                    case ("Max"):
                                      myFilter.maximumFilter = null;
                                      break;
                                    case ("Min"):
                                      myFilter..minimumFilter = null;
                                      break;
                                    case ("Present"):
                                      myFilter.statusFilter = null;
                                      break;
                                    case ("SortType"):
                                      myFilter.sortTypeFilter = null;
                                      break;
                                  }
                                });
                              },
                              // padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(children: [
                                Text(
                                    "${e.keys.first} : ${e.values.first}", //NOTE herez
                                    style: itemTitleFontStyle.copyWith(
                                        fontSize: 14, color: Colors.white)),
                                Icon(Icons.close,
                                    size: 15, color: Colors.white),
                              ]),
                            ),
                          ),
                        ))
                    .toList()),
          ),
          const SizedBox(height: 7),
          BrandItemsList(itemsList: filterData)

          // BrandItemsList(itemsList: myFilter.filteredList(data))
        ]));
  }
}

class BrandItemsList extends StatelessWidget {
  const BrandItemsList({Key? key, required this.itemsList}) : super(key: key);
  final List<dynamic> itemsList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal:
                10), //NOTE for the positioning beginning and ending of items
        child: Wrap(
          children: itemsList
              .map<Widget>((data) => Container(
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
                          price: data['price'],
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
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////
class OtherBrandsSection extends StatelessWidget {
  const OtherBrandsSection(
      {this.data, required this.function, this.currentTitle});

  final Map? data;
  final Function function;
  final String? currentTitle;

  @override
  Widget build(BuildContext context) {
    // List OtherBrandsTitles = [];
    // List OtherBrandsvalue = [];
    List<Widget> test = [];

    //NOTE making otherBrands
    data!.forEach((key, value) {
      // print("key:$key  == value:$value");
      if (value.runtimeType == List && key != currentTitle)
        test.add(Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.5, vertical: 5),
          child: Container(
            //   width: 5,

            decoration: BoxDecoration(
              // color: Colors.red,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
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
                          builder: (context) => ListedItemsWithFilterScreen(
                              itemsList: value,
                              title: key,
                              otherBrands: data)));
                  // function(value);
                }

                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) =>
                //             ListedItemsWithFilterScreen(title: e)));
                ,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(key,
                      style: itemBrandFontStyle.copyWith(
                          fontWeight: FontWeight.w600)),
                ),
              ),
            ),
          ),
        ));
      // OtherBrandsTitles.add(key);
      // OtherBrandsvalue.add(value);
    });

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
              child: ListView(scrollDirection: Axis.horizontal, children: test))
        ],
      ),
    );
  }
}

class FilterAndSortSection extends StatelessWidget {
  FilterAndSortSection(
      {this.data,
      required this.function,
      this.sliderMin,
      this.sliderMax,
      this.statusCheck});
  final List? data;
  final Function function;

  final int? sliderMin;
  final int? sliderMax;
  final bool? statusCheck;

  @override
  Widget build(BuildContext context) {
    // print("0 filter => $data");
    return Container(
      //NOTE Filter and sort Section
      padding: const EdgeInsets.symmetric(vertical: 5),
      color: Colors.white,
      child: Row(children: [
        Expanded(
          child: TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchLimitScreen(
                    sliderMin: sliderMin!,
                    slidermax: sliderMax!,
                    statusCheckValue: statusCheck!,
                    data: data,
                    function: function); //NOTE 00 - search limit func
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
                    color: Colors.black,
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
//NOTE filter class
class Filter {
  // List<dynamic> _data = [];
  String? brandFilter;
  int? minimumFilter;
  int? maximumFilter;
  bool? statusFilter;
  String? sortTypeFilter;

  Filter(
      {this.brandFilter,
      this.maximumFilter,
      this.minimumFilter,
      this.statusFilter,
      this.sortTypeFilter});

  // List<Map> get dataGet => _data;
  // void set dataSet(List<Map> newData) {
  //   _data = newData;
  // }

  List<Map<String, dynamic>> Activefilters() {
    var filters = [
      {"Brand": brandFilter, 'calssParameterName': 'brandFilter'},
      {"Max": maximumFilter, 'calssParameterName': 'maximumFilter'},
      {"Min": minimumFilter, 'calssParameterName': 'minimumFilter'},
      {"Present": statusFilter, 'calssParameterName': 'statusFilter'},
      {"SortType": sortTypeFilter, 'calssParameterName': 'sortTypeFilter'}
    ];
    List<Map<String, dynamic>> result = [];
    filters.forEach((element) {
      if ((element.values.first != null) && (element.values.first != false))
        result.add(element);
    });
    // print(result);
    return result;
  }

  filteredList(List data) {
    List result = data;
    print("0- input $result");
    print("1- $statusFilter , $maximumFilter , $minimumFilter ");
    if (statusFilter == true) {
      var status = [];
      for (Map item in result) {
        if (item['status'] == 'open') {
          // print("${item['id']} == open");

          // print(item['price']);
          // print("------------------");
          status.add(item);
          result = status;
        } else
          result.remove(item);
      }
    } else
      this.statusFilter = null;
    ;

    if (minimumFilter != null) {
      var min = [];
      for (Map item in result) {
        if (item['id'] > minimumFilter) {
          // print("${item['price']} >= $minimumFilter");

          // print(item['price']);
          // print("------------------");
          min.add(item);
          result = min;
        }
      }
    }
    ;
    if (maximumFilter != null) {
      var max = [];
      for (Map item in result) {
        if (item['price'] < maximumFilter) {
          // print("${item['id']} <= $maximumFilter");

          // print(item['price']);
          // print("------------------");
          max.add(item);
          result = max;
        } else
          result.remove(item);
      }
    }
    ;
    print("3-output $result");

    return result;
  }
}
