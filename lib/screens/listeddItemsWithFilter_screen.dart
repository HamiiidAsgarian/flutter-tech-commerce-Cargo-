import 'package:commerce_app/screens/listeddItems_screen.dart';
import 'package:commerce_app/screens/search_limit_screen.dart';
import 'package:commerce_app/style/my_flutter_app_icons.dart';
import 'package:commerce_app/widgets/appbar.dart';
// import 'package:commerce_app/widgets/item.dart';
import 'package:flutter/material.dart';

import '../consts.dart';

class ListedItemsWithFilterScreen extends StatefulWidget {
  ListedItemsWithFilterScreen(
      {Key? key, this.title = "", required this.itemsList, this.otherBrands})
      : super(key: key);

  final String title;
  final List<dynamic> itemsList;
  final Map<String, dynamic>? otherBrands;

  @override
  _ListedItemsWithFilterScreenState createState() =>
      _ListedItemsWithFilterScreenState();
}

class _ListedItemsWithFilterScreenState
    extends State<ListedItemsWithFilterScreen> {
  late List data;
  late Filter myFilter = new Filter();
  late int maxPrice;

  @override
  void initState() {
    super
        .initState(); //REVIEW  should i use direct data to data inside filter class?
    data = widget.itemsList;
    myFilter.filterdata = data;
    maxPrice = maxPriceFinder(data);
    // maxPriceFinder(data);
  }

  maxPriceFinder(List<dynamic> list) {
    List<int> a = [];
    list.forEach((element) {
      a.add(element['price'].toInt());
    });
    int res = a.reduce((curr, next) => curr > next ? curr : next);
    // print(res);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: cBackgroundGrey,
        appBar: MyAppBar(
          title: Text(
            this.widget.title,
            style: itemBrandFontStyle.copyWith(fontSize: 20),
          ),
          leadingIcon: const Icon(
            MyFlutterApp.left_open,
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
            //NOTE sending the previus written search text to the filter screen and the rest of information too
            filterText: myFilter.brandFilter ?? "",
            sliderMaxRange: maxPrice,
            sliderMax: myFilter.maximumFilter ?? maxPrice,
            sliderMin: myFilter.minimumFilter ?? 0,
            statusCheck: myFilter.statusFilter ?? false,
            data: data,
            //NOTE recieving a list of selected filters from the widget [min,max,isAvailable?,written text to search]
            function: (List e) {
              setState(() {
                myFilter.minimumFilter = e[0];
                myFilter.maximumFilter = e[1];
                myFilter.statusFilter = e[2];
                myFilter.brandFilter = e[3];
              });
            },
            //NOTE recieving a selected sorting type
            sortFunction: (String sortType) {
              setState(() {
                myFilter.sortTypeFilter = sortType;
              });
              Navigator.of(context).pop();
            },
          ),
          // const SizedBox(height: 7),
          //NOTE making a scroll list of sibling items
          widget.otherBrands != null
              ? OtherBrandsSection(
                  currentTitle: widget.title, data: widget.otherBrands!)
              : const SizedBox(),
          //NOTE making a scroll list of Chosen/Active filters
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: myFilter.Activefilters().length == 0 ? 0 : 5),
            scrollDirection: Axis.horizontal,
            child: Row(
                children: myFilter.Activefilters()
                    .map((e) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.5),
                          child: RawMaterialButton(
                            elevation: 0,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,

                            constraints: BoxConstraints(minHeight: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            fillColor: Colors.amberAccent[700],
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            // color: Colors.red,
                            // minWidth: 5,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                //NOTE making the visualized filters witch with taping on the Filter its value turns to null to deActivate the filter
                                children: [
                                  Text("${e.keys.first} : ${e.values.first}",
                                      style: itemTitleFontStyle.copyWith(
                                          fontSize: 14, color: Colors.white)),
                                  Icon(Icons.close,
                                      size: 15, color: Colors.white),
                                ]),
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
                          ),
                        ))
                    .toList()),
          ),
          // const SizedBox(height: 7),
          BrandItemsList(itemsList: myFilter.filterHandler()),
          //NOTE making Listed items with filter(if is on)
          // BrandItemsList(itemsList: myFilter.filterHandler()),
        ]));
  }
}

////////////////////////////////////////////////////////////////////////////////////*BrandItemsList
// class BrandItemsList extends StatelessWidget {
//   const BrandItemsList({required this.itemsList});
//   final List<dynamic> itemsList;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: SingleChildScrollView(
//         padding: EdgeInsets.symmetric(horizontal: 10),
//         child: Wrap(
//           children: itemsList
//               .map<Widget>((data) => Container(
//                     // color: Colors.amber,
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(5),
//                       child: Container(
//                         color: Colors.white,
//                         child: Item(
//                           id: data['id'],
//                           title: data['title'],
//                           company: data['company'],
//                           price: data['price'].toDouble(),
//                           imgTumbnailUrl: data['thumbnail'],
//                           imgUrl: "data['imageUrl']",
//                           imageWidth:
//                               (MediaQuery.of(context).size.width / 2) - 34,
//                           data: data,
//                         ),
//                       ),
//                     ),
//                   ))
//               .toList(),
//         ),
//       ),
//     );
//   }
// }

////////////////////////////////////////////////////////////////////////////////////*
class OtherBrandsSection extends StatelessWidget {
  const OtherBrandsSection({required this.data, this.currentTitle});

  final Map<String, dynamic> data;
  final String? currentTitle;

  @override
  Widget build(BuildContext context) {
    List<Widget> otherBrandsItems = [];

    //NOTE making otherBrands
    data.forEach((key, value) {
      //NOTE from all data if it is a list(does not have sub category/reached to the end) and is not current category, add to the other brands scroll
      if ((value.runtimeType.toString() == "List<dynamic>" ||
              value.runtimeType.toString() == "_GrowableList<dynamic>") &&
          key != currentTitle)
        otherBrandsItems.add(Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.5, vertical: 0),
          child: RawMaterialButton(
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(15),
            ),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            fillColor: Colors.white,
            constraints: BoxConstraints(minWidth: 50),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListedItemsWithFilterScreen(
                          itemsList: value, title: key, otherBrands: data)));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(key,
                  style:
                      itemBrandFontStyle.copyWith(fontWeight: FontWeight.w600)),
            ),
          ),
        ));
    });

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      // color: Colors.amber.withOpacity(0.1),
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 25),
          FittedBox(
            child: Text("Other brands",
                style: itemBrandFontStyle.copyWith(fontSize: 15)),
          ),
          // const SizedBox(width: 7),
          Expanded(
              child: ListView(
                  scrollDirection: Axis.horizontal, children: otherBrandsItems))
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////*
class FilterAndSortSection extends StatelessWidget {
  FilterAndSortSection(
      {this.data,
      required this.function,
      this.sliderMin,
      this.sliderMax,
      this.sliderMaxRange,
      this.statusCheck,
      required this.sortFunction,
      this.filterText});
  final List? data;
  final Function function;
  final Function sortFunction;

  final int? sliderMin;
  final int? sliderMax;
  final int? sliderMaxRange;
  final bool? statusCheck;
  final String? filterText;

  void sortPopup(BuildContext context, Function function) {
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
                  //NOTE: popup height
                  height: MediaQuery.of(context).size.height / 2,
                  color: Colors.white,
                  child: Column(children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      color: Colors.black,
                      child: Stack(
                        children: [
                          // tileColor: Colors.amber,
                          Align(
                            alignment: Alignment(0, 0),
                            child: Text("Sort",
                                style: itemBrandFontStyle.copyWith(
                                    fontSize: 25, color: Colors.white)),
                          ),
                          Align(
                            alignment: Alignment(1, 1),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(Icons.cancel,
                                    size: 30, color: Colors.white)),
                          )
                        ],
                      ),
                    ),
                    const Divider(height: 0),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              "Highest Value",
                              "Lowest Value",
                              "Highest Rate",
                              "Lowest Rate"
                            ]
                                .map((e) =>
                                    PopupItem(text: e, function: function))
                                .toList()),
                      ),
                    )
                  ]),
                ));
          });
    }
  }

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
                return SearchLimitScreen(
                    filterText: filterText!,
                    sliderMin: sliderMin!,
                    slidermax: sliderMax!,
                    sliderMaxRange: sliderMaxRange!,
                    statusCheckValue: statusCheck!,
                    data: data,
                    function: function);
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
              sortPopup(context, sortFunction);
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

////////////////////////////////////////////////////////////////////////////////*

class PopupItem extends StatelessWidget {
  const PopupItem({this.text, required this.function});

  final Function? function;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => function!(text),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        child: Center(
            child: Text(this.text ?? 'no text',
                style: itemBrandFontStyle.copyWith(fontSize: 20))),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////*
//NOTE filter class
class Filter {
  Filter(
      {this.filterdata = const [],
      this.brandFilter,
      this.maximumFilter,
      this.minimumFilter,
      this.statusFilter,
      this.sortTypeFilter});

  List<dynamic> filterdata;
  String? brandFilter;
  int? minimumFilter;
  int? maximumFilter;
  bool? statusFilter;
  String? sortTypeFilter;

  List<Map<String, dynamic>> Activefilters() {
    var _filters = [
      {"Brand": brandFilter},
      {"Max": maximumFilter},
      {"Min": minimumFilter},
      {"Present": statusFilter},
      {"SortType": sortTypeFilter}
    ];
    List<Map<String, dynamic>> result = [];
    _filters.forEach((element) {
      if ((element.values.first != null) &&
          (element.values.first != false) &&
          (element.values.first != "")) result.add(element);
    });
    return result;
  }

  // filterHandler(List data) {
  filterHandler() {
    List a = filterdata;
    if (minimumFilter != null) {
      a = a.where((element) => element['price'] > minimumFilter).toList();
    }
    if (maximumFilter != null) {
      a = a.where((element) => element['price'] < maximumFilter).toList();
    }
    if (statusFilter == true) {
      a = a.where((element) => element['status'] == "open").toList();
    }
    if (brandFilter != null && brandFilter != "") {
      a = a.where((element) => element['title'].contains(brandFilter)).toList();
    }

    if (sortTypeFilter != null) {
      switch (sortTypeFilter) {
        case ("Highest Value"):
          {
            a.sort((dynamic b, dynamic a) => a['price'].compareTo(b['price']));
            break;
          }

        case ('Lowest Value'):
          {
            a.sort((dynamic a, dynamic b) => a['price'].compareTo(b['price']));
            break;
          }
        case ('Highest Rate'):
          {
            a.sort((dynamic b, dynamic a) => a['rate'].compareTo(b['rate']));
            break;
          }
        case ('Lowest Rate'):
          {
            a.sort((dynamic a, dynamic b) => a['rate'].compareTo(b['rate']));
            break;
          }
      }
    }

    return a;
  }
}
//////////////////////////////////////////////////////////////////////////////
